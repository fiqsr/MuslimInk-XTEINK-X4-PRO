#!/usr/bin/env python3
"""Bundle Jadwal Sholat (MuslimInk) Lua files, extract lossless TrueType clock fonts,
compact large static datasets (cities, duas, ayahs), and generate slim <= 256 KB package."""

import os, sys, re, struct, tempfile, shutil
from PIL import Image, ImageDraw, ImageFont

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(HERE, 'tools'))
sys.path.insert(0, os.path.join(HERE, 'tools', 'vendor'))
import xtpack, xtapp

CLOCK_FONTS = [
    ("Rounded", "/system/fonts/vivoSansClockRounded.ttf", 104, 32, False),
    ("Serif", "/system/fonts/vivoSansClockSerif-Bold.ttf", 100, 31, False),
    ("Bold", "/system/fonts/vivoSansClock-Bold.ttf", 104, 32, False),
    ("Slab", "/system/fonts/vivoSansClockSlab.ttf", 100, 31, False),
    ("Inline", "/system/fonts/vivoSansClockInline.ttf", 104, 32, False),
    ("Arabic", "/system/fonts/NotoNaskhArabic-Bold.ttf", 124, 38, True),
]


def read_text(rel_path):
    with open(os.path.join(HERE, rel_path), "r", encoding="utf-8") as f:
        return f.read()


def write_text(rel_path, content):
    with open(os.path.join(HERE, rel_path), "w", encoding="utf-8") as f:
        f.write(content)


def extract_font_size(font_path, px_size, is_arabic=False):
    f = ImageFont.truetype(font_path, px_size)
    num_chars = "٠١٢٣٤٥٦٧٨٩" if is_arabic else "0123456789"
    boxes = [f.getbbox(c) for c in num_chars]
    cap_top = min(b[1] for b in boxes)
    cap_bot = max(b[3] for b in boxes)
    cap_h = cap_bot - cap_top

    glyphs = {}
    for i, ch in enumerate("0123456789:"):
        source_char = num_chars[i] if i < 10 else ":"
        b = f.getbbox(source_char)
        gw = b[2] - b[0]
        gh = b[3] - b[1]
        img = Image.new("L", (gw, cap_h), 255)
        d = ImageDraw.Draw(img)
        if source_char == ":":
            y_draw = (cap_h - gh) // 2 - b[1]
            d.text((-b[0], y_draw), source_char, fill=0, font=f)
        else:
            d.text((-b[0], -cap_top), source_char, fill=0, font=f)

        rows = []
        for y in range(cap_h):
            runs = []
            x = 0
            while x < gw:
                if img.getpixel((x, y)) < 135:
                    x0 = x
                    while x < gw and img.getpixel((x, y)) < 135:
                        x += 1
                    runs.append((x0, x - x0))
                else:
                    x += 1
            rows.append((y, runs))

        active = {}
        rects = []
        for y, runs in rows:
            new_active = {}
            for x0, rw in runs:
                key = (x0, rw)
                if key in active:
                    ay0, ah = active.pop(key)
                    new_active[key] = (ay0, ah + 1)
                else:
                    new_active[key] = (y, 1)
            for (ax0, arw), (ay0, ah) in active.items():
                rects.append((ax0, ay0, arw, ah))
            active = new_active
        for (ax0, arw), (ay0, ah) in active.items():
            rects.append((ax0, ay0, arw, ah))

        hex_parts = [f"{rx:02X}{ry:02X}{rw:02X}{rh:02X}" for rx, ry, rw, rh in rects]
        glyphs[ch] = (gw, "".join(hex_parts))

    return cap_h, glyphs


