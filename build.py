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
    ("Inline", "/system/fonts/vivoSansClockInline.ttf", 96, 26, False),
    ("Arabic", "/system/fonts/NotoNaskhArabic-Bold.ttf", 124, 38, True),
]

LOCK_LANGS_DEF = """S.LANGS = {
  id = {
    labels = { 'Imsak', 'Subuh', 'Terbit', 'Dhuha', 'Dzuhur', 'Ashar', 'Maghrib', 'Isya' },
    jumat = 'Jumat',
    next_card = 'MENUJU WAKTU SHALAT', next_card_tom = 'MENUJU SHALAT (BESOK)', next_badge = 'Berikutnya',
    sec_today = 'JADWAL HARI INI', sec_tomorrow = 'JADWAL BESOK', now_prayer = 'Saatnya waktu shalat!',
    lock_no_data = 'Jadwal Bulan Ini Belum Ada', lock_no_l1 = 'Buka aplikasi Jadwal Sholat & Wi-Fi', lock_no_l2 = 'untuk memilih lokasi dan unduh jadwal.',
    hari = { 'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu' },
    bulan = { 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember' },
    hijri_bulan = { 'Muharram', 'Safar', 'Rabiul Awwal', 'Rabiul Akhir', 'Jumadil Ula', 'Jumadil Akhira', 'Rajab', 'Syaban', 'Ramadhan', 'Syawwal', 'Dzulqadah', 'Dzulhijjah' },
  },
  en = {
    labels = { 'Imsak', 'Fajr', 'Sunrise', 'Dhuha', 'Dhuhr', 'Asr', 'Maghrib', 'Isha' },
    jumat = "Jumu'ah",
    next_card = 'COUNTDOWN TO PRAYER', next_card_tom = 'COUNTDOWN TO PRAYER (TOMORROW)', next_badge = 'Next Up',
    sec_today = "TODAY'S SCHEDULE", sec_tomorrow = "TOMORROW'S SCHEDULE", now_prayer = "It's time to pray!",
    lock_no_data = 'No Prayer Schedule Found', lock_no_l1 = 'Open Jadwal Sholat app & connect Wi-Fi', lock_no_l2 = 'to select location and download schedule.',
    hari = { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' },
    bulan = { 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' },
    hijri_bulan = { 'Muharram', 'Safar', 'Rabi al-Awwal', 'Rabi al-Thani', 'Jumada al-Ula', 'Jumada al-Akhirah', 'Rajab', 'Shaban', 'Ramadan', 'Shawwal', 'Dhu al-Qadah', 'Dhu al-Hijjah' },
  }
}"""

