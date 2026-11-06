-- Main application entry for Jadwal Sholat All-in-One (bundled with `S` and `F` by build.py)

local W, H = S.W, S.H
local API_BASE = 'https://equran.id/api/v2/shalat'

local cfg = S.load_cfg()
-- screen: 'main' | 'tasbih' | 'doa' | 'hijri' | 'kiblat' | 'settings' | 'country' | 'city' | 'prov' | 'kab' | 'month' | 'custom_coords'
local screen = 'main'
local prev_screen = 'main'
local hijri_modal = false
local cfont_modal = false
local quote_modal = false
local update_modal = false
local update_info = nil
local update_state = 'idle'
local update_err = nil
local update_saved_path = nil
local update_progress = nil
local update_tab = 'notes'
local about_expanded = false
local settings_scroll_y = 0
local touch_down_y = nil

local coords_state = {
  lat = '-6.2088',
  lon = '106.8456',
  tz = '+7',
  active_field = 1,
  method_idx = 1,
  status_err = nil,
}

local tsb = nil
local doa_idx = 1
local doa_list_mode = false

local country_names = {}
local selected_country = nil
local city_names = {}
local prov_list = {}
local kab_list = {}
local page = 1
local PER_PAGE = 9
local selected_prov = nil

local month_offset = 0 -- 0 = bulan ini, 1 = bulan depan
local cal_hy = 1448
local cal_hm = 5
local selected_hd = 1
local status = nil
local busy_label = nil
local ERR = nil
local pending = nil
local last_min = -1
local last_key = nil
local last_key_ms = 0

local drawer_open = false

local DRAWER_ITEMS = {
  { id = 'main',     icon = 'shalat',   id_lbl = 'Jadwal Shalat',     en_lbl = 'Prayer Times' },
  { id = 'tasbih',   icon = 'tasbih',   id_lbl = 'Tasbih Digital',    en_lbl = 'Digital Tasbih' },
  { id = 'doa',      icon = 'doa',      id_lbl = 'Doa & Dzikir',      en_lbl = 'Daily Duas' },
  { id = 'hijri',    icon = 'hijri',    id_lbl = 'Kalender Hijriah',  en_lbl = 'Hijri Calendar' },
  { id = 'kiblat',   icon = 'kiblat',   id_lbl = 'Arah Kiblat',       en_lbl = 'Qibla Direction' },
  { id = 'settings', icon = 'settings', id_lbl = 'Pengaturan & Info', en_lbl = 'Settings & Info' },
}

local DW = 300
local DX = W - DW

local function now_ms()
  local ok, t = pcall(function() return ctx.clock:now() end)
  if ok and type(t) == 'table' then
    local ms = tonumber(t.monotonic_ms) or tonumber(t.uptime_ms)
    if ms then return math.floor(ms) end
    local e = tonumber(t.epoch_sec)
    if e then return (math.floor(e) % 1000000) * 1000 end
  end
  return 0
end

local function refresh()
  pcall(function() ctx:invalidate() end)
end

local function keep_wifi(ms)
  pcall(function() ctx.net:keep_wifi(ms or (5 * 60 * 1000)) end)
end

local function ensure_tasbih()
  local now_info = S.now(cfg)
  if not tsb then
    tsb = F.load_tasbih(now_info.day)
  elseif tsb.day ~= now_info.day then
    tsb.day = now_info.day
    tsb.today = 0
    F.save_tasbih(tsb)
  end
end

local function inc_tasbih()
  ensure_tasbih()
  tsb.count = (tsb.count or 0) + 1
  tsb.today = (tsb.today or 0) + 1
  tsb.total = (tsb.total or 0) + 1
  F.save_tasbih(tsb)
end

local function switch_dhikr(delta)
  ensure_tasbih()
  local n = #F.DHIKR_LIST
  tsb.idx = ((tsb.idx - 1 + delta) % n) + 1
  tsb.count = 0
  tsb.target = F.DHIKR_LIST[tsb.idx].def_target
  F.save_tasbih(tsb)
end

local function cycle_tasbih_target()
  ensure_tasbih()
  local cur = tsb.target or 33
  local next_t = 33
  for i = 1, #F.TARGETS do
    if F.TARGETS[i] == cur then
      next_t = F.TARGETS[(i % #F.TARGETS) + 1]
      break
    end
  end
  tsb.target = next_t
  F.save_tasbih(tsb)
end

------------------------------------------------------------------ network helpers

local function net_request(opts, label, on_done)
  if pending then
    local age = now_ms() - (pending.since or 0)
    if age >= 0 and age < 35000 then return end
  end
  keep_wifi(5 * 60 * 1000)
  busy_label = label
  local job = { since = now_ms() }
  pending = job
  refresh()

  local ok, err = pcall(function()
    ctx.net:request({
      url = opts.url,
      method = opts.method or 'GET',
      headers = opts.headers or { ['Content-Type'] = 'application/json' },
      body = opts.body,
      timeout_ms = 30000,
    }, function(c, resp)
      if pending ~= job then return end
      pending, busy_label = nil, nil
      local ok_cb, cb_err = pcall(function()
        if type(resp) ~= 'table' or type(resp.body) ~= 'string' or #resp.body == 0 then
          on_done(nil, 'Tidak ada respons dari server')
          return
        end
        local code = tonumber(resp.status) or tonumber(resp.code)
        if code and code >= 400 then
          on_done(nil, 'HTTP ' .. tostring(code))
          return
        end
        on_done(resp.body, nil)
      end)
      if not ok_cb then
        status = 'Galat: ' .. S.short(tostring(cb_err), 38)
      end
      refresh()
    end)
  end)

  if not ok then
    pending, busy_label = nil, nil
    status = 'Gagal koneksi Wi-Fi: ' .. S.short(tostring(err), 30)
    refresh()
  end
end

local function fetch_month(y, m, prov, kab, after_fn)
  local L = S.L(cfg)
  local is_custom = (cfg.country == 'GPS Manual' or cfg.country == 'Kustom' or cfg.prov == 'GPS Manual')
  if is_custom then
    local days = S.generate_month(y, m, cfg)
    if days then
      local want = (prov or '') .. '|' .. (kab or '')
      local body = 'loc=' .. want .. '\n'
      for d = 1, #days do
        local r = days[d]
        body = body .. string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s\n',
          d, r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8])
      end
      S.write(S.cache_name(y, m), body)
      status = (cfg.lang == 'en' and 'Calculated (Offline): ' or 'Dihitung (Offline): ') .. S.short(kab or '', 22)
      if after_fn then after_fn() end
    end
    return
  end
  local is_id = (cfg.country == 'Indonesia' or not cfg.country)
  if is_id then
    local body_req = string.format(
      '{"provinsi":"%s","kabkota":"%s","bulan":%d,"tahun":%d}',
      prov, kab, m, y
    )
    local lbl = (cfg.lang == 'en' and 'Downloading ' or 'Mengunduh jadwal ') .. L.bulan_short[m] .. ' ' .. tostring(y) .. '...'
    net_request({ url = API_BASE, method = 'POST', body = body_req }, lbl, function(body, err)
      if not body then
        status = (cfg.lang == 'en' and 'Download failed: ' or 'Gagal unduh: ') .. tostring(err)
        return
      end
      local cache_s = S.parse_schedule_json(body, prov, kab)
      if not cache_s then
        status = cfg.lang == 'en' and 'Invalid schedule format.' or 'Format data jadwal tidak sesuai.'
        return
      end
      S.write(S.cache_name(y, m), cache_s)
      status = (cfg.lang == 'en' and 'Updated: ' or 'Jadwal diperbarui: ') .. S.short(kab, 22)
      if after_fn then after_fn() end
    end)
  else
    local lat = cfg.lat or 21.4225
    local lon = cfg.lon or 39.8262
    local method = cfg.method_id or 4
    local url = string.format(
      'https://api.aladhan.com/v1/calendar/%d/%d?latitude=%.4f&longitude=%.4f&method=%d',
      y, m, lat, lon, method
    )
    local lbl = (cfg.lang == 'en' and 'Fetching Aladhan ' or 'Mengunduh Aladhan ') .. L.bulan_short[m] .. ' ' .. tostring(y) .. '...'
    net_request({ url = url, method = 'GET' }, lbl, function(body, err)
      if not body then
        status = (cfg.lang == 'en' and 'Download failed: ' or 'Gagal unduh: ') .. tostring(err)
        return
      end
      local cache_s = S.parse_aladhan_json(body, prov, kab)
      if not cache_s then
        status = cfg.lang == 'en' and 'Invalid schedule format.' or 'Format data jadwal tidak sesuai.'
        return
      end
      S.write(S.cache_name(y, m), cache_s)
      status = (cfg.lang == 'en' and 'Updated (Aladhan): ' or 'Jadwal diperbarui (Aladhan): ') .. S.short(kab, 22)
      if after_fn then after_fn() end
    end)
  end
end

local function ensure_schedules(force)
  local now_info = S.now(cfg)
  local info = S.compute(now_info, cfg)
  S.try_fetch_quote(now_info, cfg, info)
  local has_cur = (S.load_month(now_info.y, now_info.m, cfg.prov, cfg.kab, cfg) ~= nil)
  local next_y = (now_info.m == 12) and (now_info.y + 1) or now_info.y
  local next_m = (now_info.m == 12) and 1 or (now_info.m + 1)
  local has_next = (S.load_month(next_y, next_m, cfg.prov, cfg.kab, cfg) ~= nil)

  if force or not has_cur then
    fetch_month(now_info.y, now_info.m, cfg.prov, cfg.kab, function()
      if now_info.d >= 20 and not has_next then
        fetch_month(next_y, next_m, cfg.prov, cfg.kab)
      end
    end)
  elseif now_info.d >= 20 and not has_next then
    fetch_month(next_y, next_m, cfg.prov, cfg.kab)
  end
