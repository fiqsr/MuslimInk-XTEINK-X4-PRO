-- Shared core module for Jadwal Sholat (used by both index.lua and lockscreen.lua)
local S = {}

S.W, S.H = 480, 800
S.KEYS = { 'imsak', 'subuh', 'terbit', 'dhuha', 'dzuhur', 'ashar', 'maghrib', 'isya' }
S.IS_WAJIB = { false, true, false, false, true, true, true, true }
S.WAJIB_IDX = { 2, 5, 6, 7, 8 }

S.LANGS = {
  id = {
    code = 'ID',
    app_title = 'MuslimInk',
    labels = { 'Imsak', 'Subuh', 'Terbit', 'Dhuha', 'Dzuhur', 'Ashar', 'Maghrib', 'Isya' },
    jumat = 'Jumat',
    hari = { 'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu' },
    bulan = {
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    },
    bulan_short = { 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des' },
    hijri_bulan = {
      'Muharram', 'Safar', 'Rabiul Awal', 'Rabiul Akhir',
      'Jumadil Awal', 'Jumadil Akhir', 'Rajab', "Sya'ban",
      'Ramadhan', 'Syawal', "Dzulqa'dah", 'Dzulhijjah'
    },
    next_card = 'MENUJU WAKTU SHALAT',
    next_card_tom = 'MENUJU SHALAT (BESOK)',
    next_badge = 'Berikutnya',
    sec_today = 'JADWAL HARI INI',
    sec_tomorrow = 'JADWAL BESOK',
    now_prayer = 'Saatnya waktu shalat!',
    footer_info = 'Sumber: Kemenag RI (equran.id) - Offline',
    btn_loc = 'Lokasi',
    btn_refresh = 'Perbarui',
    btn_month = 'Sebulan',
    btn_lock_on = 'Lock: Aktif',
    btn_lock_off = 'Lock: Mati',
    btn_hijri = 'Atur H',
    btn_prev = '< Seb',
    btn_cancel = 'Batal',
    btn_next = 'Ber >',
    btn_back = 'Kembali',
    btn_next_mo = 'Bln Depan',
    btn_this_mo = 'Bln Ini',
    btn_download = 'Unduh',
    btn_done = 'Selesai',
    hijri_title = 'Koreksi Tanggal Hijriah',
    hijri_cur = 'Koreksi saat ini: ',
    hijri_day = ' hari',
    no_data_title = 'Jadwal Belum Tersedia',
    no_data_l1 = 'Pastikan Wi-Fi menyala, lalu ketuk',
    no_data_l2 = '"Perbarui" atau "Ganti Lokasi" di bawah.',
    lock_no_data = 'Jadwal Bulan Ini Belum Ada',
    lock_no_l1 = 'Buka aplikasi Jadwal Sholat & Wi-Fi',
    lock_no_l2 = 'untuk memilih lokasi dan unduh jadwal.',
    pick_prov = 'Pilih Provinsi',
    pick_kab = 'Kab/Kota: ',
    month_title = 'Jadwal ',
    month_empty_1 = 'Data ',
    month_empty_2 = ' Belum Ada',
    month_empty_sub = 'Ketuk tombol "Unduh" di bawah untuk memuat.',
    col_day = 'Tgl',
    col_headers = { 'Tgl', 'Imsak', 'Subuh', 'Dzuhur', 'Ashar', 'Magrib', 'Isya' },
  },
  en = {
    code = 'EN',
    app_title = 'MuslimInk',
    labels = { 'Imsak', 'Fajr', 'Sunrise', 'Dhuha', 'Dhuhr', 'Asr', 'Maghrib', 'Isha' },
    jumat = "Jumu'ah",
    hari = { 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' },
    bulan = {
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    },
    bulan_short = { 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' },
    hijri_bulan = {
      'Muharram', 'Safar', "Rabi' al-Awwal", "Rabi' al-Thani",
      'Jumada al-Ula', 'Jumada al-Thani', 'Rajab', "Sha'ban",
      'Ramadan', 'Shawwal', "Dhu al-Qi'dah", 'Dhu al-Hijjah'
    },
    next_card = 'NEXT PRAYER TIME',
    next_card_tom = 'NEXT PRAYER (TOMORROW)',
    next_badge = 'Next',
    sec_today = "TODAY'S SCHEDULE",
    sec_tomorrow = "TOMORROW'S SCHEDULE",
    now_prayer = 'Time for prayer!',
    footer_info = 'Source: Kemenag RI (equran.id) - Offline',
    btn_loc = 'Location',
    btn_refresh = 'Refresh',
    btn_month = 'Monthly',
    btn_lock_on = 'Lock: On',
    btn_lock_off = 'Lock: Off',
    btn_hijri = 'Hijri',
    btn_prev = '< Prev',
    btn_cancel = 'Cancel',
    btn_next = 'Next >',
    btn_back = 'Back',
    btn_next_mo = 'Next Mo',
    btn_this_mo = 'This Mo',
    btn_download = 'Fetch',
    btn_done = 'Done',
    hijri_title = 'Hijri Date Adjustment',
    hijri_cur = 'Current offset: ',
    hijri_day = ' day(s)',
    no_data_title = 'Schedule Not Downloaded',
    no_data_l1 = 'Turn on Wi-Fi, then tap "Refresh"',
    no_data_l2 = 'or "Location" below to download.',
    lock_no_data = 'Monthly Schedule Not Found',
    lock_no_l1 = 'Open the Prayer Times app with Wi-Fi on',
    lock_no_l2 = 'to choose your city and download times.',
    pick_prov = 'Select Province',
    pick_kab = 'City/Regency: ',
    month_title = 'Schedule: ',
    month_empty_1 = 'No Data for ',
    month_empty_2 = '',
    month_empty_sub = 'Tap "Fetch" below to download this month.',
    col_day = 'Day',
    col_headers = { 'Day', 'Imsak', 'Fajr', 'Dhuhr', 'Asr', 'Magrib', 'Isha' },
  },
}

function S.L(cfg)
  local code = (cfg and cfg.lang == 'en') and 'en' or 'id'
  return S.LANGS[code]
end

------------------------------------------------------------------ storage & config

function S.read(name)
  local ok, s = pcall(function() return ctx.storage:read(name) end)
  return (ok and type(s) == 'string' and #s > 0) and s or nil
end

function S.write(name, s)
  pcall(function() ctx.storage:write(name, s) end)
end

function S.delete(name)
  pcall(function() if ctx and ctx.storage and ctx.storage.delete then ctx.storage:delete(name) end end)
  pcall(function() if ctx and ctx.storage and ctx.storage.remove then ctx.storage:remove(name) end end)
  pcall(function()
    if os and os.remove then
      os.remove(name)
      os.remove('XTApps/muslimink/files/' .. name)
      os.remove('/sdcard/XTApps/muslimink/files/' .. name)
    end
  end)
end

function S.load_cfg()
  local raw = S.read('settings.txt')
  local t = {}
  if raw then
    for k, v in raw:gmatch('([%w_]+)=([^\r\n]*)') do t[k] = v end
  end
  local cf = tonumber(t.cfont) or 1
  if cf < 1 or cf > 6 then cf = 1 end
  return {
    country = (t.country and t.country ~= '') and t.country or 'Indonesia',
    prov = (t.prov and t.prov ~= '') and t.prov or 'DKI Jakarta',
    kab = (t.kab and t.kab ~= '') and t.kab or 'Kota Jakarta',
    lat = tonumber(t.lat) or -6.21,
    lon = tonumber(t.lon) or 106.85,
    tz = tonumber(t.tz) or 7,
    fajr_ang = tonumber(t.fajr_ang) or 20.0,
    isha_ang = tonumber(t.isha_ang) or 18.0,
    asr_factor = tonumber(t.asr_factor) or 1.0,
    isha_fixed_min = tonumber(t.isha_fixed_min) or nil,
    method = (t.method and t.method ~= '') and t.method or 'Kemenag',
    method_id = tonumber(t.method_id) or 3,
    adj = tonumber(t.adj) or 0,
    lock = (t.lock == 'true'),
    lang = (t.lang == 'en') and 'en' or 'id',
    cfont = cf,
    qrefresh = (tonumber(t.qrefresh) and tonumber(t.qrefresh) >= 1 and tonumber(t.qrefresh) <= 4) and tonumber(t.qrefresh) or 1,
    maghrib = (t.maghrib ~= 'false'),
    has_saved = (raw ~= nil and t.prov ~= nil and t.prov ~= ''),
  }
end

function S.save_cfg(cfg)
  local s = 'country=' .. (cfg.country or 'Indonesia') ..
            '\nprov=' .. (cfg.prov or '') ..
            '\nkab=' .. (cfg.kab or '') ..
            '\nlat=' .. tostring(cfg.lat or -6.21) ..
            '\nlon=' .. tostring(cfg.lon or 106.85) ..
            '\ntz=' .. tostring(cfg.tz or 7) ..
            '\nfajr_ang=' .. tostring(cfg.fajr_ang or 20.0) ..
            '\nisha_ang=' .. tostring(cfg.isha_ang or 18.0) ..
            '\nasr_factor=' .. tostring(cfg.asr_factor or 1.0) ..
            '\nisha_fixed_min=' .. tostring(cfg.isha_fixed_min or '') ..
            '\nmethod=' .. (cfg.method or 'Kemenag') ..
            '\nmethod_id=' .. tostring(cfg.method_id or 3) ..
            '\nadj=' .. tostring(cfg.adj or 0) ..
            '\nlock=' .. tostring(cfg.lock and true or false) ..
            '\nlang=' .. (cfg.lang == 'en' and 'en' or 'id') ..
            '\ncfont=' .. tostring(cfg.cfont or 1) ..
            '\nqrefresh=' .. tostring(cfg.qrefresh or 1) ..
            '\nmaghrib=' .. tostring(cfg.maghrib ~= false)
  S.write('settings.txt', s)
end

------------------------------------------------------------------ date & hijri math

function S.days(y, m, d)
  local yy = m <= 2 and (y - 1) or y
  local era = yy // 400
  local yoe = yy - era * 400
  local doy = (153 * (m + (m > 2 and -3 or 9)) + 2) // 5 + d - 1
  return era * 146097 + yoe * 365 + yoe // 4 - yoe // 100 + doy - 719468
end

function S.civil(z)
  local zz = z + 719468
  local era = zz // 146097
  local doe = zz - era * 146097
  local yoe = (doe - doe // 1460 + doe // 36524 - doe // 146096) // 365
  local doy = doe - (365 * yoe + yoe // 4 - yoe // 100)
  local mp = (5 * doy + 2) // 153
  local d = doy - (153 * mp + 2) // 5 + 1
  local m = mp < 10 and (mp + 3) or (mp - 9)
  return yoe + era * 400 + (m <= 2 and 1 or 0), m, d
end

function S.month_len(y, m)
  if m == 12 then return 31 end
  return S.days(y, m + 1, 1) - S.days(y, m, 1)
end

function S.wday(day)
  return (day + 4) % 7 -- 0 = Minggu .. 6 = Sabtu
end

-- Astronomical New Moon (Meeus Ch. 49) + MABIMS (Kemenag RI) crescent visibility criteria
function S.lunation_start_day(k)
  local T = k / 1236.85
  local jde = 2451550.09766 + 29.530588861 * k
    + 0.00015437 * T * T - 0.000000150 * T * T * T
  local deg2rad = math.pi / 180.0
  local M = (2.5534 + 29.10535670 * k - 0.0000014 * T * T) * deg2rad
  local Mp = (201.5643 + 385.81693528 * k + 0.0107582 * T * T) * deg2rad
  local F = (160.7108 + 390.67050284 * k - 0.0016118 * T * T) * deg2rad
  local corr = -0.40720 * math.sin(Mp) + 0.17241 * math.sin(M)
    + 0.01608 * math.sin(2 * Mp) + 0.01039 * math.sin(2 * F)
    + 0.00739 * math.sin(Mp - M) - 0.00514 * math.sin(Mp + M)
    + 0.00208 * math.sin(2 * M) - 0.00111 * math.sin(Mp - 2 * F)
  local conj_unix_days = (jde + corr) - 2440587.5
  return math.floor(conj_unix_days + 2.04)
end

function S.hijri(day, adj, lang_tbl)
  local L = lang_tbl or S.LANGS.id
  local d = day + (adj or 0)
  local k = math.floor((d + 2440587.5 - 2451550.09766) / 29.530588861)
  while S.lunation_start_day(k + 1) <= d do k = k + 1 end
  while S.lunation_start_day(k) > d do k = k - 1 end
  local hd = d - S.lunation_start_day(k) + 1
  local total_m = k + 1420 * 12 + 9
  local hy = total_m // 12
  local hm = (total_m % 12) + 1
  if hm < 1 then hm = 1 elseif hm > 12 then hm = 12 end
  return hy, hm, hd, tostring(hd) .. ' ' .. L.hijri_bulan[hm] .. ' ' .. tostring(hy) .. ' H'
end

function S.hijri_event_day(hy, hm, hd, adj)
  local k = (hy - 1420) * 12 + (hm - 10)
  return S.lunation_start_day(k) + (hd - 1) - (adj or 0)
end

function S.hcal_cache_name(hy, hm)
  return string.format('hc%04d%02d.txt', hy, hm)
end

function S.generate_hijri_month(hy, hm, adj)
  local k = (hy - 1420) * 12 + (hm - 10)
  local s_d = S.lunation_start_day(k) - (adj or 0)
  local e_d = S.lunation_start_day(k + 1) - (adj or 0)
  local m_days = e_d - s_d
  if m_days < 29 then m_days = 29 elseif m_days > 30 then m_days = 30 end

  local days = {}
  for hd = 1, m_days do
    local u_day = s_d + (hd - 1)
    local gy, gm, gd = S.civil(u_day)
    local wd = S.wday(u_day)
    days[hd] = {
      hd = hd,
      gd = gd,
      gm = gm,
      gy = gy,
      wd = wd,
      u_day = u_day,
      holiday = '',
    }
  end
  return days, m_days
end

function S.parse_htog_json(body, hy, hm)
  if type(body) ~= 'string' then return nil end
  local lines = { '# hcal|' .. tostring(hy) .. '|' .. tostring(hm) }
  local count = 0

  for h_part, g_part in body:gmatch('"hijri"%s*:%s*({.-"method"%s*:%s*"[^\"]-"})%s*,%s*"gregorian"%s*:%s*({.-"lunarSighting"%s*:%s*%a+%s*})') do
    local hd = tonumber(h_part:match('"day"%s*:%s*"0?(%d+)"'))
    local gd = tonumber(g_part:match('"day"%s*:%s*"0?(%d+)"'))
    local gm = tonumber(g_part:match('"month"%s*:%s*{.-"number"%s*:%s*(%d+)'))
    local gy = tonumber(g_part:match('"year"%s*:%s*"(%d+)"'))
    local hols = h_part:match('"holidays"%s*:%s*%[(.-)%]') or ''
    local hol_name = hols:match('"(.-)"') or ''
    if hd and gd and gm and gy then
      lines[#lines + 1] = string.format('%d=%d,%d,%d,%s', hd, gd, gm, gy, hol_name)
      count = count + 1
    end
  end

  if count == 0 then return nil end
  return table.concat(lines, '\n')
end

function S.parse_hcal_cache_text(raw)
  if type(raw) ~= 'string' or #raw == 0 then return nil end
  local hy_s, hm_s = raw:match('^# hcal|(%d+)|(%d+)')
  local hy = tonumber(hy_s)
  local hm = tonumber(hm_s)
  local days = {}
  local count = 0
  for hd_s, rest in raw:gmatch('\n(%d+)=([^\r\n]*)') do
    local hd = tonumber(hd_s)
    if hd then
      local gd_s, gm_s, gy_s, hol = rest:match('^(%d+),(%d+),(%d+),(.*)$')
      local gd = tonumber(gd_s)
      local gm = tonumber(gm_s)
      local gy = tonumber(gy_s)
      if gd and gm and gy then
        local u_day = S.days(gy, gm, gd)
        local wd = S.wday(u_day)
        days[hd] = {
          hd = hd,
          gd = gd,
          gm = gm,
          gy = gy,
          wd = wd,
          u_day = u_day,
          holiday = hol or '',
        }
        count = count + 1
      end
    end
  end
  if count == 0 then return nil end
  return { hy = hy, hm = hm, days = days, count = count }
end

function S.load_hijri_month(hy, hm, cfg)
  local raw = S.read(S.hcal_cache_name(hy, hm))
  local parsed = S.parse_hcal_cache_text(raw)
  if parsed and parsed.hy == hy and parsed.hm == hm then
    return parsed.days, parsed.count
  end
  local days, count = S.generate_hijri_month(hy, hm, cfg and cfg.adj or 0)
  if days and count > 0 then
    local lines = { '# hcal|' .. tostring(hy) .. '|' .. tostring(hm) }
    for hd = 1, count do
      local r = days[hd]
      lines[#lines + 1] = string.format('%d=%d,%d,%d,%s', r.hd, r.gd, r.gm, r.gy, r.holiday or '')
    end
    S.write(S.hcal_cache_name(hy, hm), table.concat(lines, '\n'))
    return days, count
  end
  return nil, 0
end


-- Automatic Maghrib rollover: in Islamic calendar, the new Hijri day begins at Maghrib
function S.effective_hijri(now_info, cfg, today_row)
  local L = S.L(cfg)
  if not today_row then
    local days_cur = S.load_month(now_info.y, now_info.m, cfg and cfg.prov, cfg and cfg.kab)
    today_row = days_cur and days_cur[now_info.d] or nil
  end
  local maghrib_min = (today_row and S.hhmm_to_min(today_row[7])) or (18 * 60)
  local use_maghrib = (cfg == nil or cfg.maghrib ~= false)
  local after_maghrib = use_maghrib and ((now_info.cur_min or 0) >= maghrib_min)
  local eff_day = after_maghrib and (now_info.day + 1) or now_info.day
  local hy, hm, hd, hijri_str = S.hijri(eff_day, cfg and cfg.adj or 0, L)
  return hy, hm, hd, hijri_str, after_maghrib, eff_day
end


function S.now(cfg)
  local L = S.L(cfg)
  local ok, t = pcall(function() return ctx.clock:now() end)
  local e, h, mi, se = 0, 12, 0, 0
  if ok and type(t) == 'table' then
    e = math.floor(tonumber(t.epoch_sec) or 0)
    h = math.floor(tonumber(t.hour) or 12)
    mi = math.floor(tonumber(t.minute) or 0)
    se = math.floor(tonumber(t.second) or 0)
  end
  if e < 1000000000 then
    local d0 = S.days(2026, 11, 5)
    e = d0 * 86400 + h * 3600 + mi * 60 + se
  end
  local off = h * 3600 + mi * 60 + se - (e % 86400)
  if off > 14 * 3600 then off = off - 86400 elseif off < -12 * 3600 then off = off + 86400 end
  off = ((off + 450) // 900) * 900
  local wall = e + off
  local day = wall // 86400
  local y, m, d = S.civil(day)
  local wd = S.wday(day)
  return {
    epoch = e,
    wall = wall,
    day = day,
    y = y,
    m = m,
    d = d,
    wday = wd,
    hari = L.hari[wd + 1],
    hour = h,
    min = mi,
    sec = se,
    cur_min = h * 60 + mi,
    hhmm = string.format('%02d:%02d', h, mi),
    date_str = L.hari[wd + 1] .. ', ' .. tostring(d) .. ' ' .. L.bulan[m] .. ' ' .. tostring(y),
  }
end

------------------------------------------------------------------ API parsing & monthly cache

function S.cache_name(y, m)
  return string.format('j%04d%02d.txt', y, m)
end

function S.parse_list_json(body)
  if type(body) ~= 'string' then return nil end
  local arr = body:match('"data"%s*:%s*%[(.-)%]')
  if not arr then return nil end
  local list = {}
  for item in arr:gmatch('"(.-)"') do
    list[#list + 1] = item
  end
  return #list > 0 and list or nil
end

function S.hhmm_to_min(s)
  if type(s) ~= 'string' then return nil end
  local h, m = s:match('^(%d%d?):(%d%d)$')
  if not h then return nil end
  return tonumber(h) * 60 + tonumber(m)
end

function S.parse_schedule_json(body, prov, kab)
  if type(body) ~= 'string' then return nil end
  local jpart = body:match('"jadwal"%s*:%s*%[(.*)%]}') or body:match('"jadwal"%s*:%s*%[(.*)%]')
  if not jpart then return nil end
  local lines = { 'loc=' .. (prov or '') .. '|' .. (kab or '') }
  local count = 0
  for obj in jpart:gmatch('{(.-)}') do
    local tgl = tonumber(obj:match('"tanggal"%s*:%s*(%d+)'))
    if tgl and tgl >= 1 and tgl <= 31 then
      local times = {}
      local ok_all = true
      for idx = 1, 8 do
        local k = S.KEYS[idx]
        local v = obj:match('"' .. k .. '"%s*:%s*"(%d%d?:%d%d)"')
        if not v then ok_all = false; break end
        times[idx] = v
      end
      if ok_all then
        lines[#lines + 1] = tostring(tgl) .. '=' .. table.concat(times, ',')
        count = count + 1
      end
    end
  end
  if count == 0 then return nil end
  return table.concat(lines, '\n')
end

function S.parse_aladhan_json(body, prov, kab)
  if type(body) ~= 'string' then return nil end
  local lines = { 'loc=' .. (prov or '') .. '|' .. (kab or '') }
  local count = 0

  for timing_str, date_str in body:gmatch('"timings"%s*:%s*{(.-)}.-"gregorian"%s*:%s*{(.-)}') do
    local day_s = date_str:match('"day"%s*:%s*"0?(%d+)"')
    local day = tonumber(day_s)
    if day and day >= 1 and day <= 31 then
      local function get_t(k)
        local v = timing_str:match('"' .. k .. '"%s*:%s*"(%d%d?:%d%d)')
        return v or '--:--'
      end

      local fajr = get_t('Fajr')
      local imsak = get_t('Imsak')
      if imsak == '--:--' and fajr ~= '--:--' then
        local fm = S.hhmm_to_min(fajr)
        if fm then
          local im = (fm - 10 + 1440) % 1440
          imsak = string.format('%02d:%02d', im // 60, im % 60)
        end
      end

      local rise = get_t('Sunrise')
      local dhuha = '--:--'
      if rise ~= '--:--' then
        local rm = S.hhmm_to_min(rise)
        if rm then
          local dm = (rm + 25) % 1440
          dhuha = string.format('%02d:%02d', dm // 60, dm % 60)
        end
      end

      local dhuhr = get_t('Dhuhr')
      local asr = get_t('Asr')
      local maghrib = get_t('Maghrib')
      local isha = get_t('Isha')

      if fajr ~= '--:--' and dhuhr ~= '--:--' and maghrib ~= '--:--' then
        lines[#lines + 1] = string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s',
          day, imsak, fajr, rise, dhuha, dhuhr, asr, maghrib, isha)
        count = count + 1
      end
    end
  end

  if count == 0 then return nil end
  return table.concat(lines, '\n')
end


function S.parse_cache_text(raw)
  if type(raw) ~= 'string' or #raw == 0 then return nil end
  local loc = raw:match('^loc=([^\r\n]+)')
  local days = {}
  local count = 0
  for d_str, rest in raw:gmatch('\n(%d+)=([^\r\n]+)') do
    local d = tonumber(d_str)
    if d then
      local row = {}
      for tm in rest:gmatch('(%d%d?:%d%d)') do
        row[#row + 1] = tm
      end
      if #row == 8 then
        days[d] = row
        count = count + 1
      end
    end
  end
  if count == 0 then return nil end
  return { loc = loc or '', days = days }
end

------------------------------------------------------------------ astronomical prayer calculator (offline global)

local function dsin(d) return math.sin(d * math.pi / 180.0) end
local function dcos(d) return math.cos(d * math.pi / 180.0) end
local function datan2(y, x) return math.atan(y, x) * 180.0 / math.pi end
local function dasin(x)
  if x > 1 then x = 1 elseif x < -1 then x = -1 end
  return math.asin(x) * 180.0 / math.pi
end
local function dacos(x)
  if x > 1 then x = 1 elseif x < -1 then x = -1 end
  return math.acos(x) * 180.0 / math.pi
end

function S.julian_date(y, m, d)
  if m <= 2 then y = y - 1; m = m + 12 end
  local a = math.floor(y / 100)
  local b = 2 - a + math.floor(a / 4)
  return math.floor(365.25 * (y + 4716)) + math.floor(30.6001 * (m + 1)) + d + b - 1524.5
end

function S.sun_position(jd)
  local d_days = jd - 2451545.0
  local g = (357.529 + 0.98560028 * d_days) % 360.0
  local q = (280.459 + 0.98564736 * d_days) % 360.0
  local l = (q + 1.915 * dsin(g) + 0.020 * dsin(2 * g)) % 360.0
  local e = 23.439 - 0.00000036 * d_days
  local ra = datan2(dcos(e) * dsin(l), dcos(l))
  ra = (ra + 360.0) % 360.0
  local dec = dasin(dsin(e) * dsin(l))
  local diff_deg = (q - ra + 180.0) % 360.0 - 180.0
  local eqt = diff_deg * 4.0
  return dec, eqt
end

function S.calc_day_prayer(y, m, d, lat, lon, tz, fajr_ang, isha_ang, asr_factor, isha_fixed_min)
  lat = lat or -6.21
  lon = lon or 106.85
  tz = tz or 7.0
  fajr_ang = fajr_ang or 20.0
  isha_ang = isha_ang or 18.0
  asr_factor = asr_factor or 1.0

  local jd = S.julian_date(y, m, d)
  local dec, eqt = S.sun_position(jd)
  local dhuhr_h = 12.0 + tz - (lon / 15.0) - (eqt / 60.0)

  local function ha(angle, is_alt)
    local alt = is_alt and angle or (-angle)
    local cos_ha = (dsin(alt) - dsin(lat) * dsin(dec)) / (dcos(lat) * dcos(dec))
    if cos_ha > 1 or cos_ha < -1 then return nil end
    return dacos(cos_ha) / 15.0
  end

  local ha_fajr = ha(fajr_ang, false)
  local ha_rise = ha(0.833, false)
  local term = asr_factor + math.tan(math.abs(lat - dec) * math.pi / 180.0)
  local asr_alt = math.atan(1.0 / term) * 180.0 / math.pi
  local ha_asr = ha(asr_alt, true)
  local ha_maghrib = ha_rise
  local ha_isha = not isha_fixed_min and ha(isha_ang, false) or nil

  local function to_hhmm(h_val, extra)
    if not h_val then return '--:--' end
    local tot = (math.floor(h_val * 60.0 + (extra or 0) + 0.5) % 1440 + 1440) % 1440
    return string.format('%02d:%02d', tot // 60, tot % 60)
  end

  local subuh_h = ha_fajr and (dhuhr_h - ha_fajr) or nil
  local rise_h = ha_rise and (dhuhr_h - ha_rise) or nil
  local asr_h = ha_asr and (dhuhr_h + ha_asr) or nil
  local maghrib_h = ha_maghrib and (dhuhr_h + ha_maghrib) or nil
  local isha_h = ha_isha and (dhuhr_h + ha_isha) or nil
  local dhuha_h = rise_h and (rise_h + 25.0 / 60.0) or nil

  local isha_s
  if isha_fixed_min and maghrib_h then
    isha_s = to_hhmm(maghrib_h, isha_fixed_min + 2)
  else
    isha_s = to_hhmm(isha_h, 2)
  end

  return {
    to_hhmm(subuh_h, -10 + 2), -- Imsak (1)
    to_hhmm(subuh_h, 2),        -- Subuh (2)
    to_hhmm(rise_h, 0),         -- Terbit (3)
    to_hhmm(dhuha_h, 2),        -- Dhuha (4)
    to_hhmm(dhuhr_h, 2),        -- Dzuhur (5)
    to_hhmm(asr_h, 2),          -- Ashar (6)
    to_hhmm(maghrib_h, 2),      -- Maghrib (7)
    isha_s,                     -- Isya (8)
  }
end

function S.generate_month(y, m, cfg)
  local m_days = S.month_len(y, m)
  local lat = cfg and cfg.lat or -6.21
  local lon = cfg and cfg.lon or 106.85
  local tz = cfg and cfg.tz or 7.0
  local fajr_ang = cfg and cfg.fajr_ang or 20.0
  local isha_ang = cfg and cfg.isha_ang or 18.0
  local asr_factor = cfg and cfg.asr_factor or 1.0
  local isha_fixed_min = cfg and cfg.isha_fixed_min or nil

  local days = {}
  for d = 1, m_days do
    days[d] = S.calc_day_prayer(y, m, d, lat, lon, tz, fajr_ang, isha_ang, asr_factor, isha_fixed_min)
  end
  return days
end

function S.load_month(y, m, prov, kab, cfg)
  local raw = S.read(S.cache_name(y, m))
  local parsed = S.parse_cache_text(raw)
  local want = (prov or '') .. '|' .. (kab or '')
  if parsed and (not prov or not kab or parsed.loc == want) then
    return parsed.days
  end
  if cfg and S.generate_month then
    local days = S.generate_month(y, m, cfg)
    if days then
      local loc_hdr = 'loc=' .. want .. '\n'
      local body = loc_hdr
      for d = 1, #days do
        local r = days[d]
        body = body .. string.format('%d=%s,%s,%s,%s,%s,%s,%s,%s\n',
          d, r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8])
      end
      S.write(S.cache_name(y, m), body)
      return days
    end
  end
  return parsed and parsed.days or nil
end


function S.compute(now_info, cfg)
  local L = S.L(cfg)
  local days_cur = S.load_month(now_info.y, now_info.m, cfg.prov, cfg.kab, cfg)
  local today_row = days_cur and days_cur[now_info.d] or nil
  local hy, hm, hd, hijri_str, after_maghrib = S.effective_hijri(now_info, cfg, today_row)
  if not today_row then
    return {
      has_data = false,
      hijri_str = hijri_str,
      hy = hy,
      hm = hm,
      hd = hd,
      after_maghrib = after_maghrib,
      L = L,
    }
  end

  local cur_min = now_info.cur_min
  local next_idx = nil
  local next_min = nil
  local prev_min = 0
  local is_tomorrow = false

  for i = 1, #S.WAJIB_IDX do
    local idx = S.WAJIB_IDX[i]
    local m = S.hhmm_to_min(today_row[idx])
    if m then
      if cur_min < m and not next_idx then
        next_idx = idx
        next_min = m
      elseif cur_min >= m then
        prev_min = m
      end
    end
  end

  local active_row = today_row
  local active_wday = now_info.wday

  if not next_idx then
    -- After Isya: roll over to tomorrow's Subuh
    is_tomorrow = true
    next_idx = 2 -- Subuh
    local isya_m = S.hhmm_to_min(today_row[8]) or (19 * 60)
    prev_min = isya_m
    local tom_y, tom_m, tom_d = S.civil(now_info.day + 1)
    local days_tom = (tom_m == now_info.m) and days_cur or S.load_month(tom_y, tom_m, cfg.prov, cfg.kab, cfg)
    local tom_row = days_tom and days_tom[tom_d] or today_row
    active_row = tom_row
    active_wday = S.wday(now_info.day + 1)
    local subuh_m = S.hhmm_to_min(active_row[2]) or (4 * 60 + 30)
    next_min = subuh_m + 1440
  else
    if next_idx == 2 then
      local isya_m = S.hhmm_to_min(today_row[8]) or (19 * 60 + 15)
      prev_min = isya_m - 1440
    end
  end

  local diff = next_min - cur_min
  if diff < 0 then diff = 0 end
  local dh = diff // 60
  local dm = diff % 60
  local cd_str
  if diff == 0 then
    cd_str = L.now_prayer
  elseif cfg and cfg.lang == 'en' then
    if dh > 0 then
      cd_str = tostring(dh) .. ' hr ' .. tostring(dm) .. ' min left'
    else
      cd_str = tostring(dm) .. ' min left'
    end
  else
    if dh > 0 then
      cd_str = tostring(dh) .. ' jam ' .. tostring(dm) .. ' menit lagi'
    else
      cd_str = tostring(dm) .. ' menit lagi'
    end
  end

  local span = next_min - prev_min
  local prog = 0.5
  if span > 0 then
    prog = (cur_min - prev_min) / span
    if prog < 0 then prog = 0 elseif prog > 1 then prog = 1 end
  end

  local next_name = L.labels[next_idx]
  if next_idx == 5 and active_wday == 5 then
    next_name = L.jumat or next_name
  end

  return {
    has_data = true,
    hijri_str = hijri_str,
    row = active_row,
    wday = active_wday,
    is_tomorrow = is_tomorrow,
    next_idx = next_idx,
    next_name = next_name,
    next_time = active_row[next_idx],
    cd_str = cd_str,
    progress = prog,
    L = L,
  }
end

------------------------------------------------------------------ drawing & typography helpers

function S.font(name)
  return ctx.fonts and ctx.fonts[name] or nil
end

function S.text_w(s, fname)
  local f = S.font(fname)
  if f then
    local ok, w = pcall(function() return f:measure(s) end)
    if ok and type(w) == 'number' and w > 0 then return w end
  end
  local cw = (fname == 'large' and 15) or (fname == 'medium' and 12) or 10
  return #tostring(s) * cw
end

function S.fit_text(s, fname, max_w)
  s = tostring(s or '')
  if not max_w or S.text_w(s, fname) <= max_w then return s end
  while #s > 3 and S.text_w(s .. '..', fname) > max_w do
    s = s:sub(1, -2)
  end
  return s .. '..'
end

function S.center_text(gg, cx, y, s, fname, max_w, color)
  s = S.fit_text(s, fname, max_w or (S.W - 24))
  local w = S.text_w(s, fname)
  local opts = { font = S.font(fname) }
  if color ~= nil then opts.color = color end
  gg:text(math.floor(cx - w / 2), y, s, opts)
end

function S.right_text(gg, rx, y, s, fname)
  local w = S.text_w(s, fname)
  gg:text(math.floor(rx - w), y, s, { font = S.font(fname) })
end

function S.short(s, max_len)
  s = tostring(s or '')
  if #s <= max_len then return s end
  return s:sub(1, max_len - 2) .. '..'
end

-- Smooth rounded rectangle via polyline (Material 3 style)
function S.round_rect(gg, x, y, w, h, r, lw, fill, color)
  r = math.min(r or 10, w // 2, h // 2)
  if r <= 2 then
    if fill then
      gg:rect(x, y, w, h, { fill = true, color = color or 1 })
    else
      gg:rect(x, y, w, h, { line_width = lw or 1 })
    end
    return
  end

  local p = {}
  local function add(px, py)
    p[#p + 1] = math.floor(px + 0.5)
    p[#p + 1] = math.floor(py + 0.5)
  end

  -- Top edge
  add(x + r, y)
  add(x + w - r, y)
  -- Top-Right corner (center cx = x + w - r, cy = y + r)
  local cx, cy = x + w - r, y + r
  add(cx + r * 0.500, cy - r * 0.866)
  add(cx + r * 0.707, cy - r * 0.707)
  add(cx + r * 0.866, cy - r * 0.500)
  add(cx + r, cy)
  -- Right edge
  add(x + w, y + h - r)
  -- Bottom-Right corner (center cx = x + w - r, cy = y + h - r)
  cx, cy = x + w - r, y + h - r
  add(cx + r * 0.866, cy + r * 0.500)
  add(cx + r * 0.707, cy + r * 0.707)
  add(cx + r * 0.500, cy + r * 0.866)
  add(cx, cy + r)
  -- Bottom edge
  add(x + r, y + h)
  -- Bottom-Left corner (center cx = x + r, cy = y + h - r)
  cx, cy = x + r, y + h - r
  add(cx - r * 0.500, cy + r * 0.866)
  add(cx - r * 0.707, cy + r * 0.707)
  add(cx - r * 0.866, cy + r * 0.500)
  add(cx - r, cy)
  -- Left edge
  add(x, y + r)
  -- Top-Left corner (center cx = x + r, cy = y + r)
  cx, cy = x + r, y + r
  add(cx - r * 0.866, cy - r * 0.500)
  add(cx - r * 0.707, cy - r * 0.707)
  add(cx - r * 0.500, cy - r * 0.866)
  add(cx, cy - r)
  -- Close polyline
  add(x + r, y)

  if fill then
    gg:polygon(p, { fill = true, color = color or 1 })
  else
    gg:polyline(p, { line_width = lw or 1 })
  end
end

-- Diamond ornament at (cx, cy) with radius r
function S.diamond(gg, cx, cy, r, fill, color)
  local pts = { cx, cy - r, cx + r, cy, cx, cy + r, cx - r, cy, cx, cy - r }
  if fill then
    local opts = { fill = true }
    if color ~= nil then opts.color = color end
    local ok = pcall(function() gg:polygon(pts, opts) end)
    if not ok then gg:polyline(pts, { line_width = 2 }) end
  else
    gg:polyline(pts, { line_width = 1 })
  end
end

-- Clean rounded card with crisp E-ink border hierarchy
function S.card(gg, x, y, w, h, lw, double_border)
  S.round_rect(gg, x, y, w, h, 14, nil, true, 0)
  S.round_rect(gg, x, y, w, h, 14, lw or 2)
  if double_border then
    S.round_rect(gg, x + 3, y + 3, w - 6, h - 6, 11, 1)
  end
end

-- Backward compatibility alias
function S.ornate_card(gg, x, y, w, h)
  S.card(gg, x, y, w, h, 2, true)
end

-- Modern clean hairline divider (subtle 1px line, no ornate diamonds)
function S.divider(gg, y, x1, x2)
  x1 = x1 or 24
  x2 = x2 or (S.W - 24)
  gg:line(x1, y, x2, y, { line_width = 1 })
end

-- Apple UISegmentedControl styled for 1-bit monochrome E-ink
function S.segmented_control(gg, x, y, w, h, segments, active_idx)
  local r = h // 2
  -- Outer capsule container with clean border
  S.round_rect(gg, x, y, w, h, r, nil, true, 0)
  S.round_rect(gg, x, y, w, h, r, 1)
  local n = #segments
  local seg_w = w / n
  for i, seg in ipairs(segments) do
    local sx = math.floor(x + (i - 1) * seg_w)
    local sw = math.floor(x + i * seg_w) - sx
    if i == active_idx then
      -- Active segment highlighted capsule pill with bold border
      local pr = (h - 4) // 2
      S.round_rect(gg, sx + 2, y + 2, sw - 4, h - 4, pr, nil, true, 0)
      S.round_rect(gg, sx + 2, y + 2, sw - 4, h - 4, pr, 2)
      S.center_text(gg, sx + sw // 2, y + (h - 18) // 2, seg, 'small', sw - 6)
    else
      -- Subtle hairline divider between inactive segments
      if i < n and (i + 1) ~= active_idx and i ~= active_idx then
        gg:line(sx + sw, y + 6, sx + sw, y + h - 6, { line_width = 1 })
      end
      S.center_text(gg, sx + sw // 2, y + (h - 18) // 2, seg, 'small', sw - 6)
    end
  end
end

-- Apple Modal Sheet Grabber indicator pill (━)
function S.sheet_grabber(gg, cx, y)
  S.round_rect(gg, cx - 20, y, 40, 4, 2, nil, true, 1)
end

-- Hardware QR Code renderer (uses XTOS Licorice API 2.9 ctx.qr:encode with solid white frame)
local qr_cache = {}

function S.draw_qr(gg, text, cx, cy, size)
  size = size or 160
  local img = qr_cache[text]
  if img == nil then
    local ok, res = pcall(function()
      if ctx and ctx.qr and ctx.qr.encode then
        local r = ctx.qr:encode(text, { size = size })
        if not r then r = ctx.qr:encode(text) end
        return r
      end
      return nil
    end)
    img = (ok and res) or false
    qr_cache[text] = img
  end

  local x = cx - size // 2
  local y = cy

  -- Solid white backing container with 1px border for maximum optical scan contrast
  S.round_rect(gg, x - 10, y - 10, size + 20, size + 20, 10, nil, true, 0)
  S.round_rect(gg, x - 10, y - 10, size + 20, size + 20, 10, 1)

  if img then
    local ok = pcall(function()
      local w = tonumber(img.width) or 0
      local sz = size
      if w > 0 then sz = w * math.max(1, size // w) end
      gg:image(img, cx - sz // 2, y + (size - sz) // 2, { w = sz, h = sz })
    end)
    if not ok then
      pcall(function() gg:image(img, x, y) end)
    end
  else
    -- Clean vector fallback outline if ctx.qr is unavailable (e.g. testing/simulator)
    gg:rect(x, y, size, size, { line_width = 1 })
    for sy = y + 8, y + size - 8, 12 do
      gg:line(x + 8, sy, x + size - 8, sy, { line_width = 1 })
    end
    S.round_rect(gg, cx - 64, y + size // 2 - 20, 128, 40, 6, nil, true, 0)
    S.round_rect(gg, cx - 64, y + size // 2 - 20, 128, 40, 6, 1)
    S.center_text(gg, cx, y + size // 2 - 12, '[ QR CODE ]', 'medium')
    S.center_text(gg, cx, y + size // 2 + 8, 'Scan via HP', 'small')
  end
end

-- Modern minimal crescent moon icon
function S.draw_crescent(gg, cx, cy, r)
  gg:circle(cx, cy, r, { fill = true })
  gg:circle(cx + math.max(2, r // 2), cy - math.max(1, r // 3), math.floor(r * 0.82), { fill = true, color = 0 })
  gg:circle(cx + r + 3, cy - r // 2, 2, { fill = true })
end

-- Modern 3-line hamburger menu button (E-ink Launcher style as in reference)
function S.draw_hamburger_btn(gg, x, y, w)
  x = x or (S.W - 52)
  y = y or 18
  w = w or 28
  local ly = y + 2
  gg:line(x, ly, x + w, ly, { line_width = 3 })
  gg:line(x, ly + 8, x + w, ly + 8, { line_width = 3 })
  gg:line(x, ly + 16, x + w, ly + 16, { line_width = 3 })
end

-- Backward compatibility alias
function S.draw_settings_btn(gg, x, y, w, h)
  S.draw_hamburger_btn(gg, x, y)
end

-- Micro-vector icons for Slider / Side Drawer Menu
function S.draw_menu_icon(gg, kind, cx, cy)
  if kind == 'shalat' then
    -- Classical mosque dome
    gg:rect(cx - 9, cy + 2, 18, 8, { fill = true })
    gg:circle(cx, cy + 2, 6, { fill = true })
    gg:line(cx, cy - 8, cx, cy - 4, { line_width = 1 })
    gg:rect(cx - 3, cy + 4, 6, 6, { fill = true, color = 0 })
  elseif kind == 'tasbih' then
    -- Circular prayer beads
    for deg = 0, 315, 45 do
      local rad = deg * math.pi / 180.0
      local bx = cx + math.floor(8 * math.cos(rad) + 0.5)
      local by = cy + math.floor(8 * math.sin(rad) + 0.5)
      gg:circle(bx, by, 2, { fill = true })
    end
  elseif kind == 'doa' then
    -- Open book
    gg:rect(cx - 9, cy - 6, 8, 12, { line_width = 1 })
    gg:rect(cx + 1, cy - 6, 8, 12, { line_width = 1 })
    gg:line(cx - 7, cy - 2, cx - 3, cy - 2)
    gg:line(cx - 7, cy + 2, cx - 3, cy + 2)
    gg:line(cx + 3, cy - 2, cx + 7, cy - 2)
    gg:line(cx + 3, cy + 2, cx + 7, cy + 2)
  elseif kind == 'hijri' then
    -- Calendar sheet
    gg:rect(cx - 8, cy - 7, 16, 15, { line_width = 1 })
    gg:line(cx - 8, cy - 2, cx + 8, cy - 2, { line_width = 1 })
    gg:line(cx - 4, cy - 9, cx - 4, cy - 7, { line_width = 2 })
    gg:line(cx + 4, cy - 9, cx + 4, cy - 7, { line_width = 2 })
    gg:circle(cx, cy + 4, 2, { fill = true })
  elseif kind == 'kiblat' then
    -- Compass
    gg:circle(cx, cy, 9, { line_width = 1 })
    gg:line(cx - 4, cy + 4, cx + 4, cy - 4, { line_width = 2 })
    gg:polygon({ cx + 4, cy - 4, cx + 1, cy - 1, cx + 4, cy - 1 }, { fill = true })
  elseif kind == 'settings' then
    -- Gear / Cog
    gg:circle(cx, cy, 6, { line_width = 2 })
    gg:circle(cx, cy, 2, { fill = true })
    gg:line(cx, cy - 9, cx, cy + 9, { line_width = 2 })
    gg:line(cx - 9, cy, cx + 9, cy, { line_width = 2 })
  end
end

-- App Icon matching icon.png: Double squircle frame with classical mosque silhouette
function S.draw_app_icon(gg, x, y, sz)
  sz = sz or 54
  local function sc(v) return math.floor(v * sz / 96 + 0.5) end

  -- Paper white background cutout first
  S.round_rect(gg, x, y, sz, sz, sc(14), nil, true, 0)
  -- Outer double squircle border
  S.round_rect(gg, x, y, sz, sz, sc(14), 2)
  S.round_rect(gg, x + sc(4), y + sc(4), sz - sc(8), sz - sc(8), sc(10), 1)

  -- Stepped base platform
  gg:rect(x + sc(16), y + sc(76), sc(64), sc(4), { fill = true })
  gg:rect(x + sc(20), y + sc(72), sc(56), sc(4), { fill = true })
  gg:rect(x + sc(28), y + sc(54), sc(40), sc(18), { fill = true })

  -- Left minaret & spire
  gg:rect(x + sc(18), y + sc(32), sc(6), sc(40), { fill = true })
  gg:rect(x + sc(16), y + sc(42), sc(10), sc(2), { fill = true })
  gg:circle(x + sc(21), y + sc(31), sc(3), { fill = true })
  gg:line(x + sc(21), y + sc(20), x + sc(21), y + sc(28), { line_width = 1 })

  -- Right minaret & spire
  gg:rect(x + sc(72), y + sc(32), sc(6), sc(40), { fill = true })
  gg:rect(x + sc(70), y + sc(42), sc(10), sc(2), { fill = true })
  gg:circle(x + sc(75), y + sc(31), sc(3), { fill = true })
  gg:line(x + sc(75), y + sc(20), x + sc(75), y + sc(28), { line_width = 1 })

  -- Side domes
  gg:circle(x + sc(32), y + sc(52), sc(6), { fill = true })
  gg:circle(x + sc(64), y + sc(52), sc(6), { fill = true })

  -- Central dome
  gg:circle(x + sc(48), y + sc(48), sc(14), { fill = true })
  -- Finial & crescent moon above central dome
  gg:line(x + sc(48), y + sc(24), x + sc(48), y + sc(34), { line_width = 1 })
  gg:circle(x + sc(48), y + sc(19), sc(6), { fill = true })
  gg:circle(x + sc(51), y + sc(16), sc(5), { fill = true, color = 0 })

  -- White arched doorway in center
  gg:rect(x + sc(43), y + sc(60), sc(10), sc(12), { fill = true, color = 0 })
  gg:circle(x + sc(48), y + sc(60), sc(5), { fill = true, color = 0 })
end

-- Backward compatibility alias
function S.draw_modern_logo(gg, cx, cy, r)
  local sz = (r or 20) * 2
  S.draw_app_icon(gg, cx - sz // 2, cy - sz // 2, sz)
end

-- Graceful mosque silhouette illustration (approx 72x64 box at x, y)
function S.draw_mosque(gg, x, y)
  local by = y + 60
  -- Stepped base platform
  gg:rect(x + 2, by, 68, 3, { fill = true })
  gg:rect(x + 6, by - 3, 60, 3, { fill = true })

  -- Left & right slender minarets
  gg:rect(x + 6, y + 18, 8, 39, { fill = true })
  gg:rect(x + 4, y + 26, 12, 2, { fill = true }) -- balcony
  gg:circle(x + 10, y + 18, 4, { fill = true })
  gg:line(x + 10, y + 8, x + 10, y + 14)

  gg:rect(x + 58, y + 18, 8, 39, { fill = true })
  gg:rect(x + 56, y + 26, 12, 2, { fill = true }) -- balcony
  gg:circle(x + 62, y + 18, 4, { fill = true })
  gg:line(x + 62, y + 8, x + 62, y + 14)

  -- Main sanctuary hall
  gg:rect(x + 16, y + 36, 40, 21, { fill = true })

  -- Side domes
  gg:circle(x + 22, y + 36, 6, { fill = true })
  gg:circle(x + 50, y + 36, 6, { fill = true })

  -- Central grand dome
  gg:circle(x + 36, y + 32, 13, { fill = true })
  -- Finial & crescent above central dome
  gg:line(x + 36, y + 12, x + 36, y + 19)
  S.draw_crescent(gg, x + 36, y + 9, 4)

  -- White arched mihrab / doorways inside sanctuary for depth
  gg:rect(x + 32, y + 45, 9, 12, { fill = true, color = 0 })
  gg:circle(x + 36, y + 45, 4, { fill = true, color = 0 })

  gg:rect(x + 21, y + 48, 5, 9, { fill = true, color = 0 })
  gg:circle(x + 23, y + 48, 2, { fill = true, color = 0 })

  gg:rect(x + 47, y + 48, 5, 9, { fill = true, color = 0 })
  gg:circle(x + 49, y + 48, 2, { fill = true, color = 0 })
end

-- Smooth geometric typographic clock numerals (DIN / Bauhaus style) using native circles, rects & convex quads
-- TrueType clock renderer using lossless pre-extracted scanline rectangles (CF table from build.py)
local BLACK = { fill = true }

local function unpack_pack(p)
  if not p then return nil end
  if p.g then return p end
  local g = {}
  local r_idx = 1
  local r_str = p.r or ''
  for i = 1, 11 do
    local ch = (i <= 10) and tostring(i - 1) or ':'
    local gw = (p.w and p.w:byte(i) or 35) - 35
    local rcount = (type(p.c) == 'table' and p.c[i]) or (type(p.c) == 'string' and ((p.c:byte(i) or 35) - 35)) or 0
    local rects = {}
    for j = 1, rcount do
      local b1 = r_str:byte(r_idx)
      local b2 = r_str:byte(r_idx + 1)
      local b3 = r_str:byte(r_idx + 2)
      local b4 = r_str:byte(r_idx + 3)
      if b1 and b2 and b3 and b4 then
        rects[#rects + 1] = { b1 - 35, b2 - 35, b3 - 35, b4 - 35 }
      end
      r_idx = r_idx + 4
    end
    g[ch] = { w = gw, dec = rects }
  end
  p.g = g
  return p
end

S.CFONT_NAMES = {
  id = { '1. Modern Bulat', '2. Klasik Serif', '3. Tegas Bold', '4. Geometris Slab', '5. Artistik Inline', '6. Angka Arab' },
  en = { '1. Modern Rounded', '2. Classic Serif', '3. Bold Geometric', '4. Geometric Slab', '5. Artistic Inline', '6. Arabic Numerals' },
  id_s = { 'Modern Bulat', 'Klasik Serif', 'Tegas Bold', 'Geometris Slab', 'Artistik Inline', 'Angka Arab' },
  en_s = { 'Modern Rounded', 'Classic Serif', 'Bold Geometric', 'Geometric Slab', 'Artistic Inline', 'Arabic Numerals' },
}

function S.big_clock(gg, hhmm, cx, y, h, cfont_idx)
  local fset = (CF and CF[cfont_idx or 1]) or (CF and CF[1])
  if not fset then
    S.center_text(gg, cx, y + (h - 30) // 2, hhmm, 'large')
    return
  end
  local raw_pack = (h < 50 and fset.sm) or fset.big
  if not raw_pack then
    S.center_text(gg, cx, y + (h - 26) // 2, hhmm, 'large')
    return
  end
  local pack = unpack_pack(raw_pack)
  if not pack or not pack.g then return end

  local gap = (h >= 60) and 8 or 4

  local total_w = 0
  for idx = 1, #hhmm do
    local ch = hhmm:sub(idx, idx)
    local gl = pack.g[ch]
    if gl then
      total_w = total_w + gl.w
      if idx < #hhmm then total_w = total_w + gap end
    end
  end

  local x = math.floor(cx - total_w / 2)
  local dy = y + (h - pack.h) // 2

  for idx = 1, #hhmm do
    local ch = hhmm:sub(idx, idx)
    local gl = pack.g[ch]
    if gl then
      local rects = gl.dec or {}
      for r_i = 1, #rects do
        local r = rects[r_i]
        gg:rect(x + r[1], dy + r[2], r[3], r[4], BLACK)
      end
      x = x + gl.w + gap
    end
  end
end

-- Next prayer modern hero card (Material 3 Surface style, height ~126)
function S.draw_next_card(gg, x, y, w, h, info, cfont_idx)
  local L = info.L or S.LANGS.id
  -- Clean rounded card with double frame for authentic e-ink depth
  S.card(gg, x, y, w, h, 2, true)

  local label = info.is_tomorrow and L.next_card_tom or L.next_card
  -- Pill badge for section title
  local badge_w = S.text_w(label, 'small') + 22
  S.round_rect(gg, x + 18, y + 8, badge_w, 22, 6, nil, true, 0)
  S.round_rect(gg, x + 18, y + 8, badge_w, 22, 6, 1)
  gg:circle(x + 28, y + 19, 3, { fill = true })
  gg:text(x + 36, y + 9, label, { font = S.font('small') })

  -- Prayer Name & Countdown on Left
  gg:text(x + 20, y + 36, info.next_name or '', { font = S.font('large') })
  gg:text(x + 20, y + 68, S.fit_text(info.cd_str or '', 'medium', w - 176), { font = S.font('medium') })

  -- Right side modern time pill with double border
  local bx, by, bw, bh = x + w - 142, y + 32, 124, 54
  S.round_rect(gg, bx, by, bw, bh, 10, nil, true, 0)
  S.round_rect(gg, bx, by, bw, bh, 10, 2)
  S.round_rect(gg, bx + 2, by + 2, bw - 4, bh - 4, 8, 1)
  S.big_clock(gg, info.next_time, bx + bw // 2, by + 8, 36, cfont_idx)

  -- High-contrast solid progress track
  local px, py, pw, ph = x + 20, y + h - 18, w - 40, 7
  gg:rect(px, py, pw, ph, { fill = true, color = 0 })
  gg:rect(px, py, pw, ph, { line_width = 1 })
  local fill_w = math.floor(pw * (info.progress or 0))
  if fill_w > 2 then
    gg:rect(px, py, fill_w, ph, { fill = true })
    gg:circle(px + fill_w, py + ph // 2, 4, { fill = true })
  end
end

-- Modern prayer schedule list view with continuous vertical timeline connecting line
function S.draw_timeline(gg, x, y, w, row_h, info)
  local L = info.L or S.LANGS.id
  local row_times = info.row
  local dot_x = x + 22
  local first_cy = y + row_h // 2
  local last_cy = y + 7 * row_h + row_h // 2

  -- Continuous vertical timeline connecting line linking all 8 prayer dots
  gg:line(dot_x, first_cy, dot_x, last_cy, { line_width = 2 })

  for i = 1, 8 do
    local ry = y + (i - 1) * row_h
    local cy = ry + row_h // 2
    local is_next = (i == info.next_idx)
    local is_past = info.next_idx and (i < info.next_idx)
    local is_wajib = S.IS_WAJIB[i]
    local name = L.labels[i]
    if i == 5 and info.wday == 5 then name = L.jumat or name end
    local tm = row_times[i] or '--:--'

    if is_next then
      -- Highlighted Active Row: Distinct double-stroke container pill
      S.round_rect(gg, x + 4, ry, w - 8, row_h - 2, 10, nil, true, 0)
      S.round_rect(gg, x + 4, ry, w - 8, row_h - 2, 10, 2)
      S.round_rect(gg, x + 6, ry + 2, w - 12, row_h - 6, 8, 1)

      -- Active concentric bullseye dot on the vertical timeline
      gg:circle(dot_x, cy, 7, { fill = true, color = 0 }) -- clear vertical line behind dot
      gg:circle(dot_x, cy, 6, { line_width = 2 })
      gg:circle(dot_x, cy, 3, { fill = true })
      local ty_lg = ry + math.max(2, (row_h - 32) // 2)
      gg:text(x + 38, ty_lg, name, { font = S.font('large') })
      -- Modern capsule badge for 'Berikutnya' with crisp 1px frame
      local bw_badge = S.text_w(L.next_badge, 'small') + 14
      local bx_badge = x + 40 + S.text_w(name, 'large') + 12
      local by_badge = ry + math.max(4, (row_h - 24) // 2)
      S.round_rect(gg, bx_badge, by_badge, bw_badge, 22, 6, nil, true, 0)
      S.round_rect(gg, bx_badge, by_badge, bw_badge, 22, 6, 1)
      S.center_text(gg, bx_badge + bw_badge // 2, by_badge + 2, L.next_badge, 'small')
      S.right_text(gg, x + w - 20, ty_lg, tm, 'large')
    else
      -- Regular clean list item
      -- Clear vertical line directly behind bullet dot
      gg:circle(dot_x, cy, 5, { fill = true, color = 0 })
      local fn = is_wajib and 'medium' or 'small'
      local ty = ry + math.max(4, (row_h - (is_wajib and 26 or 22)) // 2)

      if is_past then
        -- Past prayer: solid filled black dot + subtle completed dot indicator
        gg:circle(dot_x, cy, 4, { fill = true })
        gg:text(x + 38, ty, name, { font = S.font(fn) })
        S.right_text(gg, x + w - 34, ty, tm, fn)
        gg:circle(x + w - 20, cy, 2, { fill = true })
      else
        -- Future prayer: clean hollow circle
        gg:circle(dot_x, cy, 4, { line_width = 1 })
        gg:text(x + 38, ty, name, { font = S.font(fn) })
        S.right_text(gg, x + w - 20, ty, tm, fn)
      end
    end
  end
end


------------------------------------------------------------------ Online Ayah & Quote Engine

-- 30 Curated Concise Quranic Pearls (Complete, Self-Contained, 40-140 chars)
S.AYAH_POOL = {
  '94:5', '94:6', '94:7', '94:8',
  '13:28', '14:7', '20:14', '21:87', '29:45',
  '65:3', '93:3', '93:5', '40:60', '55:13', '87:1',
  '110:3', '26:80', '57:4', '2:152', '2:153',
  '49:10', '49:13', '16:128', '2:195', '3:139',
  '3:200', '4:103', '89:27', '89:28', '25:74'
}

S.BUILTIN_AYAHS = {
  [1] = { ref = 'QS. Ash-Sharh: 5', id = 'Maka sesungguhnya bersama kesulitan ada kemudahan,', en = 'For indeed, with hardship [will be] ease.' },
  [2] = { ref = 'QS. Ash-Sharh: 6', id = 'Sesungguhnya bersama kesulitan ada kemudahan.', en = 'Indeed, with hardship [will be] ease.' },
  [3] = { ref = 'QS. Ash-Sharh: 7', id = 'Maka apabila engkau telah selesai (dari suatu urusan), tetaplah bekerja keras (untuk urusan yang lain),', en = 'So when you have finished [your duties], then stand up [for worship].' },
  [4] = { ref = 'QS. Ash-Sharh: 8', id = 'Dan hanya kepada Tuhanmulah engkau berharap.', en = 'And to your Lord direct [your] longing.' },
  [5] = { ref = "QS. Ar-Ra'd: 28", id = '(yaitu) orang-orang yang beriman dan hati mereka manjadi tenteram dengan mengingat Allah. Ingatlah, hanya dengan mengingati Allah-lah hati menjadi tenteram.', en = 'Those who have believed and whose hearts are assured by the remembrance of Allah. Unquestionably, by the remembrance of Allah hearts are assured.' },
  [6] = { ref = 'QS. Ibrahim: 7', id = 'Sesungguhnya jika kamu bersyukur, niscaya Aku akan menambah (nikmat) kepadamu.', en = 'If you are grateful, I will surely increase you [in favor].' },
  [7] = { ref = 'QS. Ta-Ha: 14', id = 'Sungguh, Aku ini Allah, tidak ada tuhan selain Aku, maka sembahlah Aku dan laksanakanlah shalat untuk mengingat-Ku.', en = 'Indeed, I am Allah. There is no deity except Me, so worship Me and establish prayer for My remembrance.' },
  [8] = { ref = 'QS. Al-Anbiya: 87', id = 'Tidak ada tuhan selain Engkau, Mahasuci Engkau. Sungguh, aku termasuk orang-orang yang zalim.', en = 'There is no deity except You; exalted are You. Indeed, I have been of the wrongdoers.' },
  [9] = { ref = "QS. Al-'Ankabut: 45", id = 'Dirikanlah shalat. Sesungguhnya shalat itu mencegah dari (perbuatan) keji dan mungkar.', en = 'Establish prayer. Indeed, prayer prohibits immorality and wrongdoing.' },
  [10] = { ref = 'QS. At-Talaq: 3', id = 'Dan barangsiapa bertawakal kepada Allah, niscaya Allah akan mencukupkan (keperluan)nya.', en = 'And whoever relies upon Allah - then He is sufficient for him.' },
}

function S.wrap_lines(s, max_w, fname)
  max_w = max_w or (S.W - 48)
  fname = fname or 'small'
  local limit_w = max_w - 14
  local lines = {}
  local cur = ''
  for w in tostring(s or ''):gmatch('%S+') do
    local cand = (cur == '') and w or (cur .. ' ' .. w)
    if cur ~= '' and S.text_w(cand, fname) > limit_w then
      lines[#lines + 1] = cur
      cur = w
    else
      cur = cand
    end
  end
  if cur ~= '' then
    lines[#lines + 1] = cur
  end
  return lines
end

function S.split_quote_lines(s, max_len)
  local lines = S.wrap_lines(s, max_len and (max_len * 10) or (S.W - 48), 'small')
  local s1 = lines[1] or ''
  local s2 = lines[2] or ''
  if #lines > 2 then
    local rest = {}
    for i = 2, #lines do rest[#rest + 1] = lines[i] end
    s2 = table.concat(rest, ' ')
  end
  return s1, s2
end

function S.parse_ayah_json(str)
  if type(str) ~= 'string' then return nil end
  local id_text, en_text

  local data_str = str:match('"data"%s*:%s*%[(.-)%]%s*,%s*"surah"')
    or str:match('"data"%s*:%s*%[(.-)%]%s*}')
    or str:match('"data"%s*:%s*%[(.+)%]')
    or str

  for item in data_str:gmatch('(%b{})') do
    local txt = item:match('"text"%s*:%s*"(.-[^\\])"') or item:match('"text"%s*:%s*"([^"]+)"')
    if txt then
      txt = txt:gsub('\\"', '"'):gsub('\\n', ' '):gsub('\\r', ''):gsub('\\t', ' ')
      if item:find('"identifier"%s*:%s*"id%.indonesian"') or item:find('"language"%s*:%s*"id"') then
        id_text = txt
      elseif item:find('"identifier"%s*:%s*"en%.sahih"') or item:find('"language"%s*:%s*"en"') then
        en_text = txt
      end
    end
  end

  if not id_text or not en_text then
    local texts = {}
    for t in str:gmatch('"text"%s*:%s*"(.-[^\\])"') do
      texts[#texts + 1] = t:gsub('\\"', '"'):gsub('\\n', ' ')
    end
    if not id_text then id_text = texts[1] end
    if not en_text then en_text = (texts[2] and texts[2] ~= texts[1]) and texts[2] or nil end
  end

  local surah = str:match('"surah"%s*:%s*{.-"englishName"%s*:%s*"([^"]+)"')
  local ayah = str:match('"numberInSurah"%s*:%s*(%d+)')
  if id_text and surah and ayah then
    local ref = 'QS. ' .. surah .. ': ' .. ayah
    return {
      id_text = id_text,
      en_text = en_text or '',
      ref = ref,
      id_l1 = id_text,
      id_l2 = '',
      id_ref = ref,
      en_l1 = en_text or '',
      en_l2 = '',
      en_ref = ref,
    }
  end
  return nil
end

function S.quote_period_key(now_info, cfg, info)
  local qr = cfg and cfg.qrefresh or 1
  local y = (now_info and now_info.y) or 2026
  local m = (now_info and now_info.m) or 1
  local d = (now_info and (now_info.d or now_info.day)) or 1
  local h = (now_info and (now_info.hour or now_info.h)) or 0
  if qr == 2 then
    local pname = (info and info.next_name) or 'Subuh'
    return string.format('%04d%02d%02d_%s', y, m, d, pname)
  elseif qr == 3 then
    return string.format('%04d%02d%02d_%02d', y, m, d, h)
  else
    return string.format('%04d%02d%02d', y, m, d)
  end
end

function S.load_cached_quote()
  local raw = S.read('quote_cache.txt')
  if not raw then return nil end
  local t = {}
  for k, v in raw:gmatch('([%w_]+)=([^\r\n]*)') do t[k] = v end
  if (t.id_text and t.id_text ~= '') or (t.id_l1 and t.id_l1 ~= '') then
    return t
  end
  return nil
end

function S.save_cached_quote(q, key)
  if not q then return end
  local id_t = q.id_text or q.id_l1 or ''
  if q.id_l2 and q.id_l2 ~= '' and not q.id_text then
    id_t = id_t .. ' ' .. q.id_l2
  end
  local en_t = q.en_text or q.en_l1 or ''
  if q.en_l2 and q.en_l2 ~= '' and not q.en_text then
    en_t = en_t .. ' ' .. q.en_l2
  end
  local ref_s = q.ref or q.id_ref or q.en_ref or ''
  local s = 'key=' .. tostring(key or '') ..
            '\npool_idx=' .. tostring(q.pool_idx or '') ..
            '\nid_text=' .. tostring(id_t) ..
            '\nen_text=' .. tostring(en_t) ..
            '\nref=' .. tostring(ref_s) ..
            '\nid_l1=' .. tostring(q.id_l1 or id_t) ..
            '\nid_l2=' .. tostring(q.id_l2 or '') ..
            '\nid_ref=' .. tostring(q.id_ref or ref_s) ..
            '\nen_l1=' .. tostring(q.en_l1 or en_t) ..
            '\nen_l2=' .. tostring(q.en_l2 or '') ..
            '\nen_ref=' .. tostring(q.en_ref or ref_s)
  S.write('quote_cache.txt', s)
end

local quote_fetching = false
local last_quote_req_ms = 0

function S.try_fetch_quote(now_info, cfg, info)
  pcall(function()
    if not cfg or cfg.qrefresh == 4 then return end
    if quote_fetching then return end
    local t_now = (now_info and now_info.epoch) or os.time()
    if (t_now - last_quote_req_ms) < 60 then return end

    local req_key = S.quote_period_key(now_info, cfg, info)
    local cur = S.load_cached_quote()
    local is_en = (cfg and cfg.lang == 'en')
    if cur and cur.key == req_key then
      if not (is_en and (not cur.en_text or cur.en_text == '' or cur.en_text == cur.id_text or S.is_indonesian_text(cur.en_text))) then
        return
      end
    end

    last_quote_req_ms = t_now
    local hash_val = 0
    for i = 1, #req_key do
      hash_val = (hash_val * 31 + req_key:byte(i)) % 1000000007
    end
    local pool_idx = (math.abs(hash_val) % #S.AYAH_POOL) + 1
    local target_ayah = S.AYAH_POOL[pool_idx]

    quote_fetching = true
    pcall(function()
      ctx.net:request({
        url = 'https://api.alquran.cloud/v1/ayah/' .. target_ayah .. '/editions/id.indonesian,en.sahih',
        method = 'GET',
        headers = { ['Accept'] = 'application/json' },
        timeout_ms = 15000,
      }, function(c, resp)
        quote_fetching = false
        pcall(function()
          if type(resp) ~= 'table' or type(resp.body) ~= 'string' then return end
          local parsed = S.parse_ayah_json(resp.body)
          if parsed then
            parsed.pool_idx = pool_idx
            S.save_cached_quote(parsed, req_key)
            pcall(function() ctx:invalidate() end)
          end
        end)
      end)
    end)
  end)
end

function S.force_refresh_quote(now_info, cfg, info, on_done)
  pcall(function()
    local t_now = (now_info and now_info.epoch) or os.time()
    local cur = S.load_cached_quote()
    local cur_idx = 0
    if cur and cur.pool_idx then
      cur_idx = tonumber(cur.pool_idx) or 0
    end
    local next_idx = (cur_idx % #S.AYAH_POOL) + 1
    local target_ayah = S.AYAH_POOL[next_idx]
    local req_key = 'manual_' .. tostring(next_idx) .. '_' .. tostring(t_now)

    if cfg and cfg.qrefresh == 4 then
      local b = S.BUILTIN_AYAHS[((next_idx - 1) % #S.BUILTIN_AYAHS) + 1]
      local parsed = {
        id_text = b.id,
        en_text = b.en,
        ref = b.ref,
        pool_idx = next_idx,
      }
      S.save_cached_quote(parsed, req_key)
      pcall(function() ctx:invalidate() end)
      if on_done then on_done(true, parsed) end
      return
    end

    quote_fetching = true
    pcall(function()
      ctx.net:request({
        url = 'https://api.alquran.cloud/v1/ayah/' .. target_ayah .. '/editions/id.indonesian,en.sahih',
        method = 'GET',
        headers = { ['Accept'] = 'application/json' },
        timeout_ms = 12000,
      }, function(c, resp)
        quote_fetching = false
        pcall(function()
          if type(resp) ~= 'table' or type(resp.body) ~= 'string' then
            local b = S.BUILTIN_AYAHS[((next_idx - 1) % #S.BUILTIN_AYAHS) + 1]
            local parsed = {
              id_text = b.id,
              en_text = b.en,
              ref = b.ref,
              pool_idx = next_idx,
            }
            S.save_cached_quote(parsed, req_key)
            pcall(function() ctx:invalidate() end)
            if on_done then on_done(true, parsed) end
            return
          end
          local parsed = S.parse_ayah_json(resp.body)
          if parsed then
            parsed.pool_idx = next_idx
            S.save_cached_quote(parsed, req_key)
            pcall(function() ctx:invalidate() end)
            if on_done then on_done(true, parsed) end
          else
            if on_done then on_done(false, 'Format tidak valid') end
          end
        end)
      end)
    end)
  end)
end

function S.is_indonesian_text(s)
  if not s or s == '' then return false end
  local lower = ' ' .. s:lower() .. ' '
  local markers = { ' yang ', ' dan ', ' dengan ', ' mereka ', ' orang ', ' sesungguhnya ', ' adalah ', ' maka ', ' hati ', ' tidak ', ' bagi ' }
  local count = 0
  for _, m in ipairs(markers) do
    if lower:find(m, 1, true) then count = count + 1 end
  end
  return count >= 2
end

function S.get_effective_quote(cfg, day)
  local is_en = (cfg and cfg.lang == 'en')
  local q_cache = S.load_cached_quote()
  local text, ref

  local pool_idx = q_cache and tonumber(q_cache.pool_idx)
  if not pool_idx and q_cache and q_cache.ref then
    for idx, b in ipairs(S.BUILTIN_AYAHS) do
      if b.ref == q_cache.ref then
        pool_idx = idx
        break
      end
    end
  end

  if q_cache then
    if is_en then
      local cand = q_cache.en_text
      if cand and cand ~= '' and not S.is_indonesian_text(cand) and cand ~= q_cache.id_text then
        text = cand
        ref = (q_cache.en_ref and q_cache.en_ref ~= '') and q_cache.en_ref or q_cache.ref
      end
    else
      local cand = q_cache.id_text
      if cand and cand ~= '' then
        text = cand
        ref = q_cache.ref or q_cache.id_ref
      end
    end
  end

  if is_en and (not text or text == '' or S.is_indonesian_text(text)) then
    local b_idx = (pool_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[pool_idx] and pool_idx) or (S.BUILTIN_AYAHS and (((day or 0) % #S.BUILTIN_AYAHS) + 1))
    if b_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[b_idx] then
      text = S.BUILTIN_AYAHS[b_idx].en
      ref = S.BUILTIN_AYAHS[b_idx].ref
    end
  elseif not is_en and (not text or text == '') then
    local b_idx = (pool_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[pool_idx] and pool_idx) or (S.BUILTIN_AYAHS and (((day or 0) % #S.BUILTIN_AYAHS) + 1))
    if b_idx and S.BUILTIN_AYAHS and S.BUILTIN_AYAHS[b_idx] then
      text = S.BUILTIN_AYAHS[b_idx].id
      ref = S.BUILTIN_AYAHS[b_idx].ref
    end
  end

  return text, ref, pool_idx
end

function S.draw_quote(gg, y, day, cfg, max_w, max_h)
  max_w = max_w or (S.W - 36)
  local avail_h = max_h or math.max(60, 788 - y)
  local text, ref = S.get_effective_quote(cfg, day)
  if not text or text == '' then return end

  local lines = S.wrap_lines(text, max_w, 'small')
  local n = #lines
  if n == 0 then return end

  lines[1] = '"' .. lines[1]
  lines[n] = lines[n] .. '"'

  -- Dynamic line height & reference gap according to line count
  local lh = (n >= 7) and 15 or ((n >= 5) and 16 or ((n >= 3) and 18 or 20))
  local ref_gap = (n >= 7) and 12 or ((n >= 5) and 14 or ((n >= 3) and 16 or 18))
  local total_h = (n - 1) * lh + ref_gap + 14

  -- Safeguard: prevent text overflow beyond screen bottom (792px)
  -- If text is extraordinarily long, truncate excess lines so reference is never lost
  while n > 2 and total_h > avail_h do
    table.remove(lines, n)
    n = #lines
    lines[n] = lines[n]:gsub('%.+$', ''):gsub('"+$', '') .. '..."'
    total_h = (n - 1) * lh + ref_gap + 14
  end

  local base_y = math.floor(y + (avail_h - total_h) / 2)
  if base_y < y then base_y = y end
  if (base_y + total_h) > (y + avail_h) then
    base_y = (y + avail_h) - total_h
  end

  for i = 1, n do
    local ly = base_y + (i - 1) * lh
    local lw = S.text_w(lines[i], 'small')
    gg:text(math.floor((S.W - lw) / 2), ly, lines[i], { font = S.font('small') })
  end
  local ry = base_y + (n - 1) * lh + ref_gap
  local rw = S.text_w(ref or '', 'small')
  gg:text(math.floor((S.W - rw) / 2), ry, ref or '', { font = S.font('small') })
end

------------------------------------------------------------------ Auto-Updater Engine (GitHub Releases)

S.APP_VERSION = '1.2.6'
S.APP_BUILD = 126
S.UPDATE_URL = 'https://raw.githubusercontent.com/fiqsr/MuslimInk-XTEINK-X4-PRO/main/version.json'
S.PROJECT_GITHUB_URL = 'https://github.com/fiqsr/MuslimInk-XTEINK-X4-PRO'
S.RELEASE_LATEST_URL = 'https://github.com/fiqsr/MuslimInk-XTEINK-X4-PRO/releases/latest'

function S.parse_version_json(str)
  if type(str) ~= 'string' or #str == 0 then return nil end
  if ctx and ctx.json and ctx.json.decode then
    local ok, res = pcall(function() return ctx.json:decode(str) end)
    if ok and type(res) == 'table' and res.version then
      if not res.release_page_url then
        res.release_page_url = S.RELEASE_LATEST_URL
      end
      return res
    end
  end

  -- Pure Lua fallback pattern parser
  local t = {}
  t.version = str:match('"version"%s*:%s*"([^"]+)"')
  local b = str:match('"build"%s*:%s*(%d+)')
  t.build = b and tonumber(b) or 0
  t.release_date = str:match('"release_date"%s*:%s*"([^"]+)"')
  t.download_url = str:match('"download_url"%s*:%s*"([^"]+)"')
  t.raw_package_url = str:match('"raw_package_url"%s*:%s*"([^"]+)"')
  t.release_page_url = str:match('"release_page_url"%s*:%s*"([^"]+)"') or S.RELEASE_LATEST_URL
  local sz = str:match('"size_bytes"%s*:%s*(%d+)')
  t.size_bytes = sz and tonumber(sz) or 427680

  local function parse_array(key)
    local arr = {}
    local blk = str:match('"' .. key .. '"%s*:%s*%[([^%]]+)%]')
    if blk then
      for item in blk:gmatch('"([^"]+)"') do
        local clean = item:gsub('\\"', '"'):gsub('\\\\', '\\')
        arr[#arr + 1] = clean
      end
    end
    return arr
  end

  t.changelog_id = parse_array('changelog_id')
  t.changelog_en = parse_array('changelog_en')

  if t.version then return t end
  return nil
end

function S.compare_versions(v_rem, v_loc)
  if not v_rem or not v_loc then return false end
  local r_maj, r_min, r_pat = tostring(v_rem):match('(%d+)%.(%d+)%.?(%d*)')
  local l_maj, l_min, l_pat = tostring(v_loc):match('(%d+)%.(%d+)%.?(%d*)')
  r_maj, r_min, r_pat = tonumber(r_maj) or 0, tonumber(r_min) or 0, tonumber(r_pat) or 0
  l_maj, l_min, l_pat = tonumber(l_maj) or 0, tonumber(l_min) or 0, tonumber(l_pat) or 0

  if r_maj ~= l_maj then return r_maj > l_maj end
  if r_min ~= l_min then return r_min > l_min end
  return r_pat > l_pat
end

local update_checking = false

function S.check_for_updates(cfg, on_done)
  if update_checking then
    if on_done then on_done(false, nil, 'Sedang memeriksa...') end
    return
  end
  update_checking = true

  pcall(function()
    if ctx and ctx.net and ctx.net.keep_wifi then
      pcall(function() ctx.net:keep_wifi(120000) end)
    end
  end)

  local function finish(has_up, u_info, err)
    update_checking = false
    if on_done then
      pcall(function() on_done(has_up, u_info, err) end)
    end
  end

  if not (ctx and ctx.net and ctx.net.request) then
    finish(false, nil, 'Modul jaringan tidak tersedia')
    return
  end

  local req_opts = {
    url = S.UPDATE_URL,
    method = 'GET',
    headers = {
      ['Accept'] = 'application/json',
      ['User-Agent'] = 'MuslimInk-X4Pro/' .. S.APP_VERSION,
    },
    timeout_ms = 15000,
  }

  pcall(function()
    ctx.net:request(req_opts, function(c, resp)
      if type(resp) ~= 'table' or type(resp.body) ~= 'string' or #resp.body == 0 then
        finish(false, nil, 'Respon server kosong')
        return
      end

      local info = S.parse_version_json(resp.body)
      if not info or not info.version then
        finish(false, nil, 'Format version.json tidak valid')
        return
      end

      local is_newer = S.compare_versions(info.version, S.APP_VERSION)
      if not is_newer and info.build and info.build > S.APP_BUILD then
        is_newer = true
      end

      finish(is_newer, info, nil)
    end)
  end)
end

local update_downloading = false

function S.save_update_package(filename, body, chunks)
  filename = filename or 'muslimink_update.xtapp'
  local saved_path = nil
  local min_sz = 100000

  pcall(function()
    if os and os.execute then
      os.execute('mkdir -p AppFiles/muslimink /sdcard/AppFiles/muslimink')
    end
  end)

  -- Strategy 1: Save directly to AppFiles/muslimink/ (matches user's device folder)
  if io and io.open then
    local candidates = {
      'AppFiles/muslimink/' .. filename,
      '/sdcard/AppFiles/muslimink/' .. filename,
      '../AppFiles/muslimink/' .. filename,
      '../../AppFiles/muslimink/' .. filename,
      'XTApps/muslimink/files/' .. filename,
      '/sdcard/XTApps/muslimink/files/' .. filename,
      filename,
    }
    for _, path in ipairs(candidates) do
      local f = io.open(path, 'wb')
      if f then
        f:write(body)
        f:close()
        saved_path = path
        break
      end
    end
  end

  -- Strategy 2: ctx.files:write (Fallback)
  if not saved_path and ctx and ctx.files and ctx.files.write then
    pcall(function()
      if ctx.files:write('AppFiles/muslimink/' .. filename, body) then
        saved_path = 'AppFiles/muslimink/' .. filename
      end
    end)
    if not saved_path then
      pcall(function()
        if ctx.files:write(filename, body) then
          saved_path = 'AppFiles/muslimink/' .. filename
        end
      end)
    end
  end

  -- Strategy 3: ctx.storage:write (Fallback)
  if not saved_path and ctx and ctx.storage and ctx.storage.write then
    local res = nil
    pcall(function()
      res = ctx.storage:write(filename, body)
    end)
    if res then
      saved_path = 'XTApps/muslimink/files/' .. filename
    end
  end

  return saved_path or ('AppFiles/muslimink/' .. filename)
end

function S.download_update(update_info, on_progress, on_done)
  if update_downloading then
    if on_done then on_done(false, nil, 'Sedang mengunduh...') end
    return
  end
  update_downloading = true

  pcall(function()
    if ctx and ctx.net and ctx.net.keep_wifi then
      pcall(function() ctx.net:keep_wifi(300000) end)
    end
  end)

  local function finish(ok, path, err)
    update_downloading = false
    if on_done then
      pcall(function() on_done(ok, path, err) end)
    end
  end

  if not (ctx and ctx.net and ctx.net.request) then
    finish(false, nil, 'Modul jaringan tidak tersedia')
    return
  end

  local raw_url = (update_info and update_info.raw_package_url) or ''
  local rel_url = (update_info and update_info.download_url) or ''
  local primary_url = (raw_url ~= '') and raw_url or rel_url

  if primary_url == '' then
    finish(false, nil, 'URL berkas pembaruan tidak ditemukan')
    return
  end

  local CHUNK_SIZE = 65536 -- 64 KB per chunk (safely under XTOS 128 KB buffer limit)
  local chunks = {}
  local downloaded_bytes = 0
  local total_bytes = (update_info and update_info.size_bytes) or 422144
  local current_url = primary_url
  local chunk_retries = 0
  local MAX_CHUNK_RETRIES = 3
  local redirect_count = 0

  local fetch_chunk

  fetch_chunk = function()
    local end_byte = downloaded_bytes + CHUNK_SIZE - 1
    if total_bytes and total_bytes > 0 and end_byte >= total_bytes then
      end_byte = total_bytes - 1
    end

    local req_opts = {
      url = current_url,
      method = 'GET',
      headers = {
        ['Accept'] = '*/*',
        ['Accept-Encoding'] = 'identity',
        ['Range'] = 'bytes=' .. downloaded_bytes .. '-' .. end_byte,
        ['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) MuslimInk/' .. S.APP_VERSION,
      },
      timeout_ms = 45000,
    }

    ctx.net:request(req_opts, function(c, resp)
      if type(resp) ~= 'table' then
        if chunk_retries < MAX_CHUNK_RETRIES then
          chunk_retries = chunk_retries + 1
          fetch_chunk()
          return
        end
        if current_url ~= rel_url and rel_url ~= '' then
          current_url = rel_url
          chunk_retries = 0
          fetch_chunk()
          return
        end
        finish(false, nil, 'Koneksi gagal atau terputus')
        return
      end

      -- Handle HTTP Redirects (301, 302, 307, 308)
      if (resp.status == 301 or resp.status == 302 or resp.status == 307 or resp.status == 308) and type(resp.headers) == 'table' then
        redirect_count = redirect_count + 1
        if redirect_count > 5 then
          finish(false, nil, 'Terlalu banyak pengalihan (redirect)')
          return
        end
        local loc = nil
        for k, v in pairs(resp.headers) do
          if tostring(k):lower() == 'location' then
            loc = v
            break
          end
        end
        if loc and loc ~= '' then
          current_url = loc
          fetch_chunk()
          return
        end
      end

      -- Accept both 206 (Partial Content) and 200 (OK)
      if resp.status ~= 206 and resp.status ~= 200 then
        if current_url ~= rel_url and rel_url ~= '' then
          current_url = rel_url
          chunk_retries = 0
          fetch_chunk()
          return
        end
        finish(false, nil, 'HTTP Error ' .. tostring(resp.status))
        return
      end

      local body = resp.body
      if type(body) ~= 'string' or #body == 0 then
        if chunk_retries < MAX_CHUNK_RETRIES then
          chunk_retries = chunk_retries + 1
          fetch_chunk()
          return
        end
        finish(false, nil, 'Data unduhan kosong')
        return
      end

      -- If server ignored Range and returned full body in single response (>= min_sz)
      local min_sz = math.floor(total_bytes * 0.9)
      if resp.status == 200 and downloaded_bytes == 0 and #body >= min_sz then
        if body:sub(1, 4) ~= 'XTAP' then
          finish(false, nil, 'Berkas corrupt: header bukan XTAP')
          return
        end
        local saved_path = S.save_update_package('muslimink_update.xtapp', body, { body })
        if not saved_path then
          finish(false, nil, 'Gagal menyimpan berkas ke XTApps/muslimink/files')
          return
        end
        if on_progress then
          pcall(function() on_progress(#body, #body) end)
        end
        finish(true, saved_path, nil)
        return
      end

      -- Inspect Content-Range header for exact total size
      if type(resp.headers) == 'table' then
        for k, v in pairs(resp.headers) do
          if tostring(k):lower() == 'content-range' then
            local tot = tostring(v):match('/(%d+)')
            if tot then
              local n_tot = tonumber(tot)
              if n_tot and n_tot > 0 then
                total_bytes = n_tot
              end
            end
            break
          end
        end
      end

      -- Append chunk data
      table.insert(chunks, body)
      downloaded_bytes = downloaded_bytes + #body
      chunk_retries = 0

      if on_progress then
        pcall(function() on_progress(downloaded_bytes, total_bytes) end)
      end

      -- Continue fetching next chunk if more bytes expected
      if downloaded_bytes < total_bytes and #body > 0 then
        fetch_chunk()
        return
      end

      -- All chunks downloaded! Assemble package
      local full_body = table.concat(chunks)

      -- Verify Licorice .xtapp Magic Header ("XTAP")
      if full_body:sub(1, 4) ~= 'XTAP' then
        finish(false, nil, 'Berkas corrupt: header tidak valid (bukan paket XTAP)')
        return
      end

      -- Verify full package size
      if #full_body < min_sz then
        finish(false, nil, 'Ukuran berkas tidak lengkap: ' .. math.floor(#full_body / 1024) .. ' KB (seharusnya ~' .. math.floor(total_bytes / 1024) .. ' KB)')
        return
      end

      -- Save binary cleanly to shallow path on SD Card
      local saved_path = S.save_update_package('muslimink_update.xtapp', full_body, chunks)
      if not saved_path then
        finish(false, nil, 'Gagal menyimpan berkas ke XTApps/muslimink/files')
        return
      end

      finish(true, saved_path, nil)
    end)
  end

  pcall(function() fetch_chunk() end)
end

return S