def build_packed_fonts(include_sm=True):
    lines = ['local CF = {}']
    for idx, (name, path, big_px, sm_px, is_ar) in enumerate(CLOCK_FONTS, start=1):
        if not os.path.exists(path):
            path = '/system/fonts/Roboto-Regular.ttf'
        bh, bg = extract_font_size(path, big_px, is_ar)

        def pack_size(h, gmap):
            w_str = "".join(chr(gmap[c][0] + 35) for c in "0123456789:")
            cnt_str = "".join(chr(len(gmap[c][1]) // 8 + 35) for c in "0123456789:")
            r_str = ""
            for c in "0123456789:":
                hex_s = gmap[c][1]
                for i in range(0, len(hex_s), 8):
                    r_str += chr(int(hex_s[i:i + 2], 16) + 35)
                    r_str += chr(int(hex_s[i + 2:i + 4], 16) + 35)
                    r_str += chr(int(hex_s[i + 4:i + 6], 16) + 35)
                    r_str += chr(int(hex_s[i + 6:i + 8], 16) + 35)
            return h, w_str, cnt_str, r_str

        b_h, b_w, b_c, b_r = pack_size(bh, bg)
        f_entry = [f'CF[{idx}] = {{ name = "{name}", big = {{ h = {b_h}, w = [=[{b_w}]=], c = [=[{b_c}]=], r = [=[{b_r}]=] }}']
        if include_sm:
            sh, sg = extract_font_size(path, sm_px, is_ar)
            s_h, s_w, s_c, s_r = pack_size(sh, sg)
            f_entry.append(f', sm = {{ h = {s_h}, w = [=[{s_w}]=], c = [=[{s_c}]=], r = [=[{s_r}]=] }}')
        f_entry.append(' }')
        lines.append("".join(f_entry))
    lines.append('return CF')
    return '\n'.join(lines)


FONT_DECODER_LUA = '''
local function unpack_pack(p)
  if p.g then return p end
  local g = {}
  local r_idx = 1
  local r_str = p.r or ''
  for i = 1, 11 do
    local ch = (i <= 10) and tostring(i - 1) or ':'
    local gw = p.w:byte(i) - 35
    local rcount = p.c:byte(i) - 35
    local rects = {}
    for j = 1, rcount do
      rects[j] = {
        r_str:byte(r_idx) - 35,
        r_str:byte(r_idx + 1) - 35,
        r_str:byte(r_idx + 2) - 35,
        r_str:byte(r_idx + 3) - 35,
      }
      r_idx = r_idx + 4
    end
    g[ch] = { w = gw, dec = rects }
  end
  p.g = g
  return p
end
'''


def pack_world_countries(features_content):
    m_start = features_content.find("F.WORLD_COUNTRIES = {")
    m_end = features_content.find("\n}\n", m_start) + 3
    orig_table = features_content[m_start:m_end]

    out_lines = ['''local function _PWC()
  local C = {
    { name = 'Indonesia', is_id = true, method_id = 20, cities_count = '38 Provinsi', cities = {} },
    { name = 'Koordinat Manual (GPS)', name_en = 'Manual GPS Coordinates', is_custom = true, cities_count = 'Lat/Long', cities = {} }
  }
  local function U(cname, mid, ccount, data)
    local list = {}
    for s in data:gmatch('[^;]+') do
      local n, la, lo, tz, m, f, i, fx = s:match('^([^:]+):([^:]+):([^:]+):([^:]+):([^:]+):?([^:]*):?([^:]*):?([^:]*)$')
      if n then
        list[#list + 1] = {
          name = n, lat = tonumber(la), lon = tonumber(lo), tz = tonumber(tz), method = m,
          fajr_ang = tonumber(f) or 18.0, isha_ang = tonumber(i) or 18.0, isha_fixed_min = tonumber(fx)
        }
      end
    end
    C[#C + 1] = { name = cname, method_id = mid, cities_count = ccount, cities = list }
  end
''']
    c_blocks = re.findall(r"\{\s*name\s*=\s*'([^']+)',\s*method_id\s*=\s*(\d+),\s*cities_count\s*=\s*'([^']+)',\s*cities\s*=\s*\{(.*?)\}\s*\}", orig_table, re.DOTALL)
    for cname, mid, ccount, cbody in c_blocks:
        cities = []
        for cm in re.finditer(r"\{\s*name\s*=\s*'([^']+)',\s*lat\s*=\s*([-\d.]+),\s*lon\s*=\s*([-\d.]+),\s*tz\s*=\s*([-\d.]+),\s*method\s*=\s*'([^']+)'(?:,\s*fajr_ang\s*=\s*([-\d.]+))?(?:,\s*isha_ang\s*=\s*([-\d.]+))?(?:,\s*isha_fixed_min\s*=\s*([-\d.]+))?\s*\}", cbody):
            n, la, lo, tz, meth = cm.group(1), cm.group(2), cm.group(3), cm.group(4), cm.group(5)
            f = cm.group(6) or ''
            i = cm.group(7) or ''
            fx = cm.group(8) or ''
            cities.append(f"{n}:{la}:{lo}:{tz}:{meth}:{f}:{i}:{fx}")
        p_str = ";".join(cities)
        out_lines.append(f"  U('{cname}', {mid}, '{ccount}', '{p_str}')\n")

    out_lines.append('  return C\nend\nF.WORLD_COUNTRIES = _PWC()\n')
    return features_content[:m_start] + "".join(out_lines) + features_content[m_end:]


def compact_duas(content):
    helper = "local function D(ci,ce,ti,te,l,ai,ae,s) return {cat_id=ci,cat_en=ce,title_id=ti,title_en=te,latin=l,arti_id=ai,arti_en=ae,src=s} end\n"
    pattern = re.compile(
        r'\{\s*cat_id\s*=\s*([\'\"][^\'\"]+[\'\"]),\s*cat_en\s*=\s*([\'\"][^\'\"]+[\'\"]),\s*title_id\s*=\s*([\'\"][^\'\"]+[\'\"]),\s*title_en\s*=\s*([\'\"][^\'\"]+[\'\"]),\s*latin\s*=\s*([\'\"].*?[\'\"]),\s*arti_id\s*=\s*([\'\"].*?[\'\"]),\s*arti_en\s*=\s*([\'\"].*?[\'\"]),\s*src\s*=\s*([\'\"][^\'\"]+[\'\"])\s*,?\s*\}',
        re.DOTALL
    )
    def repl(m):
        return f"D({m.group(1)},{m.group(2)},{m.group(3)},{m.group(4)},{m.group(5)},{m.group(6)},{m.group(7)},{m.group(8)})"
    return helper + pattern.sub(repl, content)


def compact_ayahs(content):
    helper = "local function A(r,i,e) return {ref=r,id=i,en=e} end\n"
    pattern = re.compile(
        r'\[(\d+)\]\s*=\s*\{\s*ref\s*=\s*([\'\"][^\'\"]+[\'\"]),\s*id\s*=\s*([\'\"].*?[\'\"]),\s*en\s*=\s*([\'\"].*?[\'\"])\s*\}'
    )
    def repl(m):
        return f"[{m.group(1)}]=A({m.group(2)},{m.group(3)},{m.group(4)})"
    return helper + pattern.sub(repl, content)


def tighten_line(line):
    parts = []
    pos = 0
    pattern = re.compile(r'(\[=\[.*?\]=\]|"[^"\\]*(?:\\.[^"\\]*)*"|\'[^\'\\]*(?:\\.[^\'\\]*)*\')')
    for m in pattern.finditer(line):
        non_str = line[pos:m.start()]
        non_str = re.sub(r'[ \t]+', ' ', non_str)
        for op in [',', ';', '{', '}', '(', ')', '=', '+', '*', '<', '>']:
            non_str = non_str.replace(' ' + op, op).replace(op + ' ', op)
        parts.append(non_str)
        parts.append(m.group(0))
        pos = m.end()
    non_str = line[pos:]
    non_str = re.sub(r'[ \t]+', ' ', non_str)
    for op in [',', ';', '{', '}', '(', ')', '=', '+', '*', '<', '>']:
        non_str = non_str.replace(' ' + op, op).replace(op + ' ', op)
    parts.append(non_str)
    return ''.join(parts)


def minify_lua(source):
    out = []
    in_block = False
    for line in source.splitlines():
        l = line.strip()
        if not l: continue
        if in_block:
            if ']]' in l:
                l = l[l.find(']]')+2:].strip()
                in_block = False
            else: continue
        if l.startswith('--[['):
            if ']]' in l[4:]:
                l = l[l.find(']]', 4)+2:].strip()
            else:
                in_block = True
                continue
        if not l: continue
        in_sq, in_dq, cpos = False, False, -1
        for i, ch in enumerate(l):
            if ch == '\\' and (in_sq or in_dq):
                continue
            elif ch == "'" and not in_dq: in_sq = not in_sq
            elif ch == '"' and not in_sq: in_dq = not in_dq
            elif not in_sq and not in_dq and ch == '-' and i+1 < len(l) and l[i+1] == '-':
                cpos = i; break
        if cpos != -1: l = l[:cpos].rstrip()
        if l:
            tight = tighten_line(l)
            if tight: out.append(tight)
    return '\n'.join(out)


def bundle():
    print("Packing TrueType clock fonts...")
    fonts_idx_lua = build_packed_fonts(include_sm=True)
    fonts_lock_lua = build_packed_fonts(include_sm=True)

    core_src = read_text("src/core.lua")
    feat_src = read_text("src/features.lua")
    main_src = read_text("src/main.lua")
    lock_src = read_text("src/lock.lua")

    # Update big_clock to use new fast unpack_pack
    old_big_clock = '''function S.big_clock(gg, hhmm, cx, y, h, cfont_idx)
  local fset = (CF and CF[cfont_idx or 1]) or (CF and CF[1])
  if not fset then return end
  local pack = (h >= 60) and fset.big or fset.sm
  if not pack or not pack.g then return end
  local glyphs = pack.g'''

    new_big_clock = FONT_DECODER_LUA + '''
function S.big_clock(gg, hhmm, cx, y, h, cfont_idx)
  local fset = (CF and CF[cfont_idx or 1]) or (CF and CF[1])
  if not fset then return end
  local raw_pack = (h >= 60) and fset.big or (fset.sm or fset.big)
  if not raw_pack then return end
  local pack = unpack_pack(raw_pack)
  local glyphs = pack.g'''

    core_src_packed = core_src.replace(old_big_clock, new_big_clock)

    # Apply data compactors
    print("Compacting world cities, duas, and daily ayahs...")
    feat_proc = pack_world_countries(feat_src)
    core_proc = core_src_packed

    # Build lean lock_core: keep essential core functions, drop unused UI, updater, monthly cal
    core_lines = core_proc.splitlines()
    kept_lock = []
    lock_langs_injected = False
    for i, l in enumerate(core_lines, 1):
        if 9 <= i <= 145:
            if not lock_langs_injected:
                kept_lock.append('''S.LANGS = {
  id = {
    labels = { 'Imsak', 'Subuh', 'Terbit', 'Dhuha', 'Dzuhur', 'Ashar', 'Maghrib', 'Isya' },
    next_card = 'MENUJU WAKTU SHALAT', next_card_tom = 'MENUJU SHALAT (BESOK)', next_badge = 'Berikutnya',
    sec_today = 'JADWAL HARI INI', sec_tomorrow = 'JADWAL BESOK', now_prayer = 'Saatnya waktu shalat!',
    lock_no_data = 'Jadwal Bulan Ini Belum Ada', lock_no_l1 = 'Buka aplikasi Jadwal Sholat & Wi-Fi', lock_no_l2 = 'untuk memilih lokasi dan unduh jadwal.',
    hari = { 'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu' },
    bulan = { 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember' },
    bulan_short = { 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des' },
    hijri_bulan = { 'Muharram', 'Safar', 'Rabiul Awwal', 'Rabiul Akhir', 'Jumadil Ula', 'Jumadil Akhira', 'Rajab', 'Syaban', 'Ramadhan', 'Syawwal', 'Dzulqadah', 'Dzulhijjah' },
  },
  en = {
    labels = { 'Imsak', 'Fajr', 'Sunrise', 'Dhuha', 'Dhuhr', 'Asr', 'Maghrib', 'Isha' },
    next_card = 'COUNTDOWN TO PRAYER', next_card_tom = 'COUNTDOWN TO PRAYER (TOMORROW)', next_badge = 'Next Up',
    sec_today = "TODAY'S SCHEDULE", sec_tomorrow = "TOMORROW'S SCHEDULE", now_prayer = "It's time to pray!",
    lock_no_data = 'No Prayer Schedule Found', lock_no_l1 = 'Open Jadwal Sholat app & connect Wi-Fi', lock_no_l2 = 'to select location and download schedule.',
    hari = { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' },
    bulan = { 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' },
    bulan_short = { 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' },
    hijri_bulan = { 'Muharram', 'Safar', 'Rabi al-Awwal', 'Rabi al-Thani', 'Jumada al-Ula', 'Jumada al-Akhirah', 'Rajab', 'Shaban', 'Ramadan', 'Shawwal', 'Dhu al-Qadah', 'Dhu al-Hijjah' },
  }
}''')
                lock_langs_injected = True
            continue
        if 277 <= i <= 387: continue
        if 448 <= i <= 458: continue
        if 493 <= i <= 544: continue
        if 916 <= i <= 928: continue
        if 938 <= i <= 942: continue
        if 950 <= i <= 975: continue
        if 976 <= i <= 1098: continue
        if 1143 <= i <= 1189: continue
        if 1415 <= i <= 1426: continue
        if 1578 <= i <= 1647: continue
        if i >= 1758: continue
        kept_lock.append(l)

    kept_lock.append('return S')
    lock_core = '\n'.join(kept_lock)

    header = "-- MuslimInk optimized build\n"
    fonts_idx_wrap = f"local CF = (function()\n{fonts_idx_lua}\nend)()\n\n"
    fonts_lock_wrap = f"local CF = (function()\n{fonts_lock_lua}\nend)()\n\n"
    core_wrap = f"local S = (function()\n{core_proc}\nend)()\n\n"
    feat_wrap = f"local F = (function()\n{feat_proc}\nend)()\n\n"
    lock_core_wrap = f"local S = (function()\n{lock_core}\nend)()\n\n"

    raw_index = header + fonts_idx_wrap + core_wrap + feat_wrap + main_src + "\n"
    raw_lock = header + fonts_lock_wrap + lock_core_wrap + lock_src + "\n"

    print("Minifying and tightening Lua code...")
    min_index = minify_lua(raw_index)
    min_lock = minify_lua(raw_lock)

    write_text("index.lua", min_index + "\n")
    write_text("lockscreen.lua", min_lock + "\n")
    print(f"Bundled index.lua ({len(min_index)} B) and lockscreen.lua ({len(min_lock)} B)")


def make_icon():
    img = Image.new("1", (96, 96), 1)
    d = ImageDraw.Draw(img)
    d.rounded_rectangle((4, 4, 91, 91), radius=14, outline=0, width=3)
    d.rounded_rectangle((8, 8, 87, 87), radius=10, outline=0, width=1)
    d.rectangle((16, 76, 80, 79), fill=0)
    d.rectangle((20, 72, 76, 75), fill=0)
    d.rectangle((28, 54, 68, 72), fill=0)
    d.rectangle((18, 32, 24, 72), fill=0)
    d.rectangle((16, 42, 26, 44), fill=0)
    d.ellipse((18, 28, 24, 35), fill=0)
    d.line((21, 20, 21, 28), fill=0, width=2)
    d.rectangle((72, 32, 78, 72), fill=0)
    d.rectangle((70, 42, 80, 44), fill=0)
    d.ellipse((72, 28, 78, 35), fill=0)
    d.line((75, 20, 75, 28), fill=0, width=2)
    d.ellipse((34, 34, 62, 62), fill=0)
    d.ellipse((26, 46, 38, 58), fill=0)
    d.ellipse((58, 46, 70, 58), fill=0)
    d.line((48, 24, 48, 34), fill=0, width=2)
    d.ellipse((42, 13, 54, 25), fill=0)
    d.ellipse((46, 11, 56, 21), fill=1)
    d.rectangle((43, 60, 53, 72), fill=1)
    d.ellipse((43, 55, 53, 65), fill=1)
    icon_path = os.path.join(HERE, "icon.png")
    img.save(icon_path)
    print("Generated original mosque icon:", icon_path)


if __name__ == "__main__":
    bundle()
    make_icon()