LOCK_AYAHS_DEF = """S.AYAH_POOL = {}
S.BUILTIN_AYAHS = {
  [1] = { ref = 'QS. Ash-Sharh: 5', id = 'Maka sesungguhnya bersama kesulitan ada kemudahan,', en = 'For indeed, with hardship [will be] ease.' },
  [2] = { ref = 'QS. Ash-Sharh: 6', id = 'Sesungguhnya bersama kesulitan ada kemudahan.', en = 'Indeed, with hardship [will be] ease.' },
  [3] = { ref = 'QS. Ash-Sharh: 7', id = 'Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain),', en = 'So when you have finished [your duties], then stand up [for worship].' },
  [4] = { ref = 'QS. Ash-Sharh: 8', id = 'Dan hanya kepada Tuhanmulah engkau berharap.', en = 'And to your Lord direct [your] longing.' },
}"""


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
            c_str = "{" + ",".join(str(len(gmap[c][1]) // 8) for c in "0123456789:") + "}"
            r_str = ""
            for c in "0123456789:":
                hex_s = gmap[c][1]
                for i in range(0, len(hex_s), 8):
                    r_str += chr(int(hex_s[i:i + 2], 16) + 35)
                    r_str += chr(int(hex_s[i + 2:i + 4], 16) + 35)
                    r_str += chr(int(hex_s[i + 4:i + 6], 16) + 35)
                    r_str += chr(int(hex_s[i + 6:i + 8], 16) + 35)
            return h, w_str, c_str, r_str

        b_h, b_w, b_c, b_r = pack_size(bh, bg)
        f_entry = [f'CF[{idx}] = {{ name = "{name}", big = {{ h = {b_h}, w = [=[{b_w}]=], c = {b_c}, r = [=[{b_r}]=] }}']
        if include_sm:
            sh, sg = extract_font_size(path, sm_px, is_ar)
            s_h, s_w, s_c, s_r = pack_size(sh, sg)
            f_entry.append(f', sm = {{ h = {s_h}, w = [=[{s_w}]=], c = {s_c}, r = [=[{s_r}]=] }}')
        f_entry.append(' }')
        lines.append("".join(f_entry))
    lines.append('return CF')
    return '\n'.join(lines)


def pack_world_countries(features_content):
    m_start = features_content.find("F.WORLD_COUNTRIES = {")
    m_end = features_content.find("\n}\n", m_start) + 3
    orig_table = features_content[m_start:m_end]

    out_lines = ['''local function _PWC()
  local C = {
    { name = 'Indonesia', is_id = true, method_id = 20, cities_count = '38 Provinsi', cities = {} },
    { name = 'Koordinat Manual (GPS)', name_en = 'Manual GPS Coordinates', is_custom = true, cities_count = 'Lat/Long', cities = {} }
  }
  local function U(cname, mid, data)
    local list = {}
    for s in data:gmatch('[^;]+') do
      local n, la, lo, tz, m, f, i, fx = s:match('^([^:]+):([^:]+):([^:]+):([^:]+):?([^:]*):?([^:]*):?([^:]*):?([^:]*)$')
      if n then
        list[#list + 1] = {
          name = n, lat = tonumber(la), lon = tonumber(lo), tz = tonumber(tz),
          method = (m ~= '' and m) or 'MWL',
          fajr_ang = tonumber(f) or 18.0, isha_ang = tonumber(i) or 18.0, isha_fixed_min = tonumber(fx)
        }
      end
    end
    C[#C + 1] = { name = cname, method_id = mid, cities_count = tostring(#list) .. ' Kota', cities = list }
  end
''']
    c_blocks = re.findall(r"\{\s*name\s*=\s*'([^']+)',\s*method_id\s*=\s*(\d+),\s*cities_count\s*=\s*'([^']+)',\s*cities\s*=\s*\{(.*?)\}\s*\}", orig_table, re.DOTALL)
    for cname, mid, ccount, cbody in c_blocks:
        cities = []
        max_c = 2
        matches = list(re.finditer(r"\{\s*name\s*=\s*'([^']+)',\s*lat\s*=\s*([-\d.]+),\s*lon\s*=\s*([-\d.]+),\s*tz\s*=\s*([-\d.]+),\s*method\s*=\s*'([^']+)'(?:,\s*fajr_ang\s*=\s*([-\d.]+))?(?:,\s*isha_ang\s*=\s*([-\d.]+))?(?:,\s*isha_fixed_min\s*=\s*([-\d.]+))?\s*\}", cbody))
        for cm in matches[:max_c]:
            n, la, lo, tz, meth = cm.group(1), cm.group(2), cm.group(3), cm.group(4), cm.group(5)
            f = cm.group(6) or ''
            i = cm.group(7) or ''
            fx = cm.group(8) or ''
            m_code = '' if meth == 'MWL' else meth
            if fx:
                cities.append(f"{n}:{la}:{lo}:{tz}:{m_code}:{f}:{i}:{fx}")
            elif i or f:
                cities.append(f"{n}:{la}:{lo}:{tz}:{m_code}:{f}:{i}")
            elif m_code:
                cities.append(f"{n}:{la}:{lo}:{tz}:{m_code}")
            else:
                cities.append(f"{n}:{la}:{lo}:{tz}")
        p_str = ";".join(cities)
        out_lines.append(f"  U('{cname}', {mid}, '{p_str}')\n")

    out_lines.append('  return C\nend\nF.WORLD_COUNTRIES = _PWC()\n')
    return features_content[:m_start] + "".join(out_lines) + features_content[m_end:]


def pack_ayahs(core_content):
    m_start = core_content.find("S.BUILTIN_AYAHS = {")
    m_end = core_content.find("\n}\n", m_start) + 3
    orig = core_content[m_start:m_end]

    pattern = re.compile(
        r"\[\d+\]\s*=\s*\{\s*ref\s*=\s*([\"'].*?[\"']),\s*id\s*=\s*([\"'].*?[\"']),\s*en\s*=\s*([\"'].*?[\"'])\s*\}",
        re.DOTALL
    )

    matches = list(pattern.finditer(orig))
    out = [
        "local function _BA(r,i,e) return {ref=r,id=i,en=e} end\nS.BUILTIN_AYAHS = {\n"
    ]
    for m in matches:
        r, i, e = m.groups()
        out.append(f"  _BA({r},{i},{e}),\n")
    out.append("}\n")
    return core_content[:m_start] + "".join(out) + core_content[m_end:]


def strip_function(code, fn_name):
    pattern = re.compile(r"\nfunction\s+" + re.escape(fn_name) + r"\s*\([^)]*\).*?\nend\s*\n", re.DOTALL)
    m = pattern.search(code)
    if m:
        return code[:m.start()] + "\n" + code[m.end():]
    return code


def minify_lua(source):
    pattern = re.compile(
        r"(--\[(=*)\[.*?\]\2\]|--[^\r\n]*|\[(=*)\[.*?\]\3\]|\"(?:[^\"\\]|\\.)*\"|'(?:[^'\\]|\\.)*')",
        re.DOTALL
    )

    def replacer(m):
        tok = m.group(1)
        if tok.startswith("--"):
            return " "
        return tok

    cleaned = pattern.sub(replacer, source)

    out = []
    str_pat = re.compile(r"(\[(=*)\[.*?\]\2\]|\"(?:[^\"\\]|\\.)*\"|'(?:[^'\\]|\\.)*')", re.DOTALL)
    ops = [",", ";", "{", "}", "(", ")", "==", ">=", "<=", "~=", "//", "=", "+", "*", "/", "%", "<", ">", ":", ".."]
    for line in cleaned.splitlines():
        l = line.strip()
        if not l:
            continue
        parts = []
        pos = 0
        for m in str_pat.finditer(l):
            non_str = l[pos:m.start()]
            non_str = re.sub(r"[ \t]+", " ", non_str)
            for op in ops:
                non_str = non_str.replace(" " + op, op).replace(op + " ", op)
            parts.append(non_str)
            parts.append(m.group(0))
            pos = m.end()
        non_str = l[pos:]
        non_str = re.sub(r"[ \t]+", " ", non_str)
        for op in ops:
            non_str = non_str.replace(" " + op, op).replace(op + " ", op)
        parts.append(non_str)
        tight = "".join(parts).strip()
        if tight:
            out.append(tight)

    joinable_ends = (';', ',', '{', '(', '=', '+', '*', '/', '~=', '==', '<=', '>=', '<', '>', '..')
    joinable_starts = (',', '}', ')', ']')
    res = []
    for l in out:
        if res and (any(res[-1].endswith(op) for op in joinable_ends) or any(l.startswith(op) for op in joinable_starts)):
            res[-1] = res[-1] + l
        else:
            res.append(l)

    return "\n".join(res)


def bundle():
    print("Packing TrueType clock fonts...")
    fonts_idx_lua = build_packed_fonts(include_sm=True)
    fonts_lock_lua = build_packed_fonts(include_sm=False)

    core_src = pack_ayahs(read_text("src/core.lua"))
    feat_src = pack_world_countries(read_text("src/features.lua"))
    main_src = read_text("src/main.lua")
    lock_src = read_text("src/lock.lua")

    core_proc = strip_function(core_src, "S.draw_mosque")
    core_proc = strip_function(core_proc, "S.draw_modern_logo")
    core_proc = strip_function(core_proc, "S.ornate_card")
    core_proc = strip_function(core_proc, "S.draw_crescent")
    core_proc = strip_function(core_proc, "S.draw_settings_btn")
    core_proc = strip_function(core_proc, "S.split_quote_lines")
    core_proc = strip_function(core_proc, "S.draw_app_icon")

    # Build safe lock_core using semantic block replacements
    start_langs = core_src.find("S.LANGS = {")
    end_langs = core_src.find("function S.L(cfg)")
    lock_core = core_src[:start_langs] + LOCK_LANGS_DEF + "\n" + core_src[end_langs:]

    start_ayahs = lock_core.find("S.AYAH_POOL = {")
    end_ayahs = lock_core.find("function S.wrap_lines")
    if start_ayahs != -1 and end_ayahs != -1:
        lock_core = lock_core[:start_ayahs] + LOCK_AYAHS_DEF + "\n" + lock_core[end_ayahs:]

    updater_marker = "------------------------------------------------------------------ Auto-Updater Engine"
    if updater_marker in lock_core:
        lock_core = lock_core[:lock_core.find(updater_marker)] + "return S\n"

    p1 = lock_core.find("------------------------------------------------------------------ astronomical prayer calculator")
    p2 = lock_core.find("function S.compute(now_info, cfg)")
    slim_load_month = """function S.load_month(y, m, prov, kab, cfg)
  local raw = S.read(S.cache_name(y, m))
  local parsed = S.parse_cache_text(raw)
  local want = (prov or '') .. '|' .. (kab or '')
  if parsed and (not prov or not kab or parsed.loc == want) then
    return parsed.days
  end
  return parsed and parsed.days or nil
end

"""
    if p1 != -1 and p2 != -1:
        lock_core = lock_core[:p1] + slim_load_month + lock_core[p2:]

    funcs_to_strip = [
        "S.month_len", "S.generate_hijri_month", "S.parse_htog_json", "S.draw_menu_icon", "S.draw_qr",
        "S.segmented_control", "S.force_refresh_quote", "S.draw_mosque", "S.draw_modern_logo",
        "S.draw_crescent", "S.draw_hamburger_btn", "S.draw_settings_btn", "S.ornate_card",
        "S.parse_hcal_cache_text", "S.load_hijri_month", "S.hijri_event_day", "S.hcal_cache_name",
        "S.short", "S.sheet_grabber", "S.split_quote_lines",
        "S.parse_list_json", "S.diamond", "S.save_cfg", "S.delete",
        "S.draw_all_schedule_grid", "S.parse_aladhan_json",
        "S.julian_date", "S.sun_position", "S.calc_day_prayer", "S.generate_month",
        "S.check_for_updates", "S.save_update_package", "S.download_update",
        "S.compare_versions", "S.parse_version_json",
        "S.save_cached_quote", "S.quote_period_key", "S.parse_ayah_json", "S.try_fetch_quote"
    ]
    for fn in funcs_to_strip:
        lock_core = strip_function(lock_core, fn)

    header = "-- MuslimInk optimized build\n"
    fonts_idx_wrap = f"local CF = (function()\n{fonts_idx_lua}\nend)()\n\n"
    fonts_lock_wrap = f"local CF = (function()\n{fonts_lock_lua}\nend)()\n\n"

    print("Minifying and tightening Lua code...")
    min_core = minify_lua(core_proc)
    min_feat = minify_lua(feat_src)
    min_main = minify_lua(main_src)
    min_lock_core = minify_lua(lock_core)
    min_lock_src = minify_lua(lock_src)

    core_wrap = f"local S = (function()\n{min_core}\nend)()\n\n"
    feat_wrap = f"local F = (function()\n{min_feat}\nend)()\n\n"
    lock_core_wrap = f"local S = (function()\n{min_lock_core}\nend)()\n\n"

    min_index = header + fonts_idx_wrap + core_wrap + feat_wrap + min_main + "\n"
    min_lock = header + fonts_lock_wrap + lock_core_wrap + min_lock_src + "\n"

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