end

local function fetch_hijri_month(hy, hm, after_fn)
  local L = S.L(cfg)
  local url = string.format('https://api.aladhan.com/v1/hToGCalendar/%d/%d', hm, hy)
  local m_name = L.hijri_bulan[hm] or ('Bulan ' .. tostring(hm))
  local lbl = (cfg.lang == 'en' and 'Fetching Hijri ' or 'Mengunduh Kalender ') .. m_name .. ' ' .. tostring(hy) .. '...'
  net_request({ url = url, method = 'GET' }, lbl, function(body, err)
    if not body then
      status = (cfg.lang == 'en' and 'Download failed: ' or 'Gagal unduh: ') .. tostring(err)
      return
    end
    local cache_s = S.parse_htog_json(body, hy, hm)
    if not cache_s then
      status = cfg.lang == 'en' and 'Invalid Hijri data format.' or 'Format data Hijriah tidak sesuai.'
      return
    end
    S.write(S.hcal_cache_name(hy, hm), cache_s)
    status = (cfg.lang == 'en' and 'Updated: ' or 'Kalender diperbarui: ') .. m_name .. ' ' .. tostring(hy) .. ' H'
    if after_fn then after_fn() end
  end)
end

local function switch_hijri_month(delta)
  cal_hm = cal_hm + delta
  if cal_hm > 12 then
    cal_hm = 1
    cal_hy = cal_hy + 1
  elseif cal_hm < 1 then
    cal_hm = 12
    cal_hy = cal_hy - 1
  end
  selected_hd = 1
  status = nil
  refresh()
end

local function goto_today_hijri()
  local now_info = S.now(cfg)
  local hy, hm, hd = S.effective_hijri(now_info, cfg)
  cal_hy = hy
  cal_hm = hm
  selected_hd = hd
  status = nil
  refresh()
end


local function open_country_list()
  country_names = {}
  for i, c in ipairs(F.WORLD_COUNTRIES) do
    local c_name = (cfg.lang == 'en' and c.name_en) or c.name
    country_names[#country_names + 1] = c_name .. '  •  ' .. c.cities_count
  end
  page = 1
  screen = 'country'
  status = nil
  refresh()
end

local function open_custom_coords_screen()
  coords_state.lat = string.format('%.4f', cfg.lat or -6.2088)
  coords_state.lon = string.format('%.4f', cfg.lon or 106.8456)
  local tz_val = math.floor(cfg.tz or 7)
  coords_state.tz = (tz_val >= 0 and '+' or '') .. tostring(tz_val)
  coords_state.active_field = 1
  coords_state.status_err = nil
  coords_state.method_idx = 1
  for i, m in ipairs(F.CUSTOM_METHODS) do
    if m.mid == cfg.method_id or m.name == cfg.method then
      coords_state.method_idx = i
      break
    end
  end
  prev_screen = screen
  screen = 'custom_coords'
  status = nil
  refresh()
end

local function open_city_list(c_entry)
  selected_country = c_entry
  city_names = {}
  for i, ct in ipairs(c_entry.cities) do
    local tz_s = (ct.tz >= 0) and ('UTC+' .. ct.tz) or ('UTC' .. ct.tz)
    city_names[#city_names + 1] = ct.name .. '  •  ' .. tz_s
  end
  page = 1
  screen = 'city'
  status = nil
  refresh()
end

local function open_prov_list()
  selected_prov = nil
  local cached = S.parse_list_json(S.read('prov.txt'))
  if cached and #cached > 0 then
    prov_list = cached
    page = 1
    screen = 'prov'
    status = nil
    refresh()
    return
  end
  local static_provs = {}
  for p_name, _ in pairs(F.PROV_COORDS) do
    static_provs[#static_provs + 1] = p_name
  end
  table.sort(static_provs)
  prov_list = static_provs
  page = 1
  screen = 'prov'
  status = nil
  refresh()

  local lbl = cfg.lang == 'en' and 'Loading provinces...' or 'Memuat daftar provinsi...'
  net_request({ url = API_BASE .. '/provinsi', method = 'GET' }, lbl, function(body, err)
    if body then
      local list = S.parse_list_json(body)
      if list and #list > 0 then
        S.write('prov.txt', body)
        prov_list = list
        refresh()
      end
    end
  end)
end

local function open_kab_list(prov)
  selected_prov = prov
  local body_req = string.format('{"provinsi":"%s"}', prov)
  local lbl = (cfg.lang == 'en' and 'Loading cities in ' or 'Memuat kab/kota ') .. S.short(prov, 18) .. '...'
  net_request({ url = API_BASE .. '/kabkota', method = 'POST', body = body_req }, lbl, function(body, err)
    if not body then
      kab_list = { 'Kota ' .. prov, 'Kabupaten ' .. prov }
      page = 1
      screen = 'kab'
      status = (cfg.lang == 'en' and 'Offline: ' or 'Mode Offline: ') .. prov
      return
    end
    local list = S.parse_list_json(body)
    if not list or #list == 0 then
      kab_list = { 'Kota ' .. prov }
    else
      kab_list = list
    end
    page = 1
    screen = 'kab'
    status = nil
  end)
end

------------------------------------------------------------------ lockscreen & language toggle

local function toggle_lock()
  local Lck = ctx.lockscreen
  cfg.lock = not cfg.lock
  S.save_cfg(cfg)
  if not Lck then
    status = cfg.lang == 'en' and 'Lockscreen not supported on this firmware.' or 'Firmware ini belum mendukung lockscreen aplikasi.'
    return
  end
  local okd, isdef = pcall(function() return Lck:is_default() end)
  if cfg.lock then
    if not (okd and isdef == true) then
      pcall(function() Lck:set_default() end)
    end
    status = cfg.lang == 'en' and 'Prayer Times Lockscreen enabled.' or 'Lockscreen Jadwal Sholat diaktifkan.'
  else
    if okd and isdef == true then
      pcall(function() Lck:clear_default() end)
    end
    status = cfg.lang == 'en' and 'Prayer Times Lockscreen disabled.' or 'Lockscreen Jadwal Sholat dinonaktifkan.'
  end
end

local function toggle_lang()
  cfg.lang = (cfg.lang == 'en') and 'id' or 'en'
  S.save_cfg(cfg)
  if cfg.lang == 'en' then
    pcall(function()
      local cur = S.load_cached_quote()
      if cur then
        local pool_idx = tonumber(cur.pool_idx) or 1
        local item = S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[pool_idx]
        if item and (not cur.en_text or cur.en_text == '' or S.is_indonesian_text(cur.en_text)) then
          cur.en_text = item.en
          cur.en_ref = item.ref
          cur.en_l1 = item.en
          cur.en_l2 = ''
          S.save_cached_quote(cur, cur.key or 'init')
        end
      end
    end)
  end
  status = (cfg.lang == 'en') and 'Language changed to English (EN).' or 'Bahasa diubah ke Indonesia (ID).'
  pcall(function()
    local now_info = S.now(cfg)
    local info = S.compute(now_info, cfg)
    S.try_fetch_quote(now_info, cfg, info)
  end)
end

local function cycle_cfont()
  cfg.cfont = ((cfg.cfont or 1) % 6) + 1
  S.save_cfg(cfg)
  local fnames_id = { 'Modern Bulat', 'Klasik Serif', 'Tegas Bold', 'Geometris Slab', 'Artistik Inline', 'Angka Arab' }
  local fnames_en = { 'Modern Rounded', 'Classic Serif', 'Bold Geometric', 'Geometric Slab', 'Artistic Inline', 'Arabic Numerals' }
  status = (cfg.lang == 'en')
    and ('Clock font: ' .. fnames_en[cfg.cfont])
    or ('Gaya jam: ' .. fnames_id[cfg.cfont])
end

------------------------------------------------------------------ UI buttons & 5-Tab Bar (Android Material 3 Navigation Bar)

local function draw_btn(gg, x, y, w, h, label, active, fname)
  fname = fname or 'medium'
  -- Material 3 button with crisp paper-white cutout and distinct border
  S.round_rect(gg, x, y, w, h, 10, nil, true, 0)
  S.round_rect(gg, x, y, w, h, 10, active and 2 or 1)
  if active then
    S.round_rect(gg, x + 2, y + 2, w - 4, h - 4, 8, 1)
  end
  local y_off = (fname == 'small') and ((h - 24) // 2) or ((h - 28) // 2)
  S.center_text(gg, x + w // 2, y + y_off, label, fname, w - 12)
end

local function draw_drawer(gg)
  if not drawer_open then return end
  local is_en = (cfg.lang == 'en')
  local now_info = S.now(cfg)

  -- Dim left area with authentic e-ink scrim (every 4px scanlines)
  for dy = 0, H, 4 do
    gg:line(0, dy, DX - 1, dy, { line_width = 1 })
  end

  -- Drawer white panel
  gg:rect(DX, 0, DW, H, { fill = true, color = 0 })
  gg:line(DX, 0, DX, H, { line_width = 2 })

  -- Top header inside drawer: Time, Battery & Close button
  local bat_s = ''
  pcall(function()
    local b = ctx.device:battery()
    if b and b.percent then bat_s = tostring(b.percent) .. '%' end
  end)
  local time_bat = now_info.hhmm .. (bat_s ~= '' and ('  •  ' .. bat_s) or '')
  gg:text(DX + 24, 22, time_bat, { font = S.font('small') })

  -- Close button ✕ at top right
  local cx, cy = W - 32, 28
  gg:line(cx - 7, cy - 7, cx + 7, cy + 7, { line_width = 2 })
  gg:line(cx - 7, cy + 7, cx + 7, cy - 7, { line_width = 2 })

  -- Menu Items (y = 72, 130, 188, 246, 304, 362)
  local start_y = 72
  local item_h = 58
  for i, it in ipairs(DRAWER_ITEMS) do
    local iy = start_y + (i - 1) * item_h
    local is_act = (screen == it.id)
    if is_act then
      -- Active item rounded pill highlight
      S.round_rect(gg, DX + 14, iy, DW - 28, 48, 10, 2)
      S.round_rect(gg, DX + 16, iy + 2, DW - 32, 44, 8, 1)
    end
    -- Icon
    S.draw_menu_icon(gg, it.icon, DX + 36, iy + 24)
    -- Label
    local lbl = is_en and it.en_lbl or it.id_lbl
    gg:text(DX + 58, iy + 12, S.fit_text(lbl, 'medium', DW - 74), { font = S.font('medium') })
  end

  -- Drawer Quick Status Card (y = 436..714, h = 278) to eliminate dead space
  local qx, qy, qw, qh = DX + 14, 436, DW - 28, 278
  S.round_rect(gg, qx, qy, qw, qh, 12, nil, true, 0)
  S.round_rect(gg, qx, qy, qw, qh, 12, 2)
  S.round_rect(gg, qx + 2, qy + 2, qw - 4, qh - 4, 10, 1)

  local info = S.compute(now_info, cfg)
  S.center_text(gg, DX + DW // 2, qy + 14, is_en and 'NEXT PRAYER' or 'SHALAT BERIKUTNYA', 'small')
  if info.has_data and info.next_name then
    S.center_text(gg, DX + DW // 2, qy + 42, info.next_name .. '  ' .. (info.next_time or ''), 'large')
    S.center_text(gg, DX + DW // 2, qy + 80, info.cd_str or '', 'small')
  else
    S.center_text(gg, DX + DW // 2, qy + 54, is_en and 'No prayer data' or 'Belum ada data', 'medium')
  end
  S.divider(gg, qy + 114, qx + 12, qx + qw - 12)
  local sub_loc = (cfg.country == 'Indonesia' or not cfg.country) and (cfg.prov or 'DKI Jakarta') or (cfg.country or 'Indonesia')
  local loc_short = (cfg.kab or 'Kota Jakarta') .. '  •  ' .. sub_loc
  S.center_text(gg, DX + DW // 2, qy + 128, S.fit_text(loc_short, 'small', qw - 24), 'small')
  local hy, hm, hd, hijri_str = S.effective_hijri(now_info, cfg)
  S.center_text(gg, DX + DW // 2, qy + 158, S.fit_text(hijri_str, 'small', qw - 24), 'small')
  local fast_s = F.sunnah_fast_short(now_info.wday, hd, is_en)
  if fast_s then
    S.center_text(gg, DX + DW // 2, qy + 188, '* ' .. fast_s .. ' *', 'small', qw - 24)
  else
    S.center_text(gg, DX + DW // 2, qy + 188, is_en and 'All-in-One Companion' or 'Aplikasi Jadwal & Ibadah', 'small', qw - 24)
  end
  local src_lbl = (cfg.country == 'Indonesia' or not cfg.country) and 'Kemenag RI (Offline)' or ('Global Meeus (' .. (cfg.method or 'MWL') .. ')')
  S.center_text(gg, DX + DW // 2, qy + 224, S.fit_text(src_lbl, 'small', qw - 24), 'small')

  -- Bottom footer inside drawer: Date matching reference photo
  gg:line(DX + 20, 730, W - 20, 730, { line_width = 1 })
  local d_str = string.format('%02d/%02d/%04d  •  %s', now_info.d, now_info.m, now_info.y, now_info.hari)
  gg:text(DX + 24, 750, S.fit_text(d_str, 'small', DW - 40), { font = S.font('small') })
end

local function shalat_action_rect(idx)
  -- 4 action pills in one row on Shalat tab (y = 716, h = 60, perfectly symmetric with 20px margins)
  local bw = 104
  local gap = 8
  local bx = 20 + (idx - 1) * (bw + gap)
  return bx, 716, bw, 60
end

local function shalat_action_labels()
  local is_en = (cfg.lang == 'en')
  if is_en then
    return { 'Location', 'Refresh', 'Monthly', cfg.lock and 'Lock: On' or 'Lock: Off' }
  else
    return { 'Lokasi', 'Perbarui', 'Sebulan', cfg.lock and 'Lock: On' or 'Lock: Off' }
  end
end

local function draw_hijri_modal(gg, now_info, info)
  local L = S.L(cfg)
  local mx, my, mw, mh = 20, 210, W - 40, 270
  gg:rect(mx, my, mw, mh, { fill = true, color = 0 })
  S.card(gg, mx, my, mw, mh, 2, true)

  -- Apple Sheet Grabber pill (━)
  S.sheet_grabber(gg, W // 2, my + 10)

  S.center_text(gg, W // 2, my + 26, L.hijri_title, 'medium', mw - 32)
  S.center_text(gg, W // 2, my + 60, info.hijri_str, 'medium', mw - 32)
  local adj_val = cfg.adj or 0
  local adj_txt = L.hijri_cur .. (adj_val > 0 and ('+' .. adj_val) or tostring(adj_val)) .. L.hijri_day
  S.center_text(gg, W // 2, my + 92, adj_txt, 'small', mw - 32)

  local seg_idx = (adj_val == -1 and 1) or (adj_val == 0 and 2) or (adj_val == 1 and 3) or 2
  local d_lbl = (cfg.lang == 'en') and ' Day' or ' Hari'
  local segments = { '-1' .. d_lbl, 'Reset (0)', '+1' .. d_lbl }
  S.segmented_control(gg, mx + 20, my + 130, mw - 40, 44, segments, seg_idx)

  draw_btn(gg, mx + 80, my + 198, mw - 160, 50, L.btn_done, true, 'medium')
end

local function draw_main_screen(gg)
  local L = S.L(cfg)
  local now_info = S.now(cfg)
  local info = S.compute(now_info, cfg)

  -- Top App Bar: App Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, 'MuslimInk', { font = S.font('large') })
  gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- Date & Location Header (Full 440px width with comfortable breathing room, no overlapping boxes)
  local h_label = info.hijri_str .. (info.after_maghrib and (cfg.lang == 'en' and ' (Night)' or ' (Malam)') or '')
  local sub_loc = (cfg.country == 'Indonesia' or not cfg.country) and (cfg.prov or 'DKI Jakarta') or (cfg.country or 'Indonesia')
  local loc_str = (cfg.kab or 'Kota Jakarta') .. '  •  ' .. sub_loc

  gg:text(20, 58, now_info.date_str, { font = S.font('medium') })
  gg:text(20, 86, S.fit_text(h_label, 'small', W - 40), { font = S.font('small') })
  gg:text(20, 110, S.fit_text(loc_str, 'small', W - 40), { font = S.font('small') })

  if not info.has_data then
    S.card(gg, 20, 140, W - 40, 240, 2, true)
    S.center_text(gg, W // 2, 186, L.no_data_title, 'large', W - 70)
    S.center_text(gg, W // 2, 232, L.no_data_l1, 'medium', W - 70)
    S.center_text(gg, W // 2, 264, L.no_data_l2, 'medium', W - 70)
    S.draw_quote(gg, 420, now_info.day, cfg)
  else
    -- Next Prayer Hero Card (The single signature element of the screen, y = 140, h = 132)
    S.draw_next_card(gg, 20, 140, W - 40, 132, info, cfg.cfont)

    -- Section Subtitle Pill
    local sec_title = info.is_tomorrow and L.sec_tomorrow or L.sec_today
    S.center_text(gg, W // 2, 286, sec_title, 'small')

    -- 8-Row Prayer Schedule List View with continuous vertical timeline connector (y = 308, row_h = 44)
    S.draw_timeline(gg, 20, 308, W - 40, 44, info)
  end

  -- Status / Info Line (y = 676)
  local msg = busy_label or status or ERR
  if msg then
    S.center_text(gg, W // 2, 676, msg, 'small', W - 24)
  else
    local is_id = (cfg.country == 'Indonesia' or not cfg.country)
    local is_custom = (cfg.country == 'GPS Manual' or cfg.country == 'Kustom' or cfg.prov == 'GPS Manual')
    local f_text
    if is_custom then
      f_text = (cfg.lang == 'en' and ('Meeus Solar Offline (' .. (cfg.method or 'GPS') .. ')') or ('Hisab Astronomi Offline (' .. (cfg.method or 'GPS') .. ')'))
    elseif is_id then
      f_text = (cfg.lang == 'en' and 'Source: Kemenag RI (equran.id) • Offline' or 'Sumber: Kemenag RI (equran.id) • Offline')
    else
      f_text = (cfg.lang == 'en' and 'Source: Aladhan API • Meeus Solar Offline' or 'Sumber: Aladhan API • Hisab Astronomi Offline')
    end
    S.center_text(gg, W // 2, 676, f_text, 'small', W - 24)
  end

  -- 4 Shalat Action Pills (y = 716, h = 60, bottom margin 24px)
  local labels = shalat_action_labels()
  for i = 1, 4 do
    local bx, by, bw, bh = shalat_action_rect(i)
    draw_btn(gg, bx, by, bw, bh, labels[i], false, 'small')
  end
end

local function draw_list_screen(gg, title, list, now_info)
  local L = S.L(cfg)
  -- Top App Bar: Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, S.fit_text(title, 'large', W - 144), { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  local total_pages = math.max(1, (#list + PER_PAGE - 1) // PER_PAGE)
  if page > total_pages then page = total_pages end
  local start_idx = (page - 1) * PER_PAGE + 1

  -- Apple Inset Grouped TableView Container (PER_PAGE = 9 rows, y = 60..636, h = 576, r = 14)
  local card_h = PER_PAGE * 64
  S.round_rect(gg, 20, 60, W - 40, card_h, 14, nil, true, 0)
  S.round_rect(gg, 20, 60, W - 40, card_h, 14, 2)

  for i = 1, PER_PAGE do
    local idx = start_idx + i - 1
    local item = list[idx]
    local ry = 60 + (i - 1) * 64
    if i > 1 then
      gg:line(36, ry, W - 36, ry, { line_width = 1 })
    end
    if item then
      gg:text(40, ry + 16, S.fit_text(item, 'medium', W - 100), { font = S.font('medium') })
      S.right_text(gg, W - 38, ry + 16, '>', 'medium')
    end
  end

  local pg_word = (cfg.lang == 'en') and ('Page ' .. tostring(page) .. ' of ' .. tostring(total_pages))
                  or ('Halaman ' .. tostring(page) .. ' dari ' .. tostring(total_pages))
  local info_txt = busy_label or status or pg_word
  S.center_text(gg, W // 2, 654, info_txt, 'small', W - 32)

  -- 3 Navigation Buttons (y = 716, h = 60, bottom margin 24px)
  draw_btn(gg, 20, 716, 136, 60, L.btn_prev, false, 'medium')
  draw_btn(gg, 172, 716, 136, 60, L.btn_cancel, false, 'medium')
  draw_btn(gg, 324, 716, 136, 60, L.btn_next, false, 'medium')
end

local function draw_month_screen(gg, now_info)
  local L = S.L(cfg)
  local ty, tm = now_info.y, now_info.m
  if month_offset == 1 then
    if tm == 12 then ty, tm = ty + 1, 1 else tm = tm + 1 end
  end

  local title = (cfg.lang == 'en' and 'Monthly Schedule' or 'Jadwal Shalat Bulanan')
  gg:text(20, 18, S.fit_text(title, 'large', W - 144), { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  local sub_loc = (cfg.country == 'Indonesia' or not cfg.country) and (cfg.prov or 'DKI Jakarta') or (cfg.country or 'Indonesia')
  local sub_str = (cfg.kab or '') .. ' (' .. sub_loc .. ')  •  ' .. L.bulan[tm] .. ' ' .. tostring(ty)
  gg:text(20, 48, S.fit_text(sub_str, 'small', W - 40), { font = S.font('small') })

  -- Apple Inset Grouped Table View Container (y = 70..718, h = 648, r = 12)
  S.round_rect(gg, 16, 70, W - 32, 648, 12, nil, true, 0)
  S.round_rect(gg, 16, 70, W - 32, 648, 12, 1)

  -- Table Header inside Top Bar
  local hdrs = L.col_headers or { L.col_day, L.labels[1], L.labels[2], L.labels[5], L.labels[6], L.labels[7], L.labels[8] }
  local cols = { 24, 66, 132, 198, 270, 340, 412 }
  for c_i = 1, 7 do
    gg:text(cols[c_i], 73, hdrs[c_i], { font = S.font('small') })
  end
  gg:line(16, 96, W - 16, 96, { line_width = 1 })

  local days_map = S.load_month(ty, tm, cfg.prov, cfg.kab, cfg)
  if not days_map then
    S.card(gg, 32, 220, W - 64, 160, 2, true)
    S.center_text(gg, W // 2, 260, L.month_empty_1 .. L.bulan[tm] .. L.month_empty_2, 'medium', W - 80)
    S.center_text(gg, W // 2, 300, L.month_empty_sub, 'small', W - 80)
  else
    local mlen = S.month_len(ty, tm)
    for d = 1, mlen do
      local row = days_map[d]
      if row then
        local ry = 98 + (d - 1) * 20
        if ty == now_info.y and tm == now_info.m and d == now_info.d then
          -- Apple rounded selection pill highlight
          S.round_rect(gg, 18, ry - 1, W - 36, 21, 6, nil, true, 0)
          S.round_rect(gg, 18, ry - 1, W - 36, 21, 6, 2)
        end
        gg:text(cols[1], ry, string.format('%02d', d), { font = S.font('small') })
        gg:text(cols[2], ry, row[1] or '', { font = S.font('small') })
        gg:text(cols[3], ry, row[2] or '', { font = S.font('small') })
        gg:text(cols[4], ry, row[5] or '', { font = S.font('small') })
        gg:text(cols[5], ry, row[6] or '', { font = S.font('small') })
        gg:text(cols[6], ry, row[7] or '', { font = S.font('small') })
        gg:text(cols[7], ry, row[8] or '', { font = S.font('small') })
      end
    end
  end

  local msg = busy_label or status
  if msg then S.center_text(gg, W // 2, 712, msg, 'small', W - 32) end

  local mo_lbl = month_offset == 0
    and (cfg.lang == 'en' and 'Next Month >' or 'Bulan Depan >')
    or (cfg.lang == 'en' and '< This Month' or '< Bulan Ini')
  draw_btn(gg, 16, 726, 138, 52, L.btn_back, false, 'medium')
  draw_btn(gg, 162, 726, 156, 52, mo_lbl, false, 'small')
  draw_btn(gg, 326, 726, 138, 52, L.btn_download, false, 'medium')
end

function on_draw(c, gg)
  if not gg then return end
  local ok, err = pcall(function()
    gg:clear(0)
    local L = S.L(cfg)
    local now_info = S.now(cfg)
    if screen == 'country' then
      draw_list_screen(gg, cfg.lang == 'en' and 'Select Country' or 'Pilih Negara', country_names, now_info)
    elseif screen == 'custom_coords' then
      F.draw_custom_coords_screen(gg, cfg, now_info, coords_state, draw_btn)
    elseif screen == 'city' then
      local c_title = selected_country and selected_country.name or (cfg.lang == 'en' and 'Select City' or 'Pilih Kota')
      draw_list_screen(gg, c_title, city_names, now_info)
    elseif screen == 'prov' then
      draw_list_screen(gg, L.pick_prov, prov_list, now_info)
    elseif screen == 'kab' then
      draw_list_screen(gg, L.pick_kab .. (selected_prov or ''), kab_list, now_info)
    elseif screen == 'month' then
      draw_month_screen(gg, now_info)
    elseif screen == 'settings' then
      F.draw_settings_screen(gg, cfg, now_info, draw_btn, about_expanded, settings_scroll_y, update_modal or cfont_modal or quote_modal)
    else
      if screen == 'tasbih' then
        ensure_tasbih()
        F.draw_tasbih(gg, cfg, tsb, draw_btn, now_info)
      elseif screen == 'doa' then
        F.draw_doa(gg, cfg, doa_idx, doa_list_mode, draw_btn, now_info)
      elseif screen == 'hijri' then
        F.draw_hijri_screen(gg, cfg, now_info, draw_btn)
      elseif screen == 'hijri_cal' then
        F.draw_hijri_cal_screen(gg, cfg, now_info, cal_hy, cal_hm, selected_hd, draw_btn)
      elseif screen == 'kiblat' then
        F.draw_qibla_screen(gg, cfg, draw_btn, now_info)
      else
        draw_main_screen(gg)
      end

      if hijri_modal then
        local info = S.compute(now_info, cfg)
        draw_hijri_modal(gg, now_info, info)
      end
    end

    if cfont_modal then
      F.draw_cfont_modal(gg, cfg, now_info, draw_btn)
    end

    if quote_modal then
      F.draw_quote_modal(gg, cfg, draw_btn)
    end

    if update_modal then
      F.draw_update_modal(gg, cfg, update_info, update_state, update_err, update_saved_path, draw_btn, update_progress, update_tab)
    end

    -- Draw sliding navigation drawer if open
    if drawer_open then
      draw_drawer(gg)
    end
  end)
  if not ok then
    pcall(function()
      gg:text(10, H - 30, 'Draw err: ' .. S.short(tostring(err), 40), { font = S.font('small') })
    end)
  end
end

------------------------------------------------------------------ input handling

local function open_settings()
  if screen ~= 'settings' then
    prev_screen = screen
    screen = 'settings'
    settings_scroll_y = 0
    status = nil
  end
end

local function check_drawer_tap(x, y)
  if not drawer_open then return false end
  -- Tap on dimmed stipple overlay to close
  if x < DX then
    drawer_open = false
    return true
  end
  -- Tap on close ✕ button at top-right
  if x >= W - 48 and y <= 50 then
    drawer_open = false
    return true
  end
  -- Tap on drawer menu items
  local start_y = 72
  local item_h = 58
  for i, it in ipairs(DRAWER_ITEMS) do
    local iy = start_y + (i - 1) * item_h
    if y >= iy and y < iy + 52 then
      screen = it.id
      drawer_open = false
      doa_list_mode = false
      status = nil
      return true
    end
  end
  -- Tap on quick status card opens main shalat screen
  if y >= 436 and y <= 714 then
    screen = 'main'
    drawer_open = false
    status = nil
    return true
  end
  -- Tap inside drawer panel consumed
  return true
end

local function check_hijri_modal_tap(x, y)
  if not hijri_modal then return false end
  local mx, my, mw, mh = 20, 210, W - 40, 270
  local by = my + 130
  local bh = 44
  if y >= by and y < by + bh and x >= mx + 20 and x <= mx + mw - 20 then
    local seg_w = (mw - 40) / 3
    local seg = math.floor((x - (mx + 20)) / seg_w) + 1
    if seg == 1 then
      cfg.adj = (cfg.adj or 0) - 1
    elseif seg == 2 then
      cfg.adj = 0
    elseif seg == 3 then
      cfg.adj = (cfg.adj or 0) + 1
    end
    S.save_cfg(cfg)
    return true
  end
  if y >= my + 196 and y < my + 252 and x >= mx + 80 and x < mx + mw - 80 then
    hijri_modal = false
    return true
  end
  if x < mx or x > mx + mw or y < my or y > my + mh then
    hijri_modal = false
  end
  return true
end

local function check_cfont_modal_tap(x, y)
  if not cfont_modal then return false end
  local mx, my, mw, mh = 20, 84, W - 40, 632

  -- Close button ✕ at top right
  if x >= mx + mw - 52 and x <= mx + mw and y >= my + 14 and y <= my + 54 then
    cfont_modal = false
    return true
  end

  -- Bottom Done / Close button
  if y >= my + mh - 58 and y <= my + mh - 8 and x >= mx + 20 and x <= mx + mw - 20 then
    cfont_modal = false
    return true
  end

  -- Tap on one of the 6 font rows
  for i = 1, 6 do
    local ry = my + 78 + (i - 1) * 78
    if y >= ry and y < ry + 74 and x >= mx + 12 and x <= mx + mw - 12 then
      cfg.cfont = i
      S.save_cfg(cfg)
      local is_en = (cfg.lang == 'en')
      local fnames_id = { 'Modern Bulat', 'Klasik Serif', 'Tegas Bold', 'Geometris Slab', 'Artistik Inline', 'Angka Arab' }
      local fnames_en = { 'Modern Rounded', 'Classic Serif', 'Bold Geometric', 'Geometric Slab', 'Artistic Inline', 'Arabic Numerals' }
      status = (is_en and 'Clock font: ' or 'Gaya jam: ') .. (is_en and fnames_en[i] or fnames_id[i])
      cfont_modal = false
      return true
    end
  end

  -- Tap outside modal dismisses
  if x < mx or x > mx + mw or y < my or y > my + mh then
    cfont_modal = false
    return true
  end

  return true
end

local function check_quote_modal_tap(x, y)
  if not quote_modal then return false end
  local mx, my, mw, mh = 20, 68, W - 40, 636

  -- Close button ✕ at top right
  if x >= mx + mw - 50 and x <= mx + mw and y >= my + 8 and y <= my + 50 then
    quote_modal = false
    return true
  end

  -- Bottom Done / Close button
  if y >= my + mh - 58 and y <= my + mh - 8 and x >= mx + 20 and x <= mx + mw - 20 then
    quote_modal = false
    return true
  end

  -- Tap on one of the 4 quote refresh options
  for i = 1, 4 do
    local ry = my + 72 + (i - 1) * 70
    if y >= ry and y < ry + 64 and x >= mx + 12 and x <= mx + mw - 12 then
      cfg.qrefresh = i
      S.save_cfg(cfg)
      local is_en = (cfg.lang == 'en')
      local qref_names_id = { 'Tiap Hari', 'Tiap Waktu Shalat', 'Tiap Jam', 'Offline Saja' }
      local qref_names_en = { 'Daily', 'Prayer Times', 'Hourly', 'Offline Only' }
      status = (is_en and 'Ayah refresh: ' or 'Rotasi ayat: ') .. (is_en and qref_names_en[i] or qref_names_id[i])
      local now_info = S.now(cfg)
      local info = S.compute(now_info, cfg)
      S.try_fetch_quote(now_info, cfg, info)
      return true
    end
  end

  -- Manual Refresh Action Button [ 🔄 Ganti Ayat Sekarang (Test) ]
  local dy = my + 358
  local by = dy + 152
  if y >= by and y <= by + 46 and x >= mx + 16 and x <= mx + mw - 16 then
    local is_en = (cfg.lang == 'en')
    status = is_en and 'Fetching new ayah...' or 'Mengunduh ayat baru...'
    refresh()
    local now_info = S.now(cfg)
    local info = S.compute(now_info, cfg)
    keep_wifi(15000)
    S.force_refresh_quote(now_info, cfg, info, function(ok, res)
      if ok then
        status = is_en and 'Ayah updated successfully!' or 'Ayat berhasil diperbarui!'
      else
        status = is_en and 'Local quote rotated' or 'Ayat lokal dirotasi'
      end
      refresh()
    end)
    return true
  end

  -- Tap outside modal dismisses
  if x < mx or x > mx + mw or y < my or y > my + mh then
    quote_modal = false
    return true
  end

  return true
end

local function check_update_modal_tap(x, y)
  if not update_modal then return false end
  local mx, my, mw, mh = 16, 20, W - 32, 760

  -- Close button (✕) at top right
  if x >= mx + mw - 46 and x <= mx + mw and y >= my + 4 and y <= my + 46 then
    if update_state ~= 'downloading' then
      update_modal = false
      refresh()
      return true
    end
  end

  if update_state == 'checking' then
    -- Cancel button
    local b_cancel_y = my + mh - 56
    if y >= b_cancel_y and y <= b_cancel_y + 42 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      status = (cfg.lang == 'en') and 'Check cancelled.' or 'Pemeriksaan dibatalkan.'
      refresh()
      return true
    end

  elseif update_state == 'up_to_date' then
    -- [ Selesai / Tutup ] button
    local b_close_y = my + mh - 56
    if y >= b_close_y and y <= b_close_y + 42 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      refresh()
      return true
    end

  elseif update_state == 'idle' then
    -- Segmented tab tap: [ Catatan Rilis ] vs [ Scan QR HP ]
    local tab_y = my + 144
    if y >= tab_y and y <= tab_y + 38 and x >= mx + 16 and x <= mx + mw - 16 then
      local mid_x = mx + mw // 2
      if x < mid_x then
        update_tab = 'notes'
      else
        update_tab = 'qr'
      end
      refresh()
      return true
    end

    -- Button 1: [ Unduh & Simpan ke SD Card ]
    local b1_y = my + mh - 110
    if y >= b1_y and y <= b1_y + 44 and x >= mx + 20 and x <= mx + mw - 20 then
      update_state = 'downloading'
      update_err = nil
      local exp_total = (update_info and update_info.size_bytes) or 427680
      update_progress = { current = 0, total = exp_total }
      local is_en = (cfg.lang == 'en')
      status = is_en and 'Downloading update package...' or 'Mengunduh berkas pembaruan...'
      refresh()
      S.download_update(update_info, function(cur, tot)
        update_progress = { current = cur, total = tot }
        refresh()
      end, function(ok, saved_path, err)
        if ok then
          update_state = 'done'
          update_progress = { current = exp_total, total = exp_total }
          update_saved_path = saved_path or 'XTApps/muslimink/files/muslimink_update.xtapp'
          status = is_en and 'Download complete! Saved to app storage.' or 'Unduhan selesai! Tersimpan di folder aplikasi.'
          pcall(function()
            if ctx and ctx.system and ctx.system.open then
              ctx.system:open(update_saved_path)
            end
          end)
        else
          update_state = 'error'
          update_err = err or (is_en and 'Download failed' or 'Gagal mengunduh')
          status = update_err
        end
        refresh()
      end)
      return true
    end

    -- Button 2: [ Nanti / Tutup ]
    local b2_y = my + mh - 56
    if y >= b2_y and y <= b2_y + 42 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      refresh()
      return true
    end

  elseif update_state == 'downloading' then
    -- Cancel button
    local b_cancel_y = my + mh - 56
    if y >= b_cancel_y and y <= b_cancel_y + 42 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      status = (cfg.lang == 'en') and 'Download cancelled.' or 'Unduhan dibatalkan.'
      refresh()
      return true
    end

  elseif update_state == 'done' then
    -- Button 1: [ Keluar Aplikasi & Pasang ]
    local b1_y = my + mh - 110
    if y >= b1_y and y <= b1_y + 44 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      pcall(function()
        if ctx and ctx.system and ctx.system.open then
          ctx.system:open(update_saved_path or 'XTApps/muslimink/files/muslimink_update.xtapp')
        end
      end)
      pcall(function() ctx:quit() end)
      return true
    end

    -- Button 2: [ Tutup ]
    local b2_y = my + mh - 56
    if y >= b2_y and y <= b2_y + 42 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      refresh()
      return true
    end

  elseif update_state == 'error' then
    -- Button 0: [ Unduh Lewat HP (Scan QR) ] (y = my + mh - 164)
    local b0_y = my + mh - 164
    if y >= b0_y and y <= b0_y + 44 and x >= mx + 20 and x <= mx + mw - 20 then
      update_tab = 'qr'
      update_state = 'idle'
      update_err = nil
      refresh()
      return true
    end

    -- Button 1: [ Coba Lagi di Perangkat ] (y = my + mh - 110)
    local b1_y = my + mh - 110
    if y >= b1_y and y <= b1_y + 44 and x >= mx + 20 and x <= mx + mw - 20 then
      update_state = 'downloading'
      update_err = nil
      local exp_total = (update_info and update_info.size_bytes) or 427680
      update_progress = { current = 0, total = exp_total }
      local is_en = (cfg.lang == 'en')
      status = is_en and 'Downloading update package...' or 'Mengunduh berkas pembaruan...'
      refresh()
      S.download_update(update_info, function(cur, tot)
        update_progress = { current = cur, total = tot }
        refresh()
      end, function(ok, saved_path, err)
        if ok then
          update_state = 'done'
          update_progress = { current = exp_total, total = exp_total }
          update_saved_path = saved_path or '/sdcard/muslimink.xtapp'
          status = is_en and 'Download complete! Saved to SD Card.' or 'Unduhan selesai! Tersimpan di SD Card.'
        else
          update_state = 'error'
          update_err = err or (is_en and 'Download failed' or 'Gagal mengunduh')
          status = update_err
        end
        refresh()
      end)
      return true
    end

    -- Button 2: [ Tutup ] (y = my + mh - 56)
    local b2_y = my + mh - 56
    if y >= b2_y and y <= b2_y + 42 and x >= mx + 20 and x <= mx + mw - 20 then
      update_modal = false
      refresh()
      return true
    end
  end

  -- Tap outside modal dismisses (only when not actively downloading)
  if (x < mx or x > mx + mw or y < my or y > my + mh) and update_state ~= 'downloading' then
    update_modal = false
    refresh()
    return true
  end

  return true
end

local function handle_tap_settings(x, y)
  -- 1. Top App Bar (y = 0..56)
  if y <= 56 then
    -- Top-right Hamburger ☰ button (consistent across all screens)
    if y >= 2 and y <= 54 and x >= W - 64 then
      drawer_open = true
      return
    end

    -- Top-right Clock text opens font picker modal
    if y >= 2 and y <= 54 and x >= W - 144 and x < W - 64 then
      cfont_modal = true
      return
    end
    return
  end

  -- 2. Fixed Bottom Dock (y = 726..800)
  if y >= 726 and y <= 800 then
    if x >= 20 and x <= W - 20 then
      screen = prev_screen or 'main'
      settings_scroll_y = 0
      return
    end
    return
  end

  -- 3. Middle Scrollable Content (y = 57..725)
  local cy = y + settings_scroll_y

  -- 8 Setting Rows in Apple Inset Grouped card 1 (y = 66..610, row_h = 68)
  if cy >= 66 and cy < 66 + 544 and x >= 20 and x <= W - 20 then
    local i = (cy - 66) // 68 + 1
    if i == 1 then
      -- Segmented control [ ID | EN ] (x = W - 142, w = 106)
      if x >= W - 142 and x < W - 142 + 53 then
        if cfg.lang ~= 'id' then toggle_lang() end
      elseif x >= W - 142 + 53 and x <= W - 36 then
        if cfg.lang ~= 'en' then toggle_lang() end
      else
        toggle_lang()
      end
    elseif i == 2 then
      open_country_list()
    elseif i == 3 then
      cfont_modal = true
    elseif i == 4 then
      -- Segmented control [ -1 | 0 | +1 ] (x = W - 176, w = 140)
      if x >= W - 176 and x < W - 176 + 47 then
        cfg.adj = -1
      elseif x >= W - 176 + 47 and x < W - 176 + 93 then
        cfg.adj = 0
      elseif x >= W - 176 + 93 and x <= W - 36 then
        cfg.adj = 1
      else
        cfg.adj = ((cfg.adj or 0) + 2) % 3 - 1
      end
      S.save_cfg(cfg)
    elseif i == 5 then
      -- Segmented control [ 00:00 | Maghrib ] (x = W - 200, w = 180)
      if x >= W - 200 and x < W - 200 + 90 then
        cfg.maghrib = false
      elseif x >= W - 200 + 90 and x <= W - 20 then
        cfg.maghrib = true
      else
        cfg.maghrib = not (cfg.maghrib ~= false)
      end
      S.save_cfg(cfg)
    elseif i == 6 then
      -- Segmented control [ OFF | ON ] (x = W - 146, w = 110)
      if x >= W - 146 and x < W - 146 + 55 then
        if cfg.lock then toggle_lock() end
      elseif x >= W - 146 + 55 and x <= W - 36 then
        if not cfg.lock then toggle_lock() end
      else
        toggle_lock()
      end
    elseif i == 7 then
      quote_modal = true
    elseif i == 8 then
      local is_en = (cfg.lang == 'en')
      update_modal = true
      update_state = 'checking'
      update_err = nil
      status = is_en and 'Checking for updates on GitHub...' or 'Memeriksa pembaruan di GitHub...'
      refresh()
      S.check_for_updates(cfg, function(has_update, u_info, err)
        if has_update and u_info then
          update_info = u_info
          update_state = 'idle'
          update_err = nil
          update_modal = true
          status = is_en and ('New version available: v' .. u_info.version) or ('Versi baru tersedia: v' .. u_info.version)
        elseif err then
          update_state = 'error'
          update_err = tostring(err)
          update_modal = true
          status = is_en and ('Update check failed: ' .. tostring(err)) or ('Gagal cek pembaruan: ' .. tostring(err))
        else
          local cur_v = S.APP_VERSION
          update_state = 'up_to_date'
          update_info = u_info or { version = cur_v }
          update_err = nil
          update_modal = true
          status = is_en and ('MuslimInk is up to date (v' .. cur_v .. ').') or ('MuslimInk sudah versi terbaru (v' .. cur_v .. ').')
        end
        refresh()
      end)
    end
    return
  end

  -- Apple Disclosure Group / Accordion tap toggle (Card 2 Header, y = 622..686)
  if cy >= 622 and cy <= 622 + 64 and x >= 20 and x <= W - 20 then
    about_expanded = not about_expanded
    if not about_expanded then
      settings_scroll_y = 0
    else
      settings_scroll_y = 180
    end
    return
  end
end

local function handle_tap_main(x, y)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end

  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end

  -- Tap on Date / Hijri date info opens the Hijriah & Islamic Calendar tab
  if y >= 54 and y <= 134 then
    screen = 'hijri'
    return
  end

  -- Tap on Hero Card prayer time clock cycles clock font
  if y >= 140 and y <= 272 and x >= W - 150 then
    cfont_modal = true
    return
  end

  -- Check 4 Shalat quick action buttons
  for i = 1, 4 do
    local bx, by, bw, bh = shalat_action_rect(i)
    if x >= bx and x < bx + bw and y >= by and y < by + bh then
      status = nil
      if i == 1 then
        open_country_list()
      elseif i == 2 then
        ensure_schedules(true)
      elseif i == 3 then
        month_offset = 0
        screen = 'month'
      elseif i == 4 then
        toggle_lock()
      end
      return
    end
  end
end

local function handle_tap_tasbih(x, y)
  ensure_tasbih()
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end
  -- Top Dhikr Card: tap left half for prev dhikr, right half for next dhikr
  if y >= 56 and y <= 216 then
    if x < W // 2 then switch_dhikr(-1) else switch_dhikr(1) end
    return
  end
  -- 4 Control Buttons row (y = 570..635)
  if y >= 570 and y <= 635 then
    if x >= 20 and x < 128 then
      switch_dhikr(-1)
    elseif x >= 128 and x < 236 then
      switch_dhikr(1)
    elseif x >= 236 and x < 352 then
      cycle_tasbih_target()
    elseif x >= 352 and x <= 460 then
      tsb.count = 0
      F.save_tasbih(tsb)
    end
    return
  end
  -- Tap anywhere on 33-Bead Ring (y = 220..545) or Primary Count Button (y = 640..780)
  if (y >= 220 and y <= 545) or (y >= 640 and y <= 780) then
    inc_tasbih()
  end
end

local function handle_tap_doa(x, y)
  local total = #F.DUA_LIST
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end
  if doa_list_mode then
    if y >= 60 and y < 60 + total * 63 and x >= 20 and x <= W - 20 then
      local idx = (y - 60) // 63 + 1
      if idx >= 1 and idx <= total then
        doa_idx = idx
        doa_list_mode = false
      end
      return
    end
    if y >= 706 and y <= 780 then
      doa_list_mode = false
      return
    end
    return
  end
  -- Bottom 3 buttons (y = 710..780)
  if y >= 710 and y <= 780 then
    if x >= 20 and x < 156 then
      doa_idx = ((doa_idx - 2) % total) + 1
    elseif x >= 172 and x < 308 then
      doa_list_mode = true
    elseif x >= 324 and x <= 460 then
      doa_idx = (doa_idx % total) + 1
    end
  end
end

local function handle_tap_hijri(x, y)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end
  -- Tapping top Hijri card opens Hijri adjustment modal
  if y >= 64 and y <= 190 then
    hijri_modal = true
    return
  end
  -- Bottom button opens Full Monthly Hijri Calendar
  if y >= 700 and y <= 780 and x >= 20 and x <= W - 20 then
    local now_info = S.now(cfg)
    local hy, hm, hd = S.effective_hijri(now_info, cfg)
    cal_hy = hy
    cal_hm = hm
    selected_hd = hd
    screen = 'hijri_cal'
    refresh()
    return
  end
end

local function handle_tap_hijri_cal(x, y)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end

  -- Month switcher left / right arrow buttons
  if y >= 56 and y <= 120 then
    if x >= 20 and x <= 80 then
      switch_hijri_month(-1)
      return
    elseif x >= W - 80 and x <= W - 20 then
      switch_hijri_month(1)
      return
    end
  end

  -- Calendar grid cells (y = 162..568, x = 23..457)
  if y >= 162 and y < 568 and x >= 23 and x < 457 then
    local days, days_count = S.load_hijri_month(cal_hy, cal_hm, cfg)
    days_count = days_count or 30
    local first_wd = (days and days[1] and days[1].wd) or 0
    local c = (x - 23) // 62
    local r = (y - 162) // 67
    if c >= 0 and c <= 6 and r >= 0 and r <= 5 then
      local slot = r * 7 + c
      local hd = slot - first_wd + 1
      if hd >= 1 and hd <= days_count then
        selected_hd = hd
        status = nil
        refresh()
        return
      end
    end
  end

  -- Bottom 4 action buttons (y = 710..778)
  if y >= 710 and y <= 778 then
    local bw = (W - 40 - 24) // 4
    for i = 1, 4 do
      local bx = 20 + (i - 1) * (bw + 8)
      if x >= bx and x < bx + bw then
        if i == 1 then
          switch_hijri_month(-1)
        elseif i == 2 then
          goto_today_hijri()
        elseif i == 3 then
          switch_hijri_month(1)
        elseif i == 4 then
          fetch_hijri_month(cal_hy, cal_hm)
        end
        return
      end
    end
  end
end

local function handle_tap_kiblat(x, y)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end
  -- Tapping top city/location card or bottom change button opens country picker
  if (y >= 64 and y <= 138 and x >= 20 and x <= W - 20) or
     (y >= 690 and y <= 760 and x >= 36 and x <= W - 36) then
    open_country_list()
  end
end

local function handle_tap_list(x, y, list, on_pick)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end
  local total_pages = math.max(1, (#list + PER_PAGE - 1) // PER_PAGE)
  if y >= 710 and y <= 780 then
    if x >= 20 and x < 156 then
      if page > 1 then page = page - 1 end
    elseif x >= 172 and x < 308 then
      if screen == 'kab' then
        screen = 'prov'
        page = 1
      elseif screen == 'prov' or screen == 'city' then
        open_country_list()
      else
        screen = prev_screen or 'main'
      end
      status = nil
    elseif x >= 324 and x < 460 then
      if page < total_pages then page = page + 1 end
    end
    return
  end

  if y >= 60 and y < 60 + PER_PAGE * 64 and x >= 20 and x <= W - 20 then
    local row = (y - 60) // 64 + 1
    local idx = (page - 1) * PER_PAGE + row
    local item = list[idx]
    if item then on_pick(item, idx) end
  end
end

local function handle_tap_month(x, y)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end
  if y >= 720 and y <= 782 then
    if x >= 16 and x < 158 then
      screen = 'main'
    elseif x >= 158 and x < 322 then
      month_offset = (month_offset == 0) and 1 or 0
    elseif x >= 322 and x <= W - 16 then
      local now_info = S.now(cfg)
      local ty, tm = now_info.y, now_info.m
      if month_offset == 1 then
        if tm == 12 then ty, tm = ty + 1, 1 else tm = tm + 1 end
      end
      fetch_month(ty, tm, cfg.prov, cfg.kab)
    end
  end
end

local function handle_tap_custom_coords(x, y)
  -- Top-right Hamburger ☰ button
  if y >= 2 and y <= 52 and x >= W - 64 then
    drawer_open = true
    return
  end
  -- Top-right Clock text cycles TrueType clock fonts
  if y >= 2 and y <= 52 and x >= W - 144 and x < W - 64 then
    cfont_modal = true
    return
  end

  -- Card 1: Latitude
  if y >= 60 and y <= 122 and x >= 20 and x <= W - 20 then
    coords_state.active_field = 1
    coords_state.status_err = nil
    refresh()
    return
  end

  -- Card 2: Longitude
  if y >= 128 and y <= 190 and x >= 20 and x <= W - 20 then
    coords_state.active_field = 2
    coords_state.status_err = nil
    refresh()
    return
  end

  -- Card 3: Timezone
  if y >= 196 and y <= 252 and x >= 20 and x <= W - 20 then
    coords_state.active_field = 3
    coords_state.status_err = nil
    refresh()
    return
  end

  -- Card 4: Calculation Method
  if y >= 258 and y <= 306 and x >= 20 and x <= W - 20 then
    local total_m = #F.CUSTOM_METHODS
    coords_state.method_idx = (coords_state.method_idx % total_m) + 1
    coords_state.status_err = nil
    refresh()
    return
  end

  -- Helper to get active key
  local cur_key = (coords_state.active_field == 1 and 'lat')
               or (coords_state.active_field == 2 and 'lon')
               or 'tz'

  -- Numpad (y = 344..696)
  if y >= 344 and y <= 696 and x >= 16 and x <= W - 16 then
    local r = nil
    if y < 428 then r = 1
    elseif y < 516 then r = 2
    elseif y < 604 then r = 3
    else r = 4 end

    local c = nil
    if x < 124 then c = 1
    elseif x < 236 then c = 2
    elseif x < 348 then c = 3
    else c = 4 end

    if r and c then
      local val = coords_state[cur_key] or ''
      coords_state.status_err = nil

      if r == 1 then
        if c == 1 then if #val < 10 then coords_state[cur_key] = val .. '1' end
        elseif c == 2 then if #val < 10 then coords_state[cur_key] = val .. '2' end
        elseif c == 3 then if #val < 10 then coords_state[cur_key] = val .. '3' end
        elseif c == 4 then -- Backspace
          if #val > 0 then coords_state[cur_key] = val:sub(1, -2) end
        end
      elseif r == 2 then
        if c == 1 then if #val < 10 then coords_state[cur_key] = val .. '4' end
        elseif c == 2 then if #val < 10 then coords_state[cur_key] = val .. '5' end
        elseif c == 3 then if #val < 10 then coords_state[cur_key] = val .. '6' end
        elseif c == 4 then -- Plus/Minus toggle
          if val:sub(1, 1) == '-' then
            coords_state[cur_key] = val:sub(2)
          else
            coords_state[cur_key] = '-' .. val
          end
        end
      elseif r == 3 then
        if c == 1 then if #val < 10 then coords_state[cur_key] = val .. '7' end
        elseif c == 2 then if #val < 10 then coords_state[cur_key] = val .. '8' end
        elseif c == 3 then if #val < 10 then coords_state[cur_key] = val .. '9' end
        elseif c == 4 then -- Dot
          if not val:find('%.') and #val < 10 then
            coords_state[cur_key] = (val == '' and '0' or val) .. '.'
          end
        end
      elseif r == 4 then
        if c == 1 then -- Tab
          coords_state.active_field = (coords_state.active_field % 3) + 1
        elseif c == 2 then -- Zero
          if #val < 10 then coords_state[cur_key] = val .. '0' end
        elseif c == 3 then -- Clear
          coords_state[cur_key] = ''
        elseif c == 4 then -- Auto UTC
          local lon_n = tonumber(coords_state.lon) or 0
          local calc_tz = math.floor((lon_n + 7.5) / 15.0)
          if calc_tz < -12 then calc_tz = -12 elseif calc_tz > 14 then calc_tz = 14 end
          coords_state.tz = (calc_tz >= 0 and '+' or '') .. tostring(calc_tz)
        end
      end
      refresh()
      return
    end
  end

  -- Bottom Action Bar (y = 712..780)
  if y >= 712 and y <= 780 then
    if x >= 16 and x <= 152 then -- Cancel
      screen = prev_screen or 'country'
      refresh()
      return
    elseif x >= 160 and x <= W - 16 then -- Save & Compute
      local is_en = (cfg.lang == 'en')
      local lat_n = tonumber(coords_state.lat)
      local lon_n = tonumber(coords_state.lon)
      local tz_n = tonumber(coords_state.tz)

      if not lat_n or lat_n < -90 or lat_n > 90 then
        coords_state.status_err = is_en and 'Invalid Latitude (-90 to +90)' or 'Lintang tidak valid (-90 s.d +90)'
        refresh()
        return
      end
      if not lon_n or lon_n < -180 or lon_n > 180 then
        coords_state.status_err = is_en and 'Invalid Longitude (-180 to +180)' or 'Bujur tidak valid (-180 s.d +180)'
        refresh()
        return
      end
      if not tz_n or tz_n < -12 or tz_n > 14 then
        coords_state.status_err = is_en and 'Invalid Timezone (-12 to +14)' or 'Zona waktu tidak valid (-12 s.d +14)'
        refresh()
        return
      end

      local m_idx = coords_state.method_idx or 1
      local m_info = F.CUSTOM_METHODS[m_idx] or F.CUSTOM_METHODS[1]

      cfg.country = 'GPS Manual'
      cfg.prov = 'GPS Manual'
      cfg.kab = string.format('%.2f°, %.2f°', lat_n, lon_n)
      cfg.lat = lat_n
      cfg.lon = lon_n
      cfg.tz = tz_n
      cfg.fajr_ang = m_info.fajr
      cfg.isha_ang = m_info.isha or 18.0
      cfg.asr_factor = m_info.asr or 1.0
      cfg.isha_fixed_min = m_info.isha_fixed
      cfg.method = m_info.name
      cfg.method_id = m_info.mid
      cfg.has_saved = true
      S.save_cfg(cfg)

      local now_info = S.now(cfg)
      local days = S.generate_month(now_info.y, now_info.m, cfg)
      if days then
        local want = cfg.prov .. '|' .. cfg.kab
        local body = 'loc=' .. want .. '\n'
        for d = 1, #days do
          local r = days[d]
          body = body .. string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s\n',
            d, r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8])
        end
        S.write(S.cache_name(now_info.y, now_info.m), body)
      end

      screen = 'main'
      status = is_en and 'Custom coordinates saved!' or 'Koordinat kustom berhasil disimpan!'
      refresh()
      return
    end
  end
end

local function key_ok(ev)
  if ev.phase and ev.phase ~= 'down' and ev.phase ~= 'press' then return false end
  if ev.repeat_count and tonumber(ev.repeat_count) and tonumber(ev.repeat_count) > 0 then return false end
  local t = now_ms()
  if ev.key == last_key and t > 0 and (t - last_key_ms) >= 0 and (t - last_key_ms) < 160 then
    return false
  end
  last_key, last_key_ms = ev.key, t
  return true
end

function on_input(c, ev)
  ERR = nil
  if type(ev) ~= 'table' then return false end

  if ev.type == 'pointer' then
    if ev.phase == 'down' then
      touch_down_y = tonumber(ev.y) or 0
    end
    if ev.phase == 'up' or ev.gesture == 'tap' then
      local x, y = tonumber(ev.x) or 0, tonumber(ev.y) or 0
      local ok, err = pcall(function()
        if check_drawer_tap(x, y) then return end
        if check_update_modal_tap(x, y) then return end
        if check_cfont_modal_tap(x, y) then return end
        if check_quote_modal_tap(x, y) then return end
        if check_hijri_modal_tap(x, y) then return end

        if screen == 'settings' then
          local is_exp = (about_expanded == true)
          local max_scroll = is_exp and 660 or 0
          if max_scroll > 0 and touch_down_y and math.abs(touch_down_y - y) > 25 then
            local delta = touch_down_y - y
            settings_scroll_y = math.max(0, math.min(max_scroll, settings_scroll_y + delta))
            touch_down_y = nil
            return
          elseif max_scroll > 0 and ev.gesture == 'swipe_up' then
            settings_scroll_y = math.min(max_scroll, settings_scroll_y + 180)
            return
          elseif max_scroll > 0 and ev.gesture == 'swipe_down' then
            settings_scroll_y = math.max(0, settings_scroll_y - 180)
            return
          end
          touch_down_y = nil
        end

        if screen == 'country' then
          handle_tap_list(x, y, country_names, function(item, idx)
            local c = F.WORLD_COUNTRIES[idx]
            if c then
              if c.is_id then
                open_prov_list()
              elseif c.is_custom then
                open_custom_coords_screen()
              else
                open_city_list(c)
              end
            end
          end)
      elseif screen == 'city' then
        handle_tap_list(x, y, city_names, function(item, idx)
          if selected_country and selected_country.cities[idx] then
            local c = selected_country.cities[idx]
            cfg.country = selected_country.name
            cfg.prov = selected_country.name
            cfg.kab = c.name
            cfg.lat = c.lat
            cfg.lon = c.lon
            cfg.tz = c.tz
            cfg.fajr_ang = c.fajr_ang or 18.0
            cfg.isha_ang = c.isha_ang or 18.0
            cfg.asr_factor = c.asr_factor or 1.0
            cfg.isha_fixed_min = c.isha_fixed_min
            cfg.method = c.method or 'MWL'
            cfg.method_id = selected_country.method_id or c.method_id or 3
            cfg.has_saved = true
            S.save_cfg(cfg)
            local now_info = S.now(cfg)
            S.load_month(now_info.y, now_info.m, cfg.prov, cfg.kab, cfg)
            local next_y = (now_info.m == 12) and (now_info.y + 1) or now_info.y
            local next_m = (now_info.m == 12) and 1 or (now_info.m + 1)
            S.load_month(next_y, next_m, cfg.prov, cfg.kab, cfg)
            status = (cfg.lang == 'en' and 'Location set to ' or 'Lokasi disetel ke ') .. c.name .. ' (' .. selected_country.name .. ')'
            screen = prev_screen or 'main'
            ensure_schedules(true)
          end
        end)
      elseif screen == 'prov' then
        handle_tap_list(x, y, prov_list, function(p) open_kab_list(p) end)
      elseif screen == 'kab' then
        handle_tap_list(x, y, kab_list, function(k)
          cfg.country = 'Indonesia'
          cfg.prov = selected_prov
          cfg.kab = k
          local c = F.PROV_COORDS[selected_prov] or F.PROV_COORDS['DKI Jakarta']
          cfg.lat = c[1]
          cfg.lon = c[2]
          if c[2] < 115 then cfg.tz = 7 elseif c[2] < 125 then cfg.tz = 8 else cfg.tz = 9 end
          cfg.fajr_ang = 20.0
          cfg.isha_ang = 18.0
          cfg.asr_factor = 1.0
          cfg.method = 'Kemenag'
          cfg.method_id = 20
          cfg.has_saved = true
          S.save_cfg(cfg)
          local now_info = S.now(cfg)
          S.load_month(now_info.y, now_info.m, cfg.prov, cfg.kab, cfg)
          local next_y = (now_info.m == 12) and (now_info.y + 1) or now_info.y
          local next_m = (now_info.m == 12) and 1 or (now_info.m + 1)
          S.load_month(next_y, next_m, cfg.prov, cfg.kab, cfg)
          screen = prev_screen or 'main'
          ensure_schedules(true)
        end)
      elseif screen == 'month' then
        handle_tap_month(x, y)
      elseif screen == 'custom_coords' then
        handle_tap_custom_coords(x, y)
      elseif screen == 'settings' then
        handle_tap_settings(x, y)
      else
        if screen == 'tasbih' then
          handle_tap_tasbih(x, y)
        elseif screen == 'doa' then
          handle_tap_doa(x, y)
        elseif screen == 'hijri' then
          handle_tap_hijri(x, y)
        elseif screen == 'hijri_cal' then
          handle_tap_hijri_cal(x, y)
        elseif screen == 'kiblat' then
          handle_tap_kiblat(x, y)
        else
          handle_tap_main(x, y)
        end
      end
    end)
    if not ok then ERR = tostring(err) end
    refresh()
    return true
  end
end

  if ev.type == 'key' and key_ok(ev) then
    if ev.key == 'back' then
      if drawer_open then
        drawer_open = false
        refresh()
        return true
      elseif update_modal then
        if update_state ~= 'downloading' then
          update_modal = false
          refresh()
        end
        return true
      elseif cfont_modal then
        cfont_modal = false
        refresh()
        return true
      elseif quote_modal then
        quote_modal = false
        refresh()
        return true
      elseif hijri_modal then
        hijri_modal = false
        refresh()
        return true
      elseif screen == 'hijri_cal' then
        screen = 'hijri'
        refresh()
        return true
      elseif screen == 'settings' then
        screen = prev_screen or 'main'
        settings_scroll_y = 0
        refresh()
        return true
      elseif screen == 'doa' and doa_list_mode then
        doa_list_mode = false
        refresh()
        return true
      elseif screen == 'kab' then
        screen = 'prov'
        page = 1
        refresh()
        return true
      elseif screen == 'prov' or screen == 'city' then
        open_country_list()
        return true
      elseif screen == 'country' then
        screen = prev_screen or 'main'
        refresh()
        return true
      elseif screen == 'custom_coords' then
        screen = prev_screen or 'country'
        refresh()
        return true
      elseif screen ~= 'main' then
        screen = 'main'
        refresh()
        return true
      end
      return false
    elseif screen == 'settings' then
      local is_exp = (about_expanded == true)
      local max_scroll = is_exp and 660 or 0
      if ev.key == 'down' or ev.key == 'right' then
        settings_scroll_y = math.min(max_scroll, settings_scroll_y + 160)
        refresh()
        return true
      elseif ev.key == 'up' or ev.key == 'left' then
        settings_scroll_y = math.max(0, settings_scroll_y - 160)
        refresh()
        return true
      end
    elseif screen == 'tasbih' then
      -- Physical side keys on Tasbih screen: OK / Down / Right increments counter!
      if ev.key == 'ok' or ev.key == 'down' or ev.key == 'right' then
        inc_tasbih()
        refresh()
        return true
      elseif ev.key == 'up' or ev.key == 'left' then
        switch_dhikr(1)
        refresh()
        return true
      end
    elseif screen == 'doa' then
      local total = #F.DUA_LIST
      if ev.key == 'down' or ev.key == 'right' or ev.key == 'ok' then
        doa_idx = (doa_idx % total) + 1
        refresh()
        return true
      elseif ev.key == 'up' or ev.key == 'left' then
        doa_idx = ((doa_idx - 2) % total) + 1
        refresh()
        return true
      end
    elseif (ev.key == 'up' or ev.key == 'left') and (screen == 'prov' or screen == 'kab') then
      if page > 1 then page = page - 1; refresh() end
      return true
    elseif (ev.key == 'down' or ev.key == 'right') and (screen == 'prov' or screen == 'kab') then
      local list = (screen == 'prov') and prov_list or kab_list
      local total_pages = math.max(1, (#list + PER_PAGE - 1) // PER_PAGE)
      if page < total_pages then page = page + 1; refresh() end
      return true
    end
  end

  return false
end

function on_tick(c)
  local now_info = S.now(cfg)
  if now_info.cur_min ~= last_min then
    last_min = now_info.cur_min
    refresh()
  end
end

function on_load(c)
  pcall(function()
    cfg = S.load_cfg()
    local now_info = S.now(cfg)
    last_min = now_info.cur_min
    tsb = F.load_tasbih(now_info.day)
    pcall(function() ctx:set_tick(30000) end)
    pcall(function() ctx:set_tick_rate(30000) end)
    ensure_schedules(false)
  end)
end

function on_leave(c)
  keep_wifi(1)
end
