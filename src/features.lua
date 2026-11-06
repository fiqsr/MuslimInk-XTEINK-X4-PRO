-- All-in-One Islamic Companion features for Jadwal Sholat (bundled as `F` by build.py)
-- Includes:
--   1. Tasbih & Wirid Digital (33-bead ring, 8 dhikr presets incl. Auto-Wirid Shalat, daily/total stats)
--   2. Doa & Dzikir Pilihan (10 essential daily & post-prayer duas with Latin + ID/EN translation)
--   3. Kalender Hijriah & PHBI (Islamic holidays countdown + Sunnah fasting detector)
--   4. Kompas Arah Kiblat (Spherical trigonometry Qibla azimuth & distance for all 38 provinces)

local F = {}

------------------------------------------------------------------ 1. Tasbih & Wirid Data

F.TARGETS = { 33, 99, 100, 1000, 0 } -- 0 = Tanpa Batas (Infinity)

F.DHIKR_LIST = {
  {
    id_title = '1. Paket Wirid Bakda Shalat (Otomatis)',
    en_title = '1. Post-Prayer Wirid (Auto 33x3 + 1)',
    is_auto = true,
    def_target = 100,
  },
  {
    id_title = '2. Tasbih',
    en_title = '2. Tasbih',
    latin = 'Subhaanallaah',
    id_arti = 'Maha Suci Allah',
    en_arti = 'Glory be to Allah',
    def_target = 33,
  },
  {
    id_title = '3. Tahmid',
    en_title = '3. Tahmid',
    latin = 'Alhamdulillaah',
    id_arti = 'Segala puji bagi Allah',
    en_arti = 'All praise is due to Allah',
    def_target = 33,
  },
  {
    id_title = '4. Takbir',
    en_title = '4. Takbir',
    latin = 'Allaahu Akbar',
    id_arti = 'Allah Maha Besar',
    en_arti = 'Allah is the Greatest',
    def_target = 33,
  },
  {
    id_title = '5. Tahlil',
    en_title = '5. Tahlil',
    latin = 'Laa ilaaha illallaah',
    id_arti = 'Tiada Tuhan selain Allah',
    en_arti = 'There is no deity except Allah',
    def_target = 100,
  },
  {
    id_title = '6. Istighfar',
    en_title = '6. Istighfar',
    latin = "Astaghfirullaahal 'azhiim",
    id_arti = 'Aku memohon ampun kepada Allah Yang Maha Agung',
    en_arti = 'I seek forgiveness from Allah the Almighty',
    def_target = 100,
  },
  {
    id_title = '7. Shalawat Nabi',
    en_title = '7. Salawat upon the Prophet',
    latin = "Allaahumma shalli 'alaa Muhammad",
    id_arti = 'Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad',
    en_arti = 'O Allah, send blessings upon Prophet Muhammad',
    def_target = 100,
  },
  {
    id_title = '8. Hauqalah',
    en_title = '8. Hawqalah',
    latin = 'Laa haula wa laa quwwata illaa billaah',
    id_arti = 'Tiada daya dan kekuatan kecuali dengan pertolongan Allah',
    en_arti = 'There is no power nor strength except through Allah',
    def_target = 33,
  },
}

function F.load_tasbih(today_day)
  local raw = S.read('tasbih.txt')
  local t = {}
  if raw then
    for k, v in raw:gmatch('([%w_]+)=([^\r\n]*)') do t[k] = v end
  end
  local saved_day = tonumber(t.day) or today_day
  local today_cnt = tonumber(t.today) or 0
  if saved_day ~= today_day then
    today_cnt = 0
  end
  local idx = tonumber(t.idx) or 1
  if idx < 1 or idx > #F.DHIKR_LIST then idx = 1 end
  return {
    idx = idx,
    count = tonumber(t.count) or 0,
    target = tonumber(t.target) or F.DHIKR_LIST[idx].def_target,
    today = today_cnt,
    total = tonumber(t.total) or 0,
    day = today_day,
  }
end

function F.save_tasbih(tsb)
  local s = 'idx=' .. tostring(tsb.idx or 1) ..
            '\ncount=' .. tostring(tsb.count or 0) ..
            '\ntarget=' .. tostring(tsb.target or 33) ..
            '\ntoday=' .. tostring(tsb.today or 0) ..
            '\ntotal=' .. tostring(tsb.total or 0) ..
            '\nday=' .. tostring(tsb.day or 0)
  S.write('tasbih.txt', s)
end

function F.active_dhikr_text(tsb, is_en)
  local item = F.DHIKR_LIST[tsb.idx] or F.DHIKR_LIST[1]
  local title = is_en and item.en_title or item.id_title
  if not item.is_auto then
    return title, item.latin, (is_en and item.en_arti or item.id_arti), ''
  end
  -- Auto-Wirid Bakda Shalat: 0..32 = Subhanallah, 33..65 = Alhamdulillah, 66..98 = Allahu Akbar, 99 = Tahlil Genap 100
  local c = (tsb.count or 0) % 100
  if c < 33 then
    local step = tostring(c + 1) .. '/33'
    return title, 'Subhaanallaah (' .. step .. ')',
           (is_en and 'Glory be to Allah' or 'Maha Suci Allah'),
           (is_en and 'Stage 1 of 3: Tasbih 33x' or 'Tahap 1 dari 3: Tasbih 33x')
  elseif c < 66 then
    local step = tostring(c - 32) .. '/33'
    return title, 'Alhamdulillaah (' .. step .. ')',
           (is_en and 'All praise is due to Allah' or 'Segala puji bagi Allah'),
           (is_en and 'Stage 2 of 3: Tahmid 33x' or 'Tahap 2 dari 3: Tahmid 33x')
  elseif c < 99 then
    local step = tostring(c - 65) .. '/33'
    return title, 'Allaahu Akbar (' .. step .. ')',
           (is_en and 'Allah is the Greatest' or 'Allah Maha Besar'),
           (is_en and 'Stage 3 of 3: Takbir 33x' or 'Tahap 3 dari 3: Takbir 33x')
  else
    return title, "Laa ilaaha illallaahu wahdahu laa syariika lah, lahul-mulku wa lahul-hamdu wa Huwa 'alaa kulli syai'in qadiir",
           (is_en and 'Completing 100: Tahlil & Praise' or 'Penyempurna ke-100: Tahlil & Pujian'),
           (is_en and '100/100 Complete!' or 'Genap 100/100 Selesai!')
  end
end

------------------------------------------------------------------ 2. Doa & Dzikir Search Engine & Dataset

local function _PDC()
  local C = {}
  for s in ("sholat:Sholat:Prayer;tidur:Tidur:Sleep;makan:Makan:Meals;safar:Safar:Travel;sakit:Sakit:Health;ortu:Ortu:Parents;pagi:Pagi:Morning;istighfar:Istighfar:Pardon"):gmatch("[^;]+") do
    local id, id_t, en_t = s:match("([^:]+):([^:]+):([^:]+)")
    C[#C + 1] = { id = id, t_id = id_t, t_en = en_t }
  end
  return C
end
F.DOA_CHIPS = _PDC()

local function _PSI()
  local list = {}
  local raw = '1|Doa Sebelum Tidur 1|Supplication Before Sleeping (1)|Tidur|Before & After Sleep|tidur sleep malam bed;6|Doa Bangun Tidur 1|Upon Waking Up (1)|Tidur|Before & After Sleep|tidur sleep pagi bangun;8|Doa Masuk Kamar Mandi|Entering the Restroom|Kamar Mandi|Bathroom & Lavatory|kamar mandi toilet wc;10|Doa Sebelum Wudhu|Before Ablution (Wudhu)|Wudhu|Ablution (Wudhu)|wudhu sholat prayer bersuci;25|Doa Ketika Sakit|Supplication When Feeling Pain / Sick|Sakit|During Sickness & Pain|sakit sick health sembuh;48|Doa Naik Kendaraan|Riding a Vehicle or Mount|Safar|Travel & Journey (Safar)|safar travel kendaraan perjalanan;68|Doa Memohon Kasih Sayang Untuk Orang Tua|Supplication for Mercy Upon Parents|Ortu|Parents & Family|ortu orang tua parents ibu ayah;128|Doa Keluar Rumah|Supplication Upon Leaving the Home|Rumah|Entering & Leaving Home|rumah home keluar safar tawakkal;135|Doa Sebelum Makan|Supplication Before Eating (Bismillah)|Makan|Food & Dining|makan food eat bismillah;141|Doa Berbuka Puasa|Upon Breaking the Fast (Iftar)|Puasa|Fasting & Iftar|puasa iftar berbuka sahur;172|Doa Sapu Jagad|Rabbana Atina (Goodness in Both Worlds)|Kebaikan|Goodness & Refuge|dunia akhirat selamat surga neraka kebaikan;214|Doa Kafaratul Majelis|Kafaratul Majlis (Expiation of the Gathering)|Majelis|Gatherings & Expiation|majelis kafaratul subhanakallahumma'
  for s in raw:gmatch('[^;]+') do
    local i, ni, ne, gi, ge, t = s:match('^(%d+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)$')
    if i then
      list[#list + 1] = {
        id = tonumber(i),
        nama_id = ni, nama_en = ne, grup_id = gi, grup_en = ge, tags = t,
        n_id = ni, n_en = ne, g_id = gi, g_en = ge
      }
    end
  end
  return list
end
F.SEED_DOA_INDEX = _PSI()

-- Smart Multi-Token & Synonym Search Engine with Relevance Ranking
local SYN_GROUPS = {
  'sholat shalat salat solat prayer namaz adzan azan wudhu sujud ruku iftitah tahiyat tahajud dhuha witir tarawih masjid imam saf jumat',
  'tidur sleep sleeping bed malam night bangun wake waking mimpi dream rebahan istirahat',
  'makan food eat eating meal minum drink bismillah kenyang lapar hidangan rezeki sahur berbuka',
  'safar travel journey kendaraan vehicle perjalanan mobil pesawat naik singgah jalan trip',
  'sakit sick pain ill health sembuh cure demam obat luka penyakit sehat gundah medis',
  'ortu orang tua parents parent ayah ibu bapak father mother keluarga family anak rahmat',
  'rumah home house keluar masuk leave leaving enter entering pintu selamat',
  'toilet wc kamar mandi restroom lavatory hajat istinja buang air kencing',
  'wudhu ablution bersuci bersihkan sholat prayer suci kumur',
  'hujan rain rainfall petir thunder angin wind cuaca weather mendung badai lebat air',
  'puasa fast fasting iftar berbuka sahur ramadhan tarawih lapar dahaga',
  'sedih sad gundah gelisah anxiety takut fear troubled bingung duka derita musibah cemas',
  'rezeki rizki sustenance wealth kaya utang debt harta miskin usaha rejeki nafkah berkah',
  'pagi morning subuh fajr terbit matahari dzikir pagi petang',
  'petang sore evening maghrib sunset dzikir malam night',
  'istighfar ampun taubat tobat forgive forgiveness pardon dosa sin khilaf salah sesal',
}
local SYN_MAP = {}
for _, g in ipairs(SYN_GROUPS) do
  for w in g:gmatch('%S+') do SYN_MAP[w] = g end
end

function F.filter_duas(items, q)
  if not q or q == '' then return items end
  local clean = q:lower():gsub('^%s+', ''):gsub('%s+$', '')
  if clean == '' then return items end

  local tokens = {}
  for w in clean:gmatch('%S+') do
    tokens[#tokens + 1] = w
  end
  if #tokens == 0 then return items end

  local token_syns = {}
  for _, tok in ipairs(tokens) do
    local sset = { [tok] = true }
    local sgroup = SYN_MAP[tok]
    if sgroup then
      for sw in sgroup:gmatch('%S+') do sset[sw] = true end
    else
      for k, g in pairs(SYN_MAP) do
        if k:find(tok, 1, true) or tok:find(k, 1, true) then
          for sw in g:gmatch('%S+') do sset[sw] = true end
          break
        end
      end
    end
    token_syns[#token_syns + 1] = { token = tok, set = sset }
  end

  local scored = {}
  for _, it in ipairs(items) do
    local nid = (it.nama_id or it.n_id or ''):lower()
    local nen = (it.nama_en or it.n_en or ''):lower()
    local gid = (it.grup_id or it.g_id or ''):lower()
    local gen = (it.grup_en or it.g_en or ''):lower()
    local tags_str = ''
    if type(it.tags) == 'table' then
      tags_str = table.concat(it.tags, ' '):lower()
    elseif it.tags then
      tags_str = tostring(it.tags):lower()
    end

    local score = 0
    local all_match = true

    if nid:find(clean, 1, true) or nen:find(clean, 1, true) then
      score = score + 120
    elseif gid:find(clean, 1, true) or gen:find(clean, 1, true) then
      score = score + 50
    end

    for _, ts in ipairs(token_syns) do
      local t_match = false
      local tok = ts.token

      if nid:find(tok, 1, true) or nen:find(tok, 1, true) then
        score = score + 60
        t_match = true
      elseif tags_str:find(tok, 1, true) then
        score = score + 35
        t_match = true
      elseif gid:find(tok, 1, true) or gen:find(tok, 1, true) then
        score = score + 25
        t_match = true
      else
        for syn in pairs(ts.set) do
          if nid:find(syn, 1, true) or nen:find(syn, 1, true) then
            score = score + 40
            t_match = true
            break
          elseif tags_str:find(syn, 1, true) then
            score = score + 25
            t_match = true
            break
          elseif gid:find(syn, 1, true) or gen:find(syn, 1, true) then
            score = score + 15
            t_match = true
            break
          end
        end
      end

      if not t_match and #tok >= 3 then
        local p_pat = '%f[%w]' .. tok
        if nid:find(p_pat) or nen:find(p_pat) or tags_str:find(p_pat) then
          score = score + 30
          t_match = true
        end
      end

      if not t_match then
        all_match = false
        break
      end
    end

    if all_match and score > 0 then
      scored[#scored + 1] = { item = it, score = score, id = it.id or 0 }
    end
  end

  table.sort(scored, function(a, b)
    if a.score ~= b.score then return a.score > b.score end
    return a.id < b.id
  end)

  local res = {}
  for i = 1, #scored do
    res[i] = scored[i].item
  end
  return res
end

------------------------------------------------------------------ 3. Kalender Hijriah & Hari Besar Islam (PHBI)

F.ISLAMIC_EVENTS = {
  { hm = 1, hd = 1, id = 'Tahun Baru Islam', en = 'Islamic New Year' },
  { hm = 1, hd = 10, id = 'Puasa Sunnah Asyura', en = 'Day of Ashura Fast' },
  { hm = 3, hd = 12, id = 'Maulid Nabi Muhammad', en = 'Mawlid al-Nabi' },
  { hm = 7, hd = 27, id = 'Isra Mi\'raj Nabi SAW', en = 'Isra and Mi\'raj' },
  { hm = 8, hd = 15, id = 'Malam Nisfu Sya\'ban', en = 'Night of Mid-Sha\'ban' },
  { hm = 9, hd = 1, id = 'Awal Puasa Ramadhan', en = 'Start of Ramadan' },
  { hm = 9, hd = 17, id = 'Malam Nuzulul Qur\'an', en = 'Nuzulul Quran' },
  { hm = 10, hd = 1, id = 'Hari Raya Idul Fitri', en = 'Eid al-Fitr' },
  { hm = 12, hd = 9, id = 'Puasa Sunnah Arafah', en = 'Day of Arafah Fast' },
  { hm = 12, hd = 10, id = 'Hari Raya Idul Adha', en = 'Eid al-Adha' },
}

-- Exact days until each Islamic holiday using astronomical MABIMS lunation table
function F.upcoming_events(eff_day, hy, adj, L, is_en)
  local list = {}
  for i = 1, #F.ISLAMIC_EVENTS do
    local ev = F.ISLAMIC_EVENTS[i]
    local target_hy = hy
    local ev_day = S.hijri_event_day(target_hy, ev.hm, ev.hd, adj)
    if ev_day < eff_day then
      target_hy = hy + 1
      ev_day = S.hijri_event_day(target_hy, ev.hm, ev.hd, adj)
    end
    local diff = ev_day - eff_day
    local gy, gm, gd = S.civil(ev_day)
    local g_str = tostring(gd) .. ' ' .. L.bulan_short[gm] .. ' ' .. tostring(gy)
    list[#list + 1] = {
      name = is_en and ev.en or ev.id,
      date_str = tostring(ev.hd) .. ' ' .. L.hijri_bulan[ev.hm] .. ' • ' .. g_str,
      diff = diff,
    }
  end
  table.sort(list, function(a, b) return a.diff < b.diff end)
  return list
end

function F.sunnah_fast_info(wday, hd, L, is_en)
  -- wday: 1 = Senin, 4 = Kamis; hd: 13..15 = Ayyamul Bidh
  local is_ayyamul = (hd >= 13 and hd <= 15)
  local is_senin = (wday == 1)
  local is_kamis = (wday == 4)

  if is_ayyamul and (is_senin or is_kamis) then
    return is_en and '* Today: Ayyamul Bidh & Mon/Thu Sunnah Fast *'
                  or '* Hari Ini: Puasa Ayyamul Bidh & Senin/Kamis *'
  elseif is_ayyamul then
    return is_en and ('* Today: Ayyamul Bidh Sunnah Fast (' .. tostring(hd) .. ' H) *')
                  or ('* Hari Ini: Puasa Sunnah Ayyamul Bidh (' .. tostring(hd) .. ' H) *')
  elseif is_senin then
    return is_en and '* Today: Monday Sunnah Fast *'
                  or '* Hari Ini: Jadwal Puasa Sunnah Senin *'
  elseif is_kamis then
    return is_en and '* Today: Thursday Sunnah Fast *'
                  or '* Hari Ini: Jadwal Puasa Sunnah Kamis *'
  else
    if hd < 13 then
      local d_left = 13 - hd
      return is_en and ('Next Ayyamul Bidh (13-15 H): in ' .. tostring(d_left) .. ' day(s)')
                    or ('Puasa Ayyamul Bidh (13-15 H): ' .. tostring(d_left) .. ' hari lagi')
    else
      return is_en and 'Sunnah Fasts: Mon/Thu & 13-15 Hijri (Ayyamul Bidh)'
                    or 'Puasa Sunnah: Senin-Kamis & 13-15 H (Ayyamul Bidh)'
    end
  end
end

function F.sunnah_fast_short(wday, hd, is_en)
  local is_ayyamul = (hd >= 13 and hd <= 15)
  local is_senin = (wday == 1)
  local is_kamis = (wday == 4)
  if is_ayyamul and (is_senin or is_kamis) then
    return is_en and 'Ayyamul Bidh + Sunnah' or 'Ayyamul Bidh + Sunnah'
  elseif is_ayyamul then
    return is_en and ('Ayyamul Bidh (' .. tostring(hd) .. ' H)')
                  or ('Ayyamul Bidh (' .. tostring(hd) .. ' H)')
  elseif is_senin then
    return is_en and 'Sunnah Fast: Monday' or 'Puasa Sunnah: Senin'
  elseif is_kamis then
    return is_en and 'Sunnah Fast: Thursday' or 'Puasa Sunnah: Kamis'
  end
  return nil
end

------------------------------------------------------------------ 4. Kompas Arah Kiblat (38 Provinsi Indonesia)

-- Ka'bah coordinates: 21.4225° N, 39.8262° E
local function _PPC()
  local m, s = {}, "Aceh:5.55:95.32;Sumatera Utara:3.59:98.67;Sumatera Barat:-0.95:100.35;Riau:0.51:101.45;Kepulauan Riau:0.92:104.45;Jambi:-1.61:103.61;Bengkulu:-3.8:102.26;Sumatera Selatan:-2.99:104.76;Kepulauan Bangka Belitung:-2.13:106.11;Lampung:-5.43:105.26;Banten:-6.12:106.15;DKI Jakarta:-6.21:106.85;Jawa Barat:-6.91:107.61;Jawa Tengah:-6.97:110.42;DI Yogyakarta:-7.8:110.36;Jawa Timur:-7.25:112.75;Bali:-8.65:115.22;Nusa Tenggara Barat:-8.58:116.11;Nusa Tenggara Timur:-10.17:123.61;Kalimantan Barat:-0.03:109.34;Kalimantan Tengah:-2.21:113.92;Kalimantan Selatan:-3.32:114.59;Kalimantan Timur:-0.5:117.15;Kalimantan Utara:2.84:117.37;Sulawesi Utara:1.47:124.84;Gorontalo:0.54:123.06;Sulawesi Tengah:-0.9:119.87;Sulawesi Barat:-2.68:118.89;Sulawesi Selatan:-5.14:119.43;Sulawesi Tenggara:-3.98:122.51;Maluku:-3.7:128.18;Maluku Utara:0.79:127.38;Papua:-2.53:140.72;Papua Barat:-0.86:134.06;Papua Barat Daya:-0.88:131.25;Papua Tengah:-3.36:135.5;Papua Pegunungan:-4.1:138.95;Papua Selatan:-8.49:140.4"
  for item in s:gmatch("[^;]+") do
    local n, lat, lon = item:match("([^:]+):([^:]+):([^:]+)")
    if n then m[n] = { tonumber(lat), tonumber(lon) } end
  end
  return m
end
F.PROV_COORDS = _PPC()


local function _PCM()
  local C = {}
  local function M(n, f, i, a, m, d, fx)
    C[#C + 1] = { name = n, fajr = f, isha = i, asr = a, mid = m, desc = d, isha_fixed = fx }
  end
  M('Kemenag / MABIMS', 20, 18, 1, 20, 'Subuh 20°, Isya 18°')
  M('Muslim World League (MWL)', 18, 17, 1, 3, 'Subuh 18°, Isya 17°')
  M('Umm Al-Qura (Makkah)', 18.5, 0, 1, 4, 'Subuh 18.5°, Isya +90m', 90)
  M('Egyptian Gen. Authority', 19.5, 17.5, 1, 5, 'Subuh 19.5°, Isya 17.5°')
  M('ISNA (North America)', 15, 15, 1, 2, 'Subuh 15°, Isya 15°')
  M('Univ. Karachi (Hanafi)', 18, 18, 2, 1, 'Subuh 18°, Isya 18°, Ashar 2x')
  return C
end
F.CUSTOM_METHODS = _PCM()


F.WORLD_COUNTRIES = {
  {
    name = 'Indonesia',
    is_id = true,
    method_id = 20,
    cities_count = '38 Provinsi',
    cities = {}
  },
  {
    name = 'Koordinat Manual (GPS)',
    name_en = 'Manual GPS Coordinates',
    is_custom = true,
    cities_count = 'Lat/Long',
    cities = {}
  },
  {
    name = 'Arab Saudi',
    method_id = 4,
    cities_count = '8 Kota',
    cities = {
      { name = 'Makkah', lat = 21.4225, lon = 39.8262, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Madinah', lat = 24.4672, lon = 39.6111, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Riyadh', lat = 24.7136, lon = 46.6753, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Jeddah', lat = 21.5433, lon = 39.1728, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Dammam', lat = 26.4207, lon = 50.0888, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Taif', lat = 21.2854, lon = 40.4244, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Tabuk', lat = 28.3835, lon = 36.5662, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
      { name = 'Abha', lat = 18.2164, lon = 42.5053, tz = 3, method = 'Umm Al-Qura', fajr_ang = 18.5, isha_ang = 18.0, isha_fixed_min = 90 },
    }
  },
  {
    name = 'Malaysia',
    method_id = 17,
    cities_count = '9 Kota',
    cities = {
      { name = 'Kuala Lumpur', lat = 3.1390, lon = 101.6869, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Putrajaya', lat = 2.9264, lon = 101.6964, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'George Town (Penang)', lat = 5.4141, lon = 100.3288, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Johor Bahru', lat = 1.4927, lon = 103.7414, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Shah Alam (Selangor)', lat = 3.0738, lon = 101.5183, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Kota Kinabalu (Sabah)', lat = 5.9804, lon = 116.0735, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Kuching (Sarawak)', lat = 1.5533, lon = 110.3592, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Ipoh (Perak)', lat = 4.5975, lon = 101.0901, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Melaka', lat = 2.1896, lon = 102.2501, tz = 8, method = 'JAKIM', fajr_ang = 20.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Singapura',
    method_id = 11,
    cities_count = '1 Kota',
    cities = {
      { name = 'Singapore', lat = 1.3521, lon = 103.8198, tz = 8, method = 'MUIS', fajr_ang = 20.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Brunei Darussalam',
    method_id = 17,
    cities_count = '2 Kota',
    cities = {
      { name = 'Bandar Seri Begawan', lat = 4.9031, lon = 114.9398, tz = 8, method = 'KHEU', fajr_ang = 20.0, isha_ang = 18.0 },
      { name = 'Kuala Belait', lat = 4.5836, lon = 114.2312, tz = 8, method = 'KHEU', fajr_ang = 20.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Turki',
    method_id = 13,
    cities_count = '6 Kota',
    cities = {
      { name = 'Istanbul', lat = 41.0082, lon = 28.9784, tz = 3, method = 'Diyanet', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Ankara', lat = 39.9334, lon = 32.8597, tz = 3, method = 'Diyanet', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Bursa', lat = 40.1885, lon = 29.0610, tz = 3, method = 'Diyanet', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Konya', lat = 37.8714, lon = 32.4846, tz = 3, method = 'Diyanet', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Izmir', lat = 38.4237, lon = 27.1428, tz = 3, method = 'Diyanet', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Antalya', lat = 36.8969, lon = 30.7133, tz = 3, method = 'Diyanet', fajr_ang = 18.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Mesir',
    method_id = 5,
    cities_count = '5 Kota',
    cities = {
      { name = 'Kairo', lat = 30.0444, lon = 31.2357, tz = 2, method = 'Egypt General', fajr_ang = 19.5, isha_ang = 17.5 },
      { name = 'Alexandria', lat = 31.2001, lon = 29.9187, tz = 2, method = 'Egypt General', fajr_ang = 19.5, isha_ang = 17.5 },
      { name = 'Giza', lat = 30.0131, lon = 31.2089, tz = 2, method = 'Egypt General', fajr_ang = 19.5, isha_ang = 17.5 },
      { name = 'Luxor', lat = 25.6872, lon = 32.6396, tz = 2, method = 'Egypt General', fajr_ang = 19.5, isha_ang = 17.5 },
      { name = 'Aswan', lat = 24.0889, lon = 32.8998, tz = 2, method = 'Egypt General', fajr_ang = 19.5, isha_ang = 17.5 },
    }
  },
  {
    name = 'Uni Emirat Arab',
    method_id = 16,
    cities_count = '5 Kota',
    cities = {
      { name = 'Dubai', lat = 25.2048, lon = 55.2708, tz = 4, method = 'UAE Awqaf', fajr_ang = 18.2, isha_ang = 18.2 },
      { name = 'Abu Dhabi', lat = 24.4539, lon = 54.3773, tz = 4, method = 'UAE Awqaf', fajr_ang = 18.2, isha_ang = 18.2 },
      { name = 'Sharjah', lat = 25.3463, lon = 55.4209, tz = 4, method = 'UAE Awqaf', fajr_ang = 18.2, isha_ang = 18.2 },
      { name = 'Ajman', lat = 25.4052, lon = 55.5136, tz = 4, method = 'UAE Awqaf', fajr_ang = 18.2, isha_ang = 18.2 },
      { name = 'Al Ain', lat = 24.2075, lon = 55.7447, tz = 4, method = 'UAE Awqaf', fajr_ang = 18.2, isha_ang = 18.2 },
    }
  },
  {
    name = 'Palestina',
    method_id = 23,
    cities_count = '5 Kota',
    cities = {
      { name = 'Al-Quds (Yerusalem)', lat = 31.7683, lon = 35.2137, tz = 3, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Gaza', lat = 31.5017, lon = 34.4668, tz = 3, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Ramallah', lat = 31.9038, lon = 35.2034, tz = 3, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Hebron (Al-Khalil)', lat = 31.5326, lon = 35.0998, tz = 3, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Nablus', lat = 32.2227, lon = 35.2621, tz = 3, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Qatar',
    method_id = 10,
    cities_count = '3 Kota',
    cities = {
      { name = 'Doha', lat = 25.2854, lon = 51.5310, tz = 3, method = 'Qatar Awqaf', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Al Rayyan', lat = 25.2919, lon = 51.4244, tz = 3, method = 'Qatar Awqaf', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Al Wakrah', lat = 25.1768, lon = 51.6048, tz = 3, method = 'Qatar Awqaf', fajr_ang = 18.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Kuwait',
    method_id = 9,
    cities_count = '2 Kota',
    cities = {
      { name = 'Kuwait City', lat = 29.3759, lon = 47.9774, tz = 3, method = 'Kuwait Awqaf', fajr_ang = 18.0, isha_ang = 17.5 },
      { name = 'Hawalli', lat = 29.3328, lon = 48.0283, tz = 3, method = 'Kuwait Awqaf', fajr_ang = 18.0, isha_ang = 17.5 },
    }
  },
  {
    name = 'Yordania',
    method_id = 23,
    cities_count = '3 Kota',
    cities = {
      { name = 'Amman', lat = 31.9539, lon = 35.9106, tz = 3, method = 'Jordan Awqaf', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Zarqa', lat = 32.0728, lon = 36.0880, tz = 3, method = 'Jordan Awqaf', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Irbid', lat = 32.5568, lon = 35.8469, tz = 3, method = 'Jordan Awqaf', fajr_ang = 18.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Maroko',
    method_id = 21,
    cities_count = '5 Kota',
    cities = {
      { name = 'Casablanca', lat = 33.5731, lon = -7.5898, tz = 1, method = 'Morocco Awqaf', fajr_ang = 19.0, isha_ang = 17.0 },
      { name = 'Rabat', lat = 34.0209, lon = -6.8416, tz = 1, method = 'Morocco Awqaf', fajr_ang = 19.0, isha_ang = 17.0 },
      { name = 'Marrakech', lat = 31.6295, lon = -7.9811, tz = 1, method = 'Morocco Awqaf', fajr_ang = 19.0, isha_ang = 17.0 },
      { name = 'Fes', lat = 34.0181, lon = -5.0078, tz = 1, method = 'Morocco Awqaf', fajr_ang = 19.0, isha_ang = 17.0 },
      { name = 'Tangier', lat = 35.7595, lon = -5.8340, tz = 1, method = 'Morocco Awqaf', fajr_ang = 19.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Jepang',
    method_id = 3,
    cities_count = '6 Kota',
    cities = {
      { name = 'Tokyo', lat = 35.6762, lon = 139.6503, tz = 9, method = 'Japan Muslim Assoc', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Osaka', lat = 34.6937, lon = 135.5023, tz = 9, method = 'Japan Muslim Assoc', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Kyoto', lat = 35.0116, lon = 135.7681, tz = 9, method = 'Japan Muslim Assoc', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Nagoya', lat = 35.1815, lon = 136.9066, tz = 9, method = 'Japan Muslim Assoc', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Fukuoka', lat = 33.5902, lon = 130.4017, tz = 9, method = 'Japan Muslim Assoc', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Sapporo', lat = 43.0618, lon = 141.3545, tz = 9, method = 'Japan Muslim Assoc', fajr_ang = 18.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Korea Selatan',
    method_id = 3,
    cities_count = '4 Kota',
    cities = {
      { name = 'Seoul', lat = 37.5665, lon = 126.9780, tz = 9, method = 'Korea Muslim Fed', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Busan', lat = 35.1796, lon = 129.0756, tz = 9, method = 'Korea Muslim Fed', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Incheon', lat = 37.4563, lon = 126.7052, tz = 9, method = 'Korea Muslim Fed', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Daegu', lat = 35.8714, lon = 128.6014, tz = 9, method = 'Korea Muslim Fed', fajr_ang = 18.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Australia',
    method_id = 3,
    cities_count = '6 Kota',
    cities = {
      { name = 'Sydney', lat = -33.8688, lon = 151.2093, tz = 10, method = 'Muslim World League', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Melbourne', lat = -37.8136, lon = 144.9631, tz = 10, method = 'Muslim World League', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Brisbane', lat = -27.4698, lon = 153.0251, tz = 10, method = 'Muslim World League', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Perth', lat = -31.9505, lon = 115.8605, tz = 8, method = 'Muslim World League', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Adelaide', lat = -34.9285, lon = 138.6007, tz = 9.5, method = 'Muslim World League', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Canberra', lat = -35.2809, lon = 149.1300, tz = 10, method = 'Muslim World League', fajr_ang = 18.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Inggris (UK)',
    method_id = 3,
    cities_count = '5 Kota',
    cities = {
      { name = 'London', lat = 51.5074, lon = -0.1278, tz = 0, method = 'London Central Mosque', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Birmingham', lat = 52.4862, lon = -1.8904, tz = 0, method = 'MWL', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Manchester', lat = 53.4808, lon = -2.2426, tz = 0, method = 'MWL', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Leeds', lat = 53.8008, lon = -1.5491, tz = 0, method = 'MWL', fajr_ang = 18.0, isha_ang = 18.0 },
      { name = 'Glasgow', lat = 55.8642, lon = -4.2518, tz = 0, method = 'MWL', fajr_ang = 18.0, isha_ang = 18.0 },
    }
  },
  {
    name = 'Amerika Serikat (USA)',
    method_id = 2,
    cities_count = '6 Kota',
    cities = {
      { name = 'New York', lat = 40.7128, lon = -74.0060, tz = -5, method = 'ISNA', fajr_ang = 15.0, isha_ang = 15.0 },
      { name = 'Los Angeles', lat = 34.0522, lon = -118.2437, tz = -8, method = 'ISNA', fajr_ang = 15.0, isha_ang = 15.0 },
      { name = 'Chicago', lat = 41.8781, lon = -87.6298, tz = -6, method = 'ISNA', fajr_ang = 15.0, isha_ang = 15.0 },
      { name = 'Houston', lat = 29.7604, lon = -95.3698, tz = -6, method = 'ISNA', fajr_ang = 15.0, isha_ang = 15.0 },
      { name = 'Washington D.C.', lat = 38.9072, lon = -77.0369, tz = -5, method = 'ISNA', fajr_ang = 15.0, isha_ang = 15.0 },
      { name = 'San Francisco', lat = 37.7749, lon = -122.4194, tz = -8, method = 'ISNA', fajr_ang = 15.0, isha_ang = 15.0 },
    }
  },
  {
    name = 'Jerman',
    method_id = 3,
    cities_count = '5 Kota',
    cities = {
      { name = 'Berlin', lat = 52.5200, lon = 13.4050, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Frankfurt', lat = 50.1109, lon = 8.6821, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Munich', lat = 48.1351, lon = 11.5820, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Hamburg', lat = 53.5511, lon = 9.9937, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Cologne', lat = 50.9375, lon = 6.9603, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Prancis',
    method_id = 12,
    cities_count = '3 Kota',
    cities = {
      { name = 'Paris', lat = 48.8566, lon = 2.3522, tz = 1, method = 'UOIF', fajr_ang = 12.0, isha_ang = 12.0 },
      { name = 'Lyon', lat = 45.7640, lon = 4.8357, tz = 1, method = 'UOIF', fajr_ang = 12.0, isha_ang = 12.0 },
      { name = 'Marseille', lat = 43.2965, lon = 5.3698, tz = 1, method = 'UOIF', fajr_ang = 12.0, isha_ang = 12.0 },
    }
  },
  {
    name = 'Belanda',
    method_id = 3,
    cities_count = '3 Kota',
    cities = {
      { name = 'Amsterdam', lat = 52.3676, lon = 4.9041, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Rotterdam', lat = 51.9244, lon = 4.4777, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Den Haag', lat = 52.0705, lon = 4.3007, tz = 1, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Rusia',
    method_id = 14,
    cities_count = '3 Kota',
    cities = {
      { name = 'Moskwa', lat = 55.7558, lon = 37.6173, tz = 3, method = 'Russia DUM', fajr_ang = 16.0, isha_ang = 15.0 },
      { name = 'St. Petersburg', lat = 59.9343, lon = 30.3351, tz = 3, method = 'Russia DUM', fajr_ang = 16.0, isha_ang = 15.0 },
      { name = 'Kazan', lat = 55.7963, lon = 49.1088, tz = 3, method = 'Russia DUM', fajr_ang = 16.0, isha_ang = 15.0 },
    }
  },
  {
    name = 'Tiongkok',
    method_id = 3,
    cities_count = '4 Kota',
    cities = {
      { name = 'Beijing', lat = 39.9042, lon = 116.4074, tz = 8, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Shanghai', lat = 31.2304, lon = 121.4737, tz = 8, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Guangzhou', lat = 23.1291, lon = 113.2644, tz = 8, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
      { name = 'Ürümqi', lat = 43.8256, lon = 87.6168, tz = 6, method = 'MWL', fajr_ang = 18.0, isha_ang = 17.0 },
    }
  },
  {
    name = 'Pakistan',
    method_id = 1,
    cities_count = '3 Kota',
    cities = {
      { name = 'Islamabad', lat = 33.6844, lon = 73.0479, tz = 5, method = 'Univ. Karachi', fajr_ang = 18.0, isha_ang = 18.0, asr_factor = 2.0 },
      { name = 'Karachi', lat = 24.8607, lon = 67.0011, tz = 5, method = 'Univ. Karachi', fajr_ang = 18.0, isha_ang = 18.0, asr_factor = 2.0 },
      { name = 'Lahore', lat = 31.5204, lon = 74.3587, tz = 5, method = 'Univ. Karachi', fajr_ang = 18.0, isha_ang = 18.0, asr_factor = 2.0 },
    }
  },
  {
    name = 'India',
    method_id = 1,
    cities_count = '3 Kota',
    cities = {
      { name = 'New Delhi', lat = 28.6139, lon = 77.2090, tz = 5.5, method = 'Univ. Karachi', fajr_ang = 18.0, isha_ang = 18.0, asr_factor = 2.0 },
      { name = 'Mumbai', lat = 19.0760, lon = 72.8777, tz = 5.5, method = 'Univ. Karachi', fajr_ang = 18.0, isha_ang = 18.0, asr_factor = 2.0 },
      { name = 'Hyderabad', lat = 17.3850, lon = 78.4867, tz = 5.5, method = 'Univ. Karachi', fajr_ang = 18.0, isha_ang = 18.0, asr_factor = 2.0 },
    }
  },
}

function F.compute_qibla(prov, cfg)
  local lat_deg = (cfg and cfg.lat) or (prov and F.PROV_COORDS[prov] and F.PROV_COORDS[prov][1]) or -6.21
  local lon_deg = (cfg and cfg.lon) or (prov and F.PROV_COORDS[prov] and F.PROV_COORDS[prov][2]) or 106.85
  local lat1 = lat_deg * math.pi / 180.0
  local lon1 = lon_deg * math.pi / 180.0
  local lat2 = 21.4225 * math.pi / 180.0
  local lon2 = 39.8262 * math.pi / 180.0
  local dlon = lon2 - lon1

  local y = math.sin(dlon) * math.cos(lat2)
  local x = math.cos(lat1) * math.sin(lat2) - math.sin(lat1) * math.cos(lat2) * math.cos(dlon)
  local brng = math.atan(y, x) * 180.0 / math.pi
  brng = (brng + 360.0) % 360.0

  -- Great-circle distance in km (Earth radius ~ 6371 km)
  local cos_d = math.sin(lat1) * math.sin(lat2) + math.cos(lat1) * math.cos(lat2) * math.cos(dlon)
  if cos_d > 1 then cos_d = 1 elseif cos_d < -1 then cos_d = -1 end
  local dist_km = math.floor(math.acos(cos_d) * 6371.0 + 0.5)

  return {
    lat = lat_deg,
    lon = lon_deg,
    deg = math.floor(brng + 0.5),
    from_north_west = math.floor(360.0 - brng + 0.5),
    dist_km = dist_km,
  }
end

------------------------------------------------------------------ Word-wrap helper for Doa screen

function F.wrap_lines(s, fname, max_w)
  if not s or s == '' then return {} end
  local str = tostring(s):sub(1, 1200)
  local out = {}
  local line = ''
  for word in str:gmatch('%S+') do
    local cand = (line == '') and word or (line .. ' ' .. word)
    if line ~= '' and S.text_w(cand, fname) > max_w then
      out[#out + 1] = line
      line = word
      if #out >= 10 then break end
    else
      line = cand
    end
  end
  if line ~= '' and #out < 10 then out[#out + 1] = line end
  return out
end

------------------------------------------------------------------ Drawing: Tab 2 (Tasbih Digital)

function F.draw_tasbih(gg, cfg, tsb, draw_btn, now_info)
  local W = S.W
  local is_en = (cfg.lang == 'en')
  local title, latin, arti, sub_stage = F.active_dhikr_text(tsb, is_en)

  -- Top App Bar: App Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, is_en and 'Digital Tasbih' or 'Tasbih Digital', { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- Responsive Dhikr Card at top (y = 56..216, h = 160)
  S.card(gg, 20, 56, W - 40, 160, 2, true)

  -- Title (Line 1)
  S.center_text(gg, W // 2, 66, title, 'small', 400)

  -- Transliteration / Latin (Responsive 1-2 lines)
  local lat_lines
  local lf = 'medium'
  if S.text_w(latin, 'medium') <= 400 then
    lat_lines = { latin }
  else
    if S.text_w(latin, 'small') <= 400 then
      lat_lines = { latin }
      lf = 'small'
    else
      lat_lines = F.wrap_lines(latin, 'small', 400)
      lf = 'small'
    end
  end

  local cur_y = 92
  if #lat_lines == 1 then
    S.center_text(gg, W // 2, cur_y + 2, lat_lines[1], lf, 400)
    cur_y = cur_y + (lf == 'medium' and 28 or 24)
  else
    for _, line in ipairs(lat_lines) do
      S.center_text(gg, W // 2, cur_y, line, lf, 400)
      cur_y = cur_y + 22
    end
  end

  -- Meaning / Arti (Responsive 1-2 lines, wrapped without any truncation)
  local arti_lines = F.wrap_lines('"' .. arti .. '"', 'small', 400)
  cur_y = math.max(cur_y + 4, 126)
  for _, line in ipairs(arti_lines) do
    S.center_text(gg, W // 2, cur_y, line, 'small', 400)
    cur_y = cur_y + 22
  end

  -- Target / Stage Note at bottom of card
  if sub_stage ~= '' then
    S.center_text(gg, W // 2, 190, sub_stage, 'small', 400)
  else
    local tgt_s = (tsb.target == 0) and (is_en and 'Target: Infinity' or 'Target: Tanpa Batas')
                  or ('Target: ' .. tostring(tsb.target) .. 'x')
    S.center_text(gg, W // 2, 190, tgt_s, 'small', 400)
  end

  -- Circular 33-Bead Tasbih Ring (cx = 240, cy = 384, R = 130)
  local cx, cy, R = W // 2, 384, 130
  -- Tassel / Imamah ornament at top of ring (12 o'clock)
  gg:line(cx, cy - R - 18, cx, cy - R - 6, { line_width = 2 })
  S.diamond(gg, cx, cy - R - 20, 4, true)

  -- Subtle inner guide ring
  gg:circle(cx, cy, R - 18, { line_width = 1 })

  local active_beads = tsb.count % 33
  if tsb.count > 0 and active_beads == 0 then active_beads = 33 end

  for b = 1, 33 do
    local ang = (b - 1) * (2.0 * math.pi / 33.0) - (math.pi / 2.0)
    local bx = cx + math.floor(R * math.cos(ang) + 0.5)
    local by = cy + math.floor(R * math.sin(ang) + 0.5)
    local is_marker = (b == 11 or b == 22 or b == 33)
    local rad = is_marker and 7 or 5
    if b <= active_beads then
      gg:circle(bx, by, rad, { fill = true })
      if b == active_beads then
        gg:circle(bx, by, rad + 3, { line_width = 2 })
      end
    else
      gg:circle(bx, by, rad, { line_width = is_marker and 2 or 1 })
    end
  end

  -- Big TrueType Count inside the ring
  local cnt_str = tostring(tsb.count or 0)
  S.big_clock(gg, cnt_str, cx, cy - 56, 82, cfg.cfont)

  local lap = (tsb.target and tsb.target > 0) and (tsb.count // tsb.target) or (tsb.count // 33)
  local sub_ring = (is_en and 'Lap: ' or 'Putaran: ') .. tostring(lap) ..
                   '  |  ' .. tostring(active_beads) .. '/33'
  S.center_text(gg, cx, cy + 30, sub_ring, 'small', 180)
  S.center_text(gg, cx, cy + 54, is_en and '[ Tap / OK ]' or '[ Ketuk / OK ]', 'small', 160)

  -- Daily & Lifetime Totals (y = 546)
  local stat_s = (is_en and 'Today: ' or 'Hari ini: ') .. tostring(tsb.today or 0) ..
                 '  •  Total: ' .. tostring(tsb.total or 0)
  S.center_text(gg, W // 2, 546, stat_s, 'small', W - 40)

  -- 4 Control Buttons row (y = 574, h = 54, symmetric across 20..460)
  local bw_ctl = 104
  local tgt_btn = (tsb.target == 0) and 'Tgt: ~' or ('Tgt: ' .. tostring(tsb.target))
  draw_btn(gg, 20 + 0 * 112, 574, bw_ctl, 54, is_en and '< Prev' or '< Dzikir', false, 'small')
  draw_btn(gg, 20 + 1 * 112, 574, bw_ctl, 54, is_en and 'Next >' or 'Dzikir >', false, 'small')
  draw_btn(gg, 20 + 2 * 112, 574, bw_ctl, 54, tgt_btn, false, 'small')
  draw_btn(gg, 20 + 3 * 112, 574, bw_ctl, 54, 'Reset 0', false, 'small')

  -- Wide Primary Count Button (y = 642, h = 132, ends at 774, 26px bottom margin)
  S.round_rect(gg, 20, 642, W - 40, 132, 14, nil, true, 0)
  S.round_rect(gg, 20, 642, W - 40, 132, 14, 2)
  S.round_rect(gg, 23, 645, W - 46, 126, 11, 1)
  S.center_text(gg, W // 2, 674, is_en and '+ TAP TO COUNT' or '+ KETUK UNTUK HITUNG', 'large')
  S.center_text(gg, W // 2, 718, is_en and '[ Tap Screen or OK Button ]' or '[ Ketuk Layar atau Tombol OK ]', 'small')
end

------------------------------------------------------------------ Drawing: Tab 3 (Doa & Dzikir Pilihan)

function F.draw_doa(gg, cfg, state, draw_btn, now_info)
  local W = S.W
  local is_en = (cfg.lang == 'en')
  state = state or {}

  -- Top App Bar: App Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, is_en and 'Daily Duas' or 'Doa & Dzikir', { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- VIEW 1: Reading Detail of a Selected Dua
  if state.viewing then
    local d = state.viewing
    local is_saved = (d.id and state.saved_set and state.saved_set[d.id])

    -- Navigation & Bookmark Bar (y = 56..94, h = 38)
    draw_btn(gg, 20, 56, 120, 38, is_en and '< Back' or '< Kembali', false, 'small')
    local bkmk_lbl = is_saved and (is_en and 'Saved' or 'Tersimpan') or (is_en and '+ Save' or '+ Simpan')
    draw_btn(gg, W - 146, 56, 126, 38, bkmk_lbl, is_saved, 'small')

    -- Title Banner (y = 98..172, h = 74)
    S.card(gg, 20, 98, W - 40, 74, 2, true)
    local cat_str = is_en and (d.grup_en or d.g_en or d.grup_id or d.g_id or '') or (d.grup_id or d.g_id or '')
    S.center_text(gg, W // 2, 104, cat_str, 'small', W - 64)
    local t_str = is_en and (d.nama_en or d.n_en or d.nama_id or d.n_id or '') or (d.nama_id or d.n_id or '')
    if S.text_w(t_str, 'medium') <= W - 64 then
      S.center_text(gg, W // 2, 128, t_str, 'medium', W - 64)
    else
      local tlines = F.wrap_lines(t_str, 'small', W - 64)
      if #tlines == 1 then
        S.center_text(gg, W // 2, 128, tlines[1], 'small', W - 64)
      else
        S.center_text(gg, W // 2, 124, tlines[1], 'small', W - 64)
        if tlines[2] then
          S.center_text(gg, W // 2, 144, tlines[2], 'small', W - 64)
        end
      end
    end

    -- Reading Card Container (y = 178..704, h = 526)
    S.card(gg, 20, 178, W - 40, 526, 2, 2)

    if state.fetching then
      S.center_text(gg, W // 2, 340, is_en and 'Downloading supplication...' or 'Mengunduh doa dari API...', 'medium')
      S.center_text(gg, W // 2, 375, is_en and 'Connecting to network...' or 'Menghubungkan ke jaringan...', 'small')
    else
      local tr_text = tostring(d.tr or d.latin or ''):sub(1, 600)
      gg:text(38, 192, is_en and 'TRANSLITERATION (LATIN):' or 'BACAAN LATIN:', { font = S.font('small') })
      local lat_lines = F.wrap_lines(tr_text, 'medium', W - 76)
      local use_sml = (#lat_lines > 4)
      if use_sml then lat_lines = F.wrap_lines(tr_text, 'small', W - 76) end
      local font_n = use_sml and 'small' or 'medium'
      local lh = use_sml and 22 or 26
      local ly = 216
      local max_lat_lines = math.min(#lat_lines, 6)
      for i = 1, max_lat_lines do
        gg:text(38, ly, lat_lines[i], { font = S.font(font_n) })
        ly = ly + lh
      end

      local div_y = ly + 10
      S.divider(gg, div_y, 40, W - 40)

      local my = div_y + 12
      gg:text(38, my, is_en and 'MEANING & TRANSLATION:' or 'ARTINYA:', { font = S.font('small') })
      local raw_arti = is_en and (d.arti_en or d.arti_id or '') or (d.arti_id or '')
      local arti_text = tostring(raw_arti):sub(1, 600)
      local arti_lines = F.wrap_lines('"' .. arti_text .. '"', 'small', W - 76)
      local ay = my + 22
      local max_arti_lines = math.min(#arti_lines, 8)
      for i = 1, max_arti_lines do
        gg:text(38, ay, arti_lines[i], { font = S.font('small') })
        ay = ay + 20
      end

      if d.src and d.src ~= '' then
        local clean_src = tostring(d.src):gsub('[\r\n]+', ' ')
        local src_lines = F.wrap_lines(clean_src, 'small', W - 80)
        local sl_n = math.min(#src_lines, 2)
        local base_sy = 684 - (sl_n - 1) * 18
        S.divider(gg, base_sy - 8, 40, W - 40)
        for si = 1, sl_n do
          S.center_text(gg, W // 2, base_sy + (si - 1) * 18, src_lines[si], 'small', W - 64)
        end
      end
    end

    -- Bottom Navigation (y = 712, h = 64)
    draw_btn(gg, 20, 712, 136, 64, is_en and '< Prev' or '< Seb', false, 'medium')
    draw_btn(gg, 172, 712, 136, 64, is_en and 'All Duas' or 'Daftar Doa', false, 'small')
    draw_btn(gg, 324, 712, 136, 64, is_en and 'Next >' or 'Ber >', false, 'medium')
    return
  end

  -- VIEW 2: Search Engine & Saved Duas List
  local cur_tab = state.tab or 'search'
  local saved_count = state.saved_items and #state.saved_items or 0

  -- Segmented Control (y = 56..92, h = 36)
  local segs = {
    is_en and 'Search Duas' or 'Cari Doa',
    (is_en and 'Saved (' or 'Tersimpan (') .. tostring(saved_count) .. ')'
  }
  S.segmented_control(gg, 20, 56, W - 40, 36, segs, (cur_tab == 'saved') and 2 or 1)

  local items = (cur_tab == 'saved') and (state.saved_items or {}) or (state.filtered_items or {})

  if cur_tab == 'search' then
    -- Google-Style Search Bar (y = 98..144, h = 46)
    S.round_rect(gg, 20, 98, W - 40, 46, 12, nil, true, 0)
    S.round_rect(gg, 20, 98, W - 40, 46, 12, 2)
    -- Clean vector magnifying glass
    gg:circle(40, 121, 6, { line_width = 2 })
    gg:line(45, 126, 50, 131, { line_width = 2 })
    local q_display = state.query or ''
    if q_display == '' then
      local ph = is_en and 'Tap to search (e.g. prayer, sleep, meal)...' or 'Ketuk untuk cari (sholat, tidur, makan)...'
      gg:text(64, 114, S.fit_text(ph, 'small', W - 118), { font = S.font('small') })
    else
      gg:text(64, 112, S.fit_text(q_display, 'medium', W - 128), { font = S.font('medium') })
      -- Clear (X) icon on right
      draw_btn(gg, W - 62, 104, 34, 34, 'X', false, 'small')
    end

    -- Quick Suggestion Topic Chips (y = 150..212, h = 62 across 2 rows)
    for idx, ch in ipairs(F.DOA_CHIPS) do
      local row = (idx <= 4) and 0 or 1
      local col = (idx <= 4) and (idx - 1) or (idx - 5)
      local cx = 20 + col * 112
      local cy = 150 + row * 32
      local cw = 104
      local ch_label = is_en and ch.t_en or ch.t_id
      local is_active = (state.query:lower() == ch.id or state.query:lower() == ch_label:lower())
      S.round_rect(gg, cx, cy, cw, 28, 8, nil, true, 0)
      S.round_rect(gg, cx, cy, cw, 28, 8, is_active and 2 or 1)
      S.center_text(gg, cx + cw // 2, cy + 5, ch_label, 'small', cw - 8)
    end
  end

  -- TableView Results (y = 220..704, h = 484)
  local per_page = 5
  local cur_page = state.page or 1
  local total_pages = math.max(1, (#items + per_page - 1) // per_page)
  if cur_page > total_pages then cur_page = total_pages end

  local start_idx = (cur_page - 1) * per_page + 1
  local end_idx = math.min(#items, start_idx + per_page - 1)

  if #items == 0 then
    -- Clean Empty State
    S.card(gg, 20, 226, W - 40, 260, 2, true)
    if cur_tab == 'saved' then
      S.center_text(gg, W // 2, 270, is_en and 'No Saved Duas Yet' or 'Belum Ada Doa Tersimpan', 'large', W - 64)
      S.center_text(gg, W // 2, 310, is_en and 'Search supplications in the search tab' or 'Cari doa di tab pencarian dan tekan', 'small', W - 64)
      S.center_text(gg, W // 2, 332, is_en and 'and tap "Save" to keep them offline.' or 'tombol "Simpan" untuk membaca offline.', 'small', W - 64)
    else
      S.center_text(gg, W // 2, 270, is_en and 'No Supplications Found' or 'Doa Tidak Ditemukan', 'large', W - 64)
      local q_info = '"' .. (state.query or '') .. '"'
      S.center_text(gg, W // 2, 310, is_en and ('No results for ' .. q_info) or ('Tidak ada hasil untuk ' .. q_info), 'small', W - 64)
      S.center_text(gg, W // 2, 332, is_en and 'Try: prayer, sleep, meals, travel, parents' or 'Coba kata kunci: sholat, tidur, makan, sakit', 'small', W - 64)
    end
  else
    for i = start_idx, end_idx do
      local it = items[i]
      local slot = i - start_idx
      local ry = 222 + slot * 96
      if state.keyboard and ry >= 440 then break end
      local is_saved = (it.id and state.saved_set and state.saved_set[it.id])

      S.round_rect(gg, 20, ry, W - 40, 90, 12, nil, true, 0)
      S.round_rect(gg, 20, ry, W - 40, 90, 12, 1)

      -- ID & Category Capsule Pill (y = ry + 8..ry + 28)
      local cat_name = is_en and (it.grup_en or it.g_en or it.grup_id or it.g_id or '') or (it.grup_id or it.g_id or '')
      local pill_str = '#' .. tostring(it.id or '') .. ' • ' .. cat_name
      local max_pw = is_saved and (W - 138) or (W - 96)
      local pw = math.min(S.text_w(pill_str, 'small') + 18, max_pw)
      S.round_rect(gg, 32, ry + 8, pw, 20, 6, nil, true, 0)
      S.round_rect(gg, 32, ry + 8, pw, 20, 6, 1)
      gg:text(38, ry + 9, S.fit_text(pill_str, 'small', pw - 10), { font = S.font('small') })

      if is_saved then
        local bw = is_en and 54 or 62
        local bx = W - bw - 38
        S.round_rect(gg, bx, ry + 8, bw, 20, 6, nil, true, 0)
        S.round_rect(gg, bx, ry + 8, bw, 20, 6, 1)
        S.center_text(gg, bx + bw // 2, ry + 10, is_en and 'SAVED' or 'SIMPAN', 'small', bw - 6)
      end

      -- Title Text (wrapped across 1-2 lines so it never cuts off awkwardly!)
      local title_str = is_en and (it.nama_en or it.n_en or it.nama_id or it.n_id or '') or (it.nama_id or it.n_id or '')
      local max_tw = W - 92
      if S.text_w(title_str, 'medium') <= max_tw then
        gg:text(34, ry + 42, title_str, { font = S.font('medium') })
      else
        local tlines = F.wrap_lines(title_str, 'small', max_tw)
        if #tlines == 1 then
          gg:text(34, ry + 42, tlines[1], { font = S.font('small') })
        else
          gg:text(34, ry + 34, tlines[1], { font = S.font('small') })
          if tlines[2] then
            local l2 = tlines[2]
            if tlines[3] then l2 = S.fit_text(l2 .. ' ' .. tlines[3], 'small', max_tw) end
            gg:text(34, ry + 56, l2, { font = S.font('small') })
          end
        end
      end

      -- Arrow >
      gg:text(W - 44, ry + 36, '>', { font = S.font('medium') })
    end
  end

  -- Bottom Pagination Bar (y = 714..776, h = 62)
  draw_btn(gg, 20, 714, 120, 62, is_en and '< Prev' or '< Seb', cur_page > 1, 'medium')
  local page_info = string.format('%d / %d (%d)', cur_page, total_pages, #items)
  S.center_text(gg, W // 2, 736, page_info, 'small', 180)
  draw_btn(gg, W - 140, 714, 120, 62, is_en and 'Next >' or 'Ber >', cur_page < total_pages, 'medium')

  -- VIEW 3: Virtual Touch QWERTY Keyboard Modal (when typing)
  if state.keyboard then
    local ky = 460
    local kh = 320
    S.round_rect(gg, 10, ky, W - 20, kh, 14, nil, true, 0)
    S.round_rect(gg, 10, ky, W - 20, kh, 14, 2)

    -- Keyboard Helper Bar (y = 468..506, h = 38)
    draw_btn(gg, 20, 468, 100, 38, is_en and 'Close' or 'Tutup', false, 'small')
    local preview = 'Q: ' .. (state.query or '') .. '|'
    S.center_text(gg, W // 2, 478, S.fit_text(preview, 'small', 220), 'small', 220)
    draw_btn(gg, W - 120, 468, 100, 38, is_en and 'Del' or 'Hapus', false, 'small')

    local lk = state.last_key or ''

    -- Row 1: Q W E R T Y U I O P (10 keys)
    local r1 = { 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P' }
    for k = 1, 10 do
      local kx = 16 + (k - 1) * 45
      local ch = r1[k]
      local is_hit = (lk == ch:lower())
      gg:rect(kx, 514, 41, 46, { fill = true, color = is_hit and 1 or 0 })
      gg:rect(kx, 514, 41, 46, { line_width = is_hit and 2 or 1 })
      S.center_text(gg, kx + 20, 526, ch, 'medium', 36)
    end

    -- Row 2: A S D F G H J K L (9 keys)
    local r2 = { 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L' }
    for k = 1, 9 do
      local kx = 38 + (k - 1) * 45
      local ch = r2[k]
      local is_hit = (lk == ch:lower())
      gg:rect(kx, 568, 41, 46, { fill = true, color = is_hit and 1 or 0 })
      gg:rect(kx, 568, 41, 46, { line_width = is_hit and 2 or 1 })
      S.center_text(gg, kx + 20, 580, ch, 'medium', 36)
    end

    -- Row 3: Z X C V B N M (7 keys)
    local r3 = { 'Z', 'X', 'C', 'V', 'B', 'N', 'M' }
    for k = 1, 7 do
      local kx = 24 + (k - 1) * 46
      local ch = r3[k]
      local is_hit = (lk == ch:lower())
      gg:rect(kx, 622, 42, 46, { fill = true, color = is_hit and 1 or 0 })
      gg:rect(kx, 622, 42, 46, { line_width = is_hit and 2 or 1 })
      S.center_text(gg, kx + 21, 634, ch, 'medium', 36)
    end
    -- Backspace Key in Row 3
    draw_btn(gg, 352, 622, 108, 46, 'Del', false, 'small')

    -- Row 4: Space Bar & Done Button
    draw_btn(gg, 24, 676, 260, 54, is_en and 'Space' or 'Spasi', false, 'small')
    draw_btn(gg, 296, 676, 164, 54, is_en and 'Search' or 'Cari Doa', true, 'medium')
  end
end

------------------------------------------------------------------ Drawing: Tab 4 (Kalender Hijriah & PHBI)

function F.draw_hijri_screen(gg, cfg, now_info, draw_btn)
  local W = S.W
  local L = S.L(cfg)
  local is_en = (cfg.lang == 'en')
  local hy, hm, hd, hijri_str, after_maghrib, eff_day = S.effective_hijri(now_info, cfg)

  -- Top App Bar: App Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, is_en and 'Hijri & Islamic Days' or 'Kalender & Hari Islam', { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- Today's Hijri & Sunnah Fasting Modern Card (y = 64..190, h = 126)
  S.card(gg, 20, 64, W - 40, 126, 2, true)
  S.center_text(gg, W // 2, 74, hijri_str, 'large', W - 64)
  local sub_note = after_maghrib
    and (is_en and ' (Night)' or ' (Malam)')
    or ' • MABIMS'
  S.center_text(gg, W // 2, 110, now_info.date_str .. sub_note, 'small', W - 56)
  local fast_str = F.sunnah_fast_info(now_info.wday, hd, L, is_en)
  S.center_text(gg, W // 2, 142, fast_str, 'small', W - 56)

  -- Upcoming Islamic Events Inset Grouped List (Apple style: continuous rounded card with hairline dividers)
  S.center_text(gg, W // 2, 204, is_en and 'UPCOMING ISLAMIC DAYS' or 'HARI BESAR ISLAM TERDEKAT', 'small')
  local evs = F.upcoming_events(eff_day, hy, cfg.adj or 0, L, is_en)
  local card_h = 456
  S.round_rect(gg, 20, 226, W - 40, card_h, 14, nil, true, 0)
  S.round_rect(gg, 20, 226, W - 40, card_h, 14, 2)

  for i = 1, 6 do
    local ev = evs[i]
    if ev then
      local ry = 226 + (i - 1) * 76
      if i > 1 then
        gg:line(36, ry, W - 36, ry, { line_width = 1 })
      end
      -- Timeline bullet dot
      gg:circle(38, ry + 38, (ev.diff == 0) and 4 or 3, { fill = true })
      if ev.diff == 0 then
        gg:circle(38, ry + 38, 7, { line_width = 1 })
      end
      local ev_f = (S.text_w(ev.name, 'medium') <= 305) and 'medium' or 'small'
      local ev_y = (ev_f == 'medium') and (ry + 13) or (ry + 16)
      gg:text(52, ev_y, S.fit_text(ev.name, ev_f, 305), { font = S.font(ev_f) })
      gg:text(52, ry + 42, ev.date_str, { font = S.font('small') })

      local d_lbl
      if ev.diff == 0 then
        d_lbl = is_en and 'Today!' or 'Hari Ini!'
      else
        d_lbl = '+' .. tostring(ev.diff) .. (is_en and ' d' or ' hr')
      end
      -- Apple capsule badge for countdown
      S.round_rect(gg, W - 116, ry + 22, 80, 32, 16, nil, true, 0)
      S.round_rect(gg, W - 116, ry + 22, 80, 32, 16, (ev.diff == 0) and 2 or 1)
      S.center_text(gg, W - 76, ry + 28, d_lbl, 'small', 74)
    end
  end

  -- Button to open Full Monthly Hijri Calendar (y = 708..776, h = 68, bottom margin 24px)
  draw_btn(gg, 20, 708, W - 40, 68, is_en and 'View Hijri Calendar' or 'Buka Kalender Hijriah', false, 'medium')
end

------------------------------------------------------------------ Hijri Event & Fasting Helpers

function F.get_hijri_event(hy, hm, hd, is_en, holiday_from_api)
  if holiday_from_api and holiday_from_api ~= '' then
    return holiday_from_api
  end
  for i = 1, #F.ISLAMIC_EVENTS do
    local ev = F.ISLAMIC_EVENTS[i]
    if ev.hm == hm and ev.hd == hd then
      return is_en and ev.en or ev.id
    end
  end
  if hm == 9 and hd >= 21 and (hd % 2 == 1) then
    return is_en and ('Lailat-ul-Qadr (' .. hd .. ' Ramadan)') or ('Malam Lailatul Qadar (' .. hd .. ' Ramadhan)')
  end
  return nil
end

function F.get_fasting_info(hm, hd, wd, is_en)
  local is_ramadan = (hm == 9)
  if is_ramadan then
    return is_en and 'Obligatory Fast: Ramadan' or 'Puasa Wajib: Ramadhan'
  end
  if hm == 10 and hd == 1 then
    return is_en and 'Forbidden to Fast: Eid al-Fitr' or 'Diharamkan Berpuasa: Hari Raya Idul Fitri'
  end
  if hm == 12 and hd == 10 then
    return is_en and 'Forbidden to Fast: Eid al-Adha' or 'Diharamkan Berpuasa: Hari Raya Idul Adha'
  end
  if hm == 12 and (hd >= 11 and hd <= 13) then
    return is_en and 'Forbidden to Fast: Tashreeq Days' or 'Diharamkan Berpuasa: Hari Tasyrik'
  end
  if hm == 12 and hd == 9 then
    return is_en and 'Sunnah Fast: Day of Arafah' or 'Puasa Sunnah: Hari Arafah'
  end
  if hm == 1 and hd == 9 then
    return is_en and 'Sunnah Fast: Tasu\'a' or 'Puasa Sunnah: Tasu\'a'
  end
  if hm == 1 and hd == 10 then
    return is_en and 'Sunnah Fast: Ashura' or 'Puasa Sunnah: Asyura'
  end
  local is_bidh = (hd >= 13 and hd <= 15)
  local is_senin = (wd == 1)
  local is_kamis = (wd == 4)
  if is_bidh and (is_senin or is_kamis) then
    local d_name = is_senin and (is_en and 'Monday' or 'Senin') or (is_en and 'Thursday' or 'Kamis')
    return is_en and ('Sunnah Fast: Ayyamul Bidh & ' .. d_name) or ('Puasa Sunnah: Ayyamul Bidh & ' .. d_name)
  elseif is_bidh then
    return is_en and 'Sunnah Fast: Ayyamul Bidh (13, 14, 15)' or 'Puasa Sunnah: Ayyamul Bidh (13, 14, 15)'
  elseif is_senin or is_kamis then
    local d_name = is_senin and (is_en and 'Monday' or 'Senin') or (is_en and 'Thursday' or 'Kamis')
    return is_en and ('Sunnah Fast: ' .. d_name) or ('Puasa Sunnah: ' .. d_name)
  end
  return is_en and 'Regular Day (No specific fast)' or 'Hari Biasa (Bukan waktu puasa khusus)'
end

------------------------------------------------------------------ Drawing: Full Monthly Hijri Calendar (Aladhan & Astronomical)

function F.draw_hijri_cal_screen(gg, cfg, now_info, cur_hy, cur_hm, selected_hd, draw_btn)
  local W = S.W
  local L = S.L(cfg)
  local is_en = (cfg.lang == 'en')
  local days, days_count = S.load_hijri_month(cur_hy, cur_hm, cfg)
  days_count = days_count or 30

  local now_hy, now_hm, now_hd = S.effective_hijri(now_info, cfg)

  -- Top App Bar: App Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, is_en and 'Hijri Calendar' or 'Kalender Hijriah', { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- Month Switcher Card (y = 56..120, h = 64)
  S.round_rect(gg, 20, 56, W - 40, 64, 14, nil, true, 0)
  S.round_rect(gg, 20, 56, W - 40, 64, 14, 2)
  draw_btn(gg, 28, 64, 46, 48, '<', false, 'medium')
  draw_btn(gg, W - 74, 64, 46, 48, '>', false, 'medium')

  local m_title = L.hijri_bulan[cur_hm] .. ' ' .. tostring(cur_hy) .. ' H'
  S.center_text(gg, W // 2, 64, m_title, 'medium', W - 160)

  if days and days[1] and days[days_count] then
    local d1 = days[1]
    local dN = days[days_count]
    local g_sub = string.format('%d %s – %d %s %d M', d1.gd, L.bulan_short[d1.gm], dN.gd, L.bulan_short[dN.gm], dN.gy)
    S.center_text(gg, W // 2, 92, g_sub, 'small', W - 160)
  end

  -- Calendar Grid Card (y = 126..572, h = 446, r = 14)
  S.round_rect(gg, 20, 126, W - 40, 446, 14, nil, true, 0)
  S.round_rect(gg, 20, 126, W - 40, 446, 14, 2)

  -- Weekday Header Row (y = 130..158)
  local hdrs = is_en
    and { 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT' }
    or { 'AHD', 'SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB' }
  local x0 = 23
  local cw = 62
  for c = 0, 6 do
    local col_cx = x0 + c * cw + cw // 2
    S.center_text(gg, col_cx, 134, hdrs[c + 1], 'small')
  end
  gg:line(36, 160, W - 36, 160, { line_width = 1 })

  -- Calendar Days Grid (y = 162..568)
  local first_wd = (days and days[1] and days[1].wd) or 0
  for hd = 1, days_count do
    local slot = first_wd + (hd - 1)
    local c = slot % 7
    local r = slot // 7
    local cx = x0 + c * cw
    local cy = 162 + r * 67
    local cell_cx = cx + cw // 2
    local d_info = days and days[hd] or { hd = hd, gd = hd, gm = 1, gy = 2026, wd = slot % 7 }

    local is_today = (cur_hy == now_hy and cur_hm == now_hm and hd == now_hd)
    local is_sel = (hd == selected_hd)

    if is_today then
      -- Apple Inverted Full-Black Squircle Card for Today
      gg:rect(cx + 2, cy, cw - 4, 65, { fill = true, radius = 8 })
    elseif is_sel then
      -- Big outline box for Selected Day
      S.round_rect(gg, cx + 2, cy, cw - 4, 65, 8, 2)
    end

    local text_col = is_today and 0 or nil
    S.center_text(gg, cell_cx, cy + 4, tostring(hd), 'medium', cw, text_col)
    S.center_text(gg, cell_cx, cy + 28, tostring(d_info.gd), 'small', cw, text_col)

    -- Badges
    local ev_name = F.get_hijri_event(cur_hy, cur_hm, hd, is_en, d_info.holiday)
    local is_bidh = (hd >= 13 and hd <= 15 and (cur_hm ~= 12 or hd ~= 13))
    local is_fast = is_bidh or (d_info.wd == 1 or d_info.wd == 4) or (cur_hm == 9)

    if ev_name then
      S.diamond(gg, cell_cx, cy + 55, 3, true, text_col)
    elseif is_fast then
      local c_opts = { fill = true }
      if text_col ~= nil then c_opts.color = text_col end
      gg:circle(cell_cx, cy + 55, 2, c_opts)
    end
  end

  -- Selected Day Detail Card (y = 578..700, h = 122, r = 12)
  S.round_rect(gg, 20, 578, W - 40, 122, 12, nil, true, 0)
  S.round_rect(gg, 20, 578, W - 40, 122, 12, 2)

  local sel_d = (days and days[selected_hd]) or (days and days[1]) or { hd = selected_hd or 1, gd = 1, gm = 1, gy = 2026, wd = 0 }
  local day_name = L.hari[sel_d.wd + 1]
  local h_line = string.format('%s, %d %s %d H', day_name, sel_d.hd, L.hijri_bulan[cur_hm], cur_hy)
  S.center_text(gg, W // 2, 586, h_line, 'medium', W - 64)

  local g_line = string.format('%d %s %d M', sel_d.gd, L.bulan[sel_d.gm], sel_d.gy)
  S.center_text(gg, W // 2, 614, g_line, 'small', W - 64)
  gg:line(36, 638, W - 36, 638, { line_width = 1 })

  local ev_sel = F.get_hijri_event(cur_hy, cur_hm, sel_d.hd, is_en, sel_d.holiday)
  local fast_sel = F.get_fasting_info(cur_hm, sel_d.hd, sel_d.wd, is_en)
  if ev_sel then
    S.center_text(gg, W // 2, 646, '* ' .. ev_sel .. ' *', 'small', W - 64)
    S.center_text(gg, W // 2, 672, fast_sel, 'small', W - 64)
  else
    S.center_text(gg, W // 2, 658, fast_sel, 'small', W - 64)
  end

  -- Bottom 4 Action Buttons (y = 712..776, h = 64)
  local btn_lbls = is_en
    and { '< Prev', 'Today', 'Next >', 'Fetch' }
    or { '< Bulan', 'Hari Ini', 'Bulan >', 'Unduh' }
  local bw = (W - 40 - 24) // 4 -- ~104px
  for i = 1, 4 do
    local bx = 20 + (i - 1) * (bw + 8)
    draw_btn(gg, bx, 712, bw, 64, btn_lbls[i], false, 'small')
  end
end

------------------------------------------------------------------ Drawing: Tab 5 (Kompas Arah Kiblat)

function F.draw_qibla_screen(gg, cfg, draw_btn, now_info)
  local W = S.W
  local is_en = (cfg.lang == 'en')
  local q = F.compute_qibla(cfg.prov, cfg)

  -- Top App Bar: App Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, is_en and 'Qibla Direction' or 'Kompas Arah Kiblat', { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- Location & Distance Card (y = 64..138, h = 74)
  S.card(gg, 20, 64, W - 40, 74, 2, true)
  local sub_loc = (cfg.country == 'Indonesia' or not cfg.country) and (cfg.prov or 'DKI Jakarta') or (cfg.country or 'Indonesia')
  local loc_s = (cfg.kab or 'Kota Jakarta') .. '  •  ' .. sub_loc
  local loc_f = (S.text_w(loc_s, 'medium') <= W - 56) and 'medium' or 'small'
  S.center_text(gg, W // 2, 72, loc_s, loc_f, W - 56)
  local lat_dir = (q.lat < 0) and (is_en and 'S' or 'LS') or (is_en and 'N' or 'LU')
  local lon_dir = (q.lon >= 0) and (is_en and 'E' or 'BT') or (is_en and 'W' or 'BB')
  local coord_s = string.format('%.1f° %s, %.1f° %s  •  Makkah: %d km',
    math.abs(q.lat), lat_dir, math.abs(q.lon), lon_dir, q.dist_km)
  S.center_text(gg, W // 2, 102, coord_s, 'small', W - 48)

  -- Large Compass Rose (cx = 240, cy = 308, R = 142)
  local cx, cy, R = W // 2, 308, 142
  local hub_r = 40
  gg:circle(cx, cy, R, { line_width = 2 })
  gg:circle(cx, cy, R - 6, { line_width = 1 })
  gg:circle(cx, cy, hub_r, { fill = true, color = 0 })
  gg:circle(cx, cy, hub_r, { line_width = 2 })
  gg:circle(cx, cy, hub_r - 4, { line_width = 1 })

  -- Degree ticks every 15 degrees
  for deg = 0, 345, 15 do
    local rad = (deg - 90) * math.pi / 180.0
    local r_in = (deg % 90 == 0) and (R - 18) or ((deg % 30 == 0) and (R - 14) or (R - 10))
    local x1 = cx + math.floor(r_in * math.cos(rad) + 0.5)
    local y1 = cy + math.floor(r_in * math.sin(rad) + 0.5)
    local x2 = cx + math.floor((R - 6) * math.cos(rad) + 0.5)
    local y2 = cy + math.floor((R - 6) * math.sin(rad) + 0.5)
    gg:line(x1, y1, x2, y2, { line_width = (deg % 90 == 0) and 2 or 1 })
  end

  -- Cardinal Labels inside compass ring
  S.center_text(gg, cx, cy - R + 20, is_en and 'N (0°)' or 'U (0°)', 'small')
  S.center_text(gg, cx, cy + R - 42, 'S (180°)', 'small')
  gg:text(cx - R + 22, cy - 12, is_en and 'W' or 'B', { font = S.font('small') })
  S.right_text(gg, cx + R - 22, cy - 12, is_en and 'E' or 'T', 'small')

  -- Qibla Pointer Arrow starting from outer edge of center hub (`hub_r`) to `tip_r`
  local q_rad = (q.deg - 90) * math.pi / 180.0
  local perp = q_rad + math.pi / 2.0
  local start_x = cx + math.floor(hub_r * math.cos(q_rad) + 0.5)
  local start_y = cy + math.floor(hub_r * math.sin(q_rad) + 0.5)
  local tip_r = R - 24
  local tip_x = cx + math.floor(tip_r * math.cos(q_rad) + 0.5)
  local tip_y = cy + math.floor(tip_r * math.sin(q_rad) + 0.5)
  local base_r = R - 48
  local bx1 = cx + math.floor(base_r * math.cos(q_rad) + 10 * math.cos(perp) + 0.5)
  local by1 = cy + math.floor(base_r * math.sin(q_rad) + 10 * math.sin(perp) + 0.5)
  local bx2 = cx + math.floor(base_r * math.cos(q_rad) - 10 * math.cos(perp) + 0.5)
  local by2 = cy + math.floor(base_r * math.sin(q_rad) - 10 * math.sin(perp) + 0.5)

  gg:line(start_x, start_y, tip_x, tip_y, { line_width = 3 })
  gg:polygon({ tip_x, tip_y, bx1, by1, bx2, by2 }, { fill = true })

  -- Ka'bah emblem box outside compass ring at Qibla azimuth
  local kx = cx + math.floor((R + 18) * math.cos(q_rad) + 0.5)
  local ky = cy + math.floor((R + 18) * math.sin(q_rad) + 0.5)
  gg:rect(kx - 9, ky - 9, 18, 18, { fill = true })
  gg:rect(kx - 9, ky - 5, 18, 3, { fill = true, color = 0 })

  -- Clean center degree readout inside the white hub dial
  S.center_text(gg, cx, cy - 14, tostring(q.deg) .. '°', 'medium')

  -- Qibla Guide Modern Card (y = 478..776, h = 298, bottom margin 24px)
  S.card(gg, 20, 478, W - 40, 298, 2, true)
  local brng_title = is_en
    and ('Qibla Bearing: ' .. tostring(q.deg) .. '° WNW')
    or ('Arah Kiblat: ' .. tostring(q.deg) .. '° Barat Laut')
  S.center_text(gg, W // 2, 492, brng_title, 'large', W - 64)

  local sub_deg = is_en
    and ('(' .. tostring(q.from_north_west) .. '° West from North)')
    or ('(' .. tostring(q.from_north_west) .. '° ke kiri / Barat dari arah Utara)')
  S.center_text(gg, W // 2, 524, sub_deg, 'small', W - 64)

  S.divider(gg, 554, 44, W - 44)

  if is_en then
    S.center_text(gg, W // 2, 572, '1. Point top of device toward North (N).', 'small', W - 48)
    S.center_text(gg, W // 2, 600, '2. Bold arrow & Ka\'bah point to Ka\'bah.', 'small', W - 48)
    S.center_text(gg, W // 2, 628, '3. Tap button below to change location.', 'small', W - 48)
    draw_btn(gg, 40, 696, W - 80, 56, 'Change Location', false, 'medium')
  else
    S.center_text(gg, W // 2, 572, '1. Hadapkan atas perangkat ke Utara (U).', 'small', W - 48)
    S.center_text(gg, W // 2, 600, '2. Panah hitam tebal menunjuk ke Ka\'bah.', 'small', W - 48)
    S.center_text(gg, W // 2, 628, '3. Ketuk tombol di bawah untuk ubah kota.', 'small', W - 48)
    draw_btn(gg, 40, 696, W - 80, 56, 'Ganti Wilayah', false, 'medium')
  end
end

------------------------------------------------------------------ Drawing: Settings & App Info Page

function F.draw_settings_screen(gg, cfg, now_info, draw_btn, about_expanded, scroll_y, modal_open)
  local W, H = S.W, S.H
  local is_en = (cfg.lang == 'en')
  local _, _, _, hijri_str = S.effective_hijri(now_info, cfg)
  scroll_y = scroll_y or 0

  local sub_loc = (cfg.country == 'Indonesia' or not cfg.country) and (cfg.prov or 'DKI Jakarta') or (cfg.country or 'Indonesia')
  local loc_sub = (cfg.kab or 'Kota Jakarta') .. ' • ' .. sub_loc

  local cnames = is_en and S.CFONT_NAMES.en or S.CFONT_NAMES.id
  local cfont_lbl = cnames[cfg.cfont or 1] or cnames[1]

  local adj = cfg.adj or 0
  local adj_s
  if adj == 0 then
    adj_s = is_en and 'Auto MABIMS (0 Day)' or 'Otomatis MABIMS (0 Hari)'
  else
    local sign = (adj > 0) and ('+' .. tostring(adj)) or tostring(adj)
    adj_s = is_en and ('Manual (' .. sign .. ' Day)') or ('Koreksi Manual (' .. sign .. ' Hari)')
  end

  local is_exp = (about_expanded == true)
  local ab_body_h = is_exp and 680 or 0
  local ab_h = 64 + ab_body_h
  local total_content_bottom = 690 + ab_h + 20
  local viewport_bottom = 726
  local max_scroll = math.max(0, total_content_bottom - viewport_bottom)

  -- Viewport clipping helpers (ensures no text/elements slice through header or footer)
  local function vtext(x, y, s, opts)
    if y >= 64 and y <= 704 then
      gg:text(x, y, s, opts)
    end
  end

  local function vcenter_text(x, y, s, font_name, max_w)
    if y >= 64 and y <= 704 then
      S.center_text(gg, x, y, s, font_name, max_w)
    end
  end

  local function vdivider(y, x1, x2)
    if y >= 60 and y <= 720 then
      gg:line(x1 or 36, y, x2 or (W - 36), y, { line_width = 1 })
    end
  end

  -- ==============================================================
  -- 1. Scrollable Content Layer (offset by scroll_y)
  -- ==============================================================

  -- Grouped Card 1: Core Settings (y = 66..678, h = 612, 9 rows)
  local card1_y = 66 - scroll_y
  if (card1_y + 612) >= 60 and card1_y <= 726 then
    S.round_rect(gg, 20, card1_y, W - 40, 612, 14, nil, true, 0)
    S.round_rect(gg, 20, card1_y, W - 40, 612, 14, 2)
  end

  -- 1px Hairline dividers between grouped rows
  for i = 1, 8 do
    local ly = card1_y + i * 68
    if ly >= 60 and ly <= 720 then
      gg:line(36, ly, W - 36, ly, { line_width = 1 })
    end
  end

  -- Row 1: App Language
  local ry1 = card1_y
  vtext(36, ry1 + 12, is_en and 'App Language' or 'Bahasa Aplikasi', { font = S.font('medium') })
  vtext(36, ry1 + 38, is_en and 'English (EN)' or 'Bahasa Indonesia (ID)', { font = S.font('small') })
  if ry1 >= 40 and ry1 <= 680 then
    local lang_idx = (cfg.lang == 'en') and 2 or 1
    S.segmented_control(gg, W - 142, ry1 + 15, 106, 38, { 'ID', 'EN' }, lang_idx)
  end

  -- Row 2: Prayer Location
  local ry2 = card1_y + 68
  vtext(36, ry2 + 12, is_en and 'Prayer Location' or 'Lokasi Wilayah', { font = S.font('medium') })
  vtext(36, ry2 + 38, S.fit_text(loc_sub, 'small', 295), { font = S.font('small') })
  if ry2 >= 40 and ry2 <= 680 then
    draw_btn(gg, W - 134, ry2 + 15, 98, 38, is_en and 'Change...' or 'Ubah...', false, 'small')
  end

  -- Row 3: Clock & Counter Font
  local ry3 = card1_y + 136
  vtext(36, ry3 + 12, is_en and 'Clock & Counter Font' or 'Gaya Font Jam', { font = S.font('medium') })
  vtext(36, ry3 + 38, cfont_lbl, { font = S.font('small') })
  if ry3 >= 40 and ry3 <= 680 then
    draw_btn(gg, W - 124, ry3 + 15, 88, 38, is_en and 'Select >' or 'Pilih >', false, 'small')
  end

  -- Row 4: Hijri Calibration
  local ry4 = card1_y + 204
  vtext(36, ry4 + 12, is_en and 'Hijri Calibration' or 'Koreksi Hijriah', { font = S.font('medium') })
  vtext(36, ry4 + 38, S.fit_text(adj_s, 'small', 265), { font = S.font('small') })
  if ry4 >= 40 and ry4 <= 680 then
    local adj_idx = (adj == -1 and 1) or (adj == 0 and 2) or (adj == 1 and 3) or 2
    S.segmented_control(gg, W - 176, ry4 + 15, 140, 38, { '-1', '0', '+1' }, adj_idx)
  end

  -- Row 5: Maghrib Rollover
  local ry5 = card1_y + 272
  vtext(36, ry5 + 12, is_en and 'Maghrib Rollover' or 'Ganti Hari Maghrib', { font = S.font('medium') })
  local magh_sub = (cfg.maghrib ~= false)
    and (is_en and 'Active at Maghrib' or 'Aktif saat Maghrib')
    or (is_en and 'At 00:00 (Midnight)' or 'Pukul 00:00 (Tengah Malam)')
  vtext(36, ry5 + 38, S.fit_text(magh_sub, 'small', 240), { font = S.font('small') })
  if ry5 >= 40 and ry5 <= 680 then
    local magh_idx = (cfg.maghrib ~= false) and 2 or 1
    local magh_seg = is_en and 'Sunset' or 'Maghrib'
    S.segmented_control(gg, W - 200, ry5 + 15, 180, 38, { '00:00', magh_seg }, magh_idx)
  end

  -- Row 6: Prayer Lockscreen
  local ry6 = card1_y + 340
  vtext(36, ry6 + 12, is_en and 'Prayer Lockscreen' or 'Mode Lockscreen', { font = S.font('medium') })
  local lock_sub = cfg.lock
    and (is_en and 'Active on lockscreen' or 'Aktif di layar kunci')
    or (is_en and 'Disabled' or 'Tidak aktif')
  vtext(36, ry6 + 38, lock_sub, { font = S.font('small') })
  if ry6 >= 40 and ry6 <= 680 then
    local lock_idx = cfg.lock and 2 or 1
    S.segmented_control(gg, W - 146, ry6 + 15, 110, 38, { 'OFF', 'ON' }, lock_idx)
  end

  -- Row 7: Lockscreen Ayah Quote Refresh
  local ry7 = card1_y + 408
  vtext(36, ry7 + 12, is_en and 'Ayah Quote Refresh' or 'Rotasi Ayat Lockscreen', { font = S.font('medium') })
  local qref_names_id = { 'Tiap Hari', 'Tiap Waktu Shalat', 'Tiap Jam', 'Offline Saja' }
  local qref_names_en = { 'Daily', 'Prayer Times', 'Hourly', 'Offline Only' }
  local qref_cur = cfg.qrefresh or 1
  local qref_sub = is_en and qref_names_en[qref_cur] or qref_names_id[qref_cur]
  vtext(36, ry7 + 38, qref_sub, { font = S.font('small') })
  if ry7 >= 40 and ry7 <= 680 then
    draw_btn(gg, W - 124, ry7 + 15, 88, 38, is_en and 'Select >' or 'Pilih >', false, 'small')
  end

  -- Row 8: App Auto-Update (GitHub Releases)
  local ry8 = card1_y + 476
  vtext(36, ry8 + 12, is_en and 'App Auto-Update' or 'Pembaruan Aplikasi', { font = S.font('medium') })
  local up_sub = is_en and ('Version ' .. S.APP_VERSION .. ' • Check GitHub') or ('Versi ' .. S.APP_VERSION .. ' • Cek rilis GitHub')
  vtext(36, ry8 + 38, S.fit_text(up_sub, 'small', 250), { font = S.font('small') })
  if ry8 >= 40 and ry8 <= 680 then
    draw_btn(gg, W - 124, ry8 + 15, 88, 38, is_en and 'Check >' or 'Cek >', false, 'small')
  end

  -- Row 9: Storage & Cache Management
  local ry9 = card1_y + 544
  vtext(36, ry9 + 12, is_en and 'Storage & Cache' or 'Penyimpanan & Cache', { font = S.font('medium') })
  local stor_sub = is_en and 'Manage offline data & Doa cache' or 'Kelola data offline & cache doa'
  vtext(36, ry9 + 38, S.fit_text(stor_sub, 'small', 250), { font = S.font('small') })
  if ry9 >= 40 and ry9 <= 680 then
    draw_btn(gg, W - 124, ry9 + 15, 88, 38, is_en and 'Manage >' or 'Kelola >', false, 'small')
  end

  -- Grouped Card 2: Accordion About MuslimInk
  local card2_y = 690 - scroll_y
  if (card2_y + ab_h) >= 60 and card2_y <= 726 then
    S.card(gg, 20, card2_y, W - 40, ab_h, 2, is_exp)
  end

  -- Header Row of About Accordion
  local title_ab = is_en and 'About MuslimInk' or 'Tentang MuslimInk'
  local sub_ab = is_en and ('Version ' .. S.APP_VERSION .. ' • By fiqsr') or ('Versi ' .. S.APP_VERSION .. ' • Oleh fiqsr')
  vtext(36, card2_y + 12, title_ab, { font = S.font('medium') })
  vtext(36, card2_y + 38, sub_ab, { font = S.font('small') })

  -- Dropdown Triangle Indicator
  if card2_y >= 40 and card2_y <= 680 then
    local tx, ty = W - 44, card2_y + 32
    if is_exp then
      -- Downward triangle ▼
      gg:polygon({ tx - 6, ty - 3, tx + 6, ty - 3, tx, ty + 5 }, { fill = true })
    else
      -- Rightward triangle ▶
      gg:polygon({ tx - 4, ty - 6, tx + 4, ty, tx - 4, ty + 6 }, { fill = true })
    end
  end

  if is_exp then
    local dy = card2_y + 64
    vdivider(dy)

    -- Section 1: Developer & GitHub Repository
    dy = dy + 10
    vtext(36, dy, is_en and 'DEVELOPER & PROJECT' or 'PENGEMBANG & PROYEK', { font = S.font('small') })
    dy = dy + 22
    vtext(36, dy, 'Developer : fiqsr (Syafiq)', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'GitHub    : github.com/fiqsr', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'Repo      : MuslimInk-XTEINK-X4-PRO', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'License   : Open Source (MIT)', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, (is_en and 'App Vers. : v' or 'Versi App : v') .. S.APP_VERSION, { font = S.font('small') })

    -- Section 2: Calculation Engine & Astronomics
    dy = dy + 26
    vdivider(dy - 8)
    vtext(36, dy, is_en and 'PRAYER & CALCULATION ENGINE' or 'SISTEM HISAB & ASTRONOMIS', { font = S.font('small') })
    dy = dy + 22
    vtext(36, dy, 'Indonesia : Kemenag RI (514 Kab/Kota)', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'Global/LN : Aladhan API (230+ Kota)', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, is_en and 'Methods   : Ummul Quro, MWL, MUIS, etc' or 'Metode LN : Ummul Quro, MWL, MUIS, dll', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'Offline   : Hisab Meeus & MABIMS', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, is_en and 'GPS Coords: Custom Lat/Lon/TZ' or 'Koordinat : GPS Input Manual Numpad', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, is_en and 'Qibla Dir : Kaaba (Great-Circle)' or 'Arah Kiblat: Ka\'bah (Trigonometri Bola)', { font = S.font('small') })

    -- Section 3: Hardware & Runtime Status
    dy = dy + 26
    vdivider(dy - 8)
    vtext(36, dy, is_en and 'HARDWARE & COMPATIBILITY' or 'SPESIFIKASI & PERANGKAT', { font = S.font('small') })
    dy = dy + 22
    vtext(36, dy, is_en and 'Hardware  : XTEINK X4 Pro ONLY' or 'Perangkat : Khusus XTEINK X4 Pro', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'Display   : 480x800 1-bit E-ink', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, is_en and 'Lockscreen: Standalone Service (60s)' or 'Lockscreen: Layar Kunci Mandiri (60s)', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, is_en and 'Auto-Updt : 64 KB Chunked Downloader' or 'Updater   : Chunked Range 64 KB (Aman)', { font = S.font('small') })
    dy = dy + 20
    vtext(36, dy, 'Status    : ' .. S.short(loc_sub, 26), { font = S.font('small') })

    -- Section 4: GitHub Repository QR Code
    dy = dy + 26
    vdivider(dy - 8)
    vtext(36, dy, is_en and 'GITHUB REPOSITORY (SCAN QR)' or 'REPOSITORI GITHUB (PINDAI QR)', { font = S.font('small') })
    dy = dy + 20
    local qr_tip = is_en and 'Scan with phone camera to open GitHub repo:' or 'Pindai dengan kamera HP untuk buka proyek:'
    vtext(36, dy, qr_tip, { font = S.font('small') })
    dy = dy + 30

    -- Center QR Code (140x140)
    local qr_sz = 140
    if (dy - 10) >= 60 and (dy + qr_sz + 10) <= 720 then
      S.draw_qr(gg, S.PROJECT_GITHUB_URL, W // 2, dy, qr_sz)
    end
    dy = dy + qr_sz + 18

    local gh_lbl = 'github.com/fiqsr/MuslimInk-XTEINK-X4-PRO'
    vcenter_text(W // 2, dy, gh_lbl, 'small')
    dy = dy + 22

    local gh_note = 'Source Code • Panduan • Rilis • Dukungan'
    vcenter_text(W // 2, dy, gh_note, 'small')
  end

  -- ==============================================================
  -- 2. Fixed Top Header (Apple Minimalist with ☰ and Clock)
  -- ==============================================================
  gg:rect(0, 0, W, 56, { fill = true, color = 0 })
  gg:line(0, 56, W, 56, { line_width = 1 })
  gg:text(24, 18, is_en and 'Settings & About' or 'Pengaturan & Info', { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  -- ==============================================================
  -- 3. Fixed Bottom Bar with Done Button (Permanent Docked)
  -- ==============================================================
  gg:rect(0, 726, W, 74, { fill = true, color = 0 })
  gg:line(0, 726, W, 726, { line_width = 1 })
  draw_btn(gg, 20, 736, W - 40, 52, is_en and 'Done' or 'Selesai', true, 'medium')

  -- ==============================================================
  -- 4. Apple Minimalist Scrollbar Indicator (y = 62..720)
  -- ==============================================================
  if max_scroll > 0 and not modal_open then
    local track_top = 62
    local track_h = 658
    local thumb_h = math.max(48, math.floor(track_h * (viewport_bottom - 56) / total_content_bottom))
    local thumb_y = track_top + math.floor((track_h - thumb_h) * (scroll_y / max_scroll))

    -- Scroll track & thumb on the very right edge
    gg:rect(W - 6, track_top, 4, track_h, { fill = true, color = 0 })
    gg:rect(W - 6, thumb_y, 4, thumb_h, { fill = true, radius = 2 })
  end
end

------------------------------------------------------------------ Modal: Clock & Counter Font Picker

function F.draw_cfont_modal(gg, cfg, now_info, draw_btn)
  local W, H = S.W, S.H
  local is_en = (cfg.lang == 'en')
  local mx, my, mw, mh = 20, 84, W - 40, 632

  -- Dim background with authentic e-ink scrim (every 4px scanlines)
  for sy = 0, H, 4 do
    gg:line(0, sy, W, sy, { line_width = 1 })
  end

  -- Solid white modal card
  gg:rect(mx, my, mw, mh, { fill = true, color = 0 })
  S.round_rect(gg, mx, my, mw, mh, 16, nil, true, 0)
  S.round_rect(gg, mx, my, mw, mh, 16, 2)

  -- Sheet grabber pill (━)
  S.sheet_grabber(gg, W // 2, my + 10)

  -- Header text
  local title = is_en and 'Clock & Counter Font' or 'Gaya Font Jam & Counter'
  local sub = is_en and 'Tap font to preview & select' or 'Ketuk font untuk memilih gaya angka'
  gg:text(mx + 20, my + 24, title, { font = S.font('medium') })
  gg:text(mx + 20, my + 48, sub, { font = S.font('small') })

  -- Close button (✕) at top right
  local cx, cy = mx + mw - 32, my + 30
  gg:line(cx - 7, cy - 7, cx + 7, cy + 7, { line_width = 2 })
  gg:line(cx - 7, cy + 7, cx + 7, cy - 7, { line_width = 2 })

  -- Hairline divider
  gg:line(mx + 16, my + 72, mx + mw - 16, my + 72, { line_width = 1 })

  local fnames = is_en and S.CFONT_NAMES.en or S.CFONT_NAMES.id
  local fsubs_id = {
    'Sans bulat halus',
    'Serif elegan',
    'Sans tebal tegas',
    'Slab retro kokoh',
    'Garis ganda outline',
    'Kaligrafi Islam Naskh'
  }
  local fsubs_en = {
    'Smooth rounded sans',
    'Classy serif',
    'Bold contrast sans',
    'Geometric slab',
    'Modern outline',
    'Islamic Naskh Script'
  }

  local cur_cf = cfg.cfont or 1
  local sample_time = (now_info and now_info.hhmm) or '12:34'

  -- 6 Font Option Rows
  for i = 1, 6 do
    local ry = my + 78 + (i - 1) * 78
    local rw = mw - 24
    local rh = 72
    local rx = mx + 12
    local is_sel = (cur_cf == i)

    -- Row card container
    if is_sel then
      S.round_rect(gg, rx, ry, rw, rh, 10, nil, true, 0)
      S.round_rect(gg, rx, ry, rw, rh, 10, 2)
    else
      S.round_rect(gg, rx, ry, rw, rh, 10, nil, true, 0)
      S.round_rect(gg, rx, ry, rw, rh, 10, 1)
    end

    -- Selection radio indicator (● / ○)
    local cir_x = rx + 20
    local cir_y = ry + rh // 2
    gg:circle(cir_x, cir_y, 9, { line_width = 2 })
    if is_sel then
      gg:circle(cir_x, cir_y, 5, { fill = true })
    end

    -- Font Name & Subtitle
    local fn = fnames[i]
    local fs = is_en and fsubs_en[i] or fsubs_id[i]
    gg:text(rx + 38, ry + 14, fn, { font = S.font('medium') })
    gg:text(rx + 38, ry + 40, fs, { font = S.font('small') })

    -- Live Clock Sample Preview (TrueType scanline renderer)
    local sample_cx = rx + rw - 64
    S.big_clock(gg, sample_time, sample_cx, ry + 14, 44, i)
  end

  -- Bottom Done / Close button
  draw_btn(gg, mx + 20, my + mh - 54, mw - 40, 44, is_en and 'Close' or 'Tutup', true, 'medium')
end

------------------------------------------------------------------ Modal: Ayah Quote Refresh Picker

function F.draw_quote_modal(gg, cfg, draw_btn)
  local W, H = S.W, S.H
  local is_en = (cfg.lang == 'en')
  local mx, my, mw, mh = 20, 68, W - 40, 636

  -- Dim background with authentic e-ink scrim (every 4px scanlines)
  for sy = 0, H, 4 do
    gg:line(0, sy, W, sy, { line_width = 1 })
  end

  -- Solid white modal card
  gg:rect(mx, my, mw, mh, { fill = true, color = 0 })
  S.round_rect(gg, mx, my, mw, mh, 16, nil, true, 0)
  S.round_rect(gg, mx, my, mw, mh, 16, 2)

  -- Sheet grabber pill (━)
  S.sheet_grabber(gg, W // 2, my + 10)

  -- Header text
  local title = is_en and 'Ayah Quote Refresh' or 'Rotasi Ayat Lockscreen'
  local sub = is_en and 'Select how often ayah changes' or 'Pilih frekuensi pergantian ayat lockscreen'
  gg:text(mx + 20, my + 22, title, { font = S.font('medium') })
  gg:text(mx + 20, my + 44, sub, { font = S.font('small') })

  -- Close button (✕) at top right
  local cx, cy = mx + mw - 32, my + 28
  gg:line(cx - 7, cy - 7, cx + 7, cy + 7, { line_width = 2 })
  gg:line(cx - 7, cy + 7, cx + 7, cy - 7, { line_width = 2 })

  -- Hairline divider
  gg:line(mx + 16, my + 66, mx + mw - 16, my + 66, { line_width = 1 })

  local qopts_id = {
    { '1. Tiap Hari (Harian)', 'Rotasi tiap hari 00:00 (Hemat baterai)' },
    { '2. Tiap Waktu Shalat', 'Berganti setiap masuk waktu shalat' },
    { '3. Tiap Jam Sekali', 'Berganti setiap jam saat layar aktif' },
    { '4. Offline Saja', 'Gunakan 10 ayat lokal tanpa internet' },
  }
  local qopts_en = {
    { '1. Daily (Once a Day)', 'Changes once daily (Battery efficient)' },
    { '2. Every Prayer Time', 'Changes at each next prayer time' },
    { '3. Hourly (Every Hour)', 'Changes hourly when screen wakes up' },
    { '4. Offline Only', 'Uses 10 offline ayahs (No network)' },
  }

  local cur_qr = cfg.qrefresh or 1

  -- 4 Option Rows
  for i = 1, 4 do
    local ry = my + 72 + (i - 1) * 70
    local rw = mw - 24
    local rh = 64
    local rx = mx + 12
    local is_sel = (cur_qr == i)

    -- Row card container
    S.round_rect(gg, rx, ry, rw, rh, 10, nil, true, 0)
    S.round_rect(gg, rx, ry, rw, rh, 10, is_sel and 2 or 1)

    -- Selection radio indicator (● / ○)
    local cir_x = rx + 20
    local cir_y = ry + rh // 2
    gg:circle(cir_x, cir_y, 9, { line_width = 2 })
    if is_sel then
      gg:circle(cir_x, cir_y, 5, { fill = true })
    end

    -- Title & Subtitle
    local opt = is_en and qopts_en[i] or qopts_id[i]
    gg:text(rx + 38, ry + 10, opt[1], { font = S.font('medium') })
    gg:text(rx + 38, ry + 36, S.fit_text(opt[2], 'small', rw - 46), { font = S.font('small') })
  end

  -- Hairline divider
  local dy = my + 358
  gg:line(mx + 16, dy, mx + mw - 16, dy, { line_width = 1 })

  -- Section label
  local sec_lbl = is_en and 'ACTIVE AYAH / HADITH (PREVIEW):' or 'AYAT / HADITS SAAT INI (PREVIEW):'
  gg:text(mx + 16, dy + 8, sec_lbl, { font = S.font('small') })

  -- Live Ayah Preview Card
  local px, py, pw, ph = mx + 12, dy + 28, mw - 24, 116
  S.round_rect(gg, px, py, pw, ph, 10, nil, true, 0)
  S.round_rect(gg, px, py, pw, ph, 10, 1)

  local now_info = S.now(cfg)
  local prev_text, prev_ref = S.get_effective_quote(cfg, now_info.day)

  local p_lines = S.wrap_lines(prev_text, pw - 24, 'small')
  local pn = #p_lines
  if pn > 0 then
    p_lines[1] = '"' .. p_lines[1]
    p_lines[pn] = p_lines[pn] .. '"'

    local lh = (pn >= 5) and 19 or ((pn >= 4) and 20 or 22)
    local ref_gap = (pn >= 5) and 18 or ((pn >= 4) and 19 or 21)
    local total_h = (pn - 1) * lh + ref_gap + 12
    local base_y = math.floor(py + (ph - total_h) / 2)

    for i = 1, pn do
      local ly = base_y + (i - 1) * lh
      local lw = S.text_w(p_lines[i], 'small')
      gg:text(math.floor((W - lw) / 2), ly, p_lines[i], { font = S.font('small') })
    end
    local ry = base_y + (pn - 1) * lh + ref_gap
    local rw = S.text_w(prev_ref or '', 'small')
    gg:text(math.floor((W - rw) / 2), ry, prev_ref or '', { font = S.font('small') })
  end

  -- Action Button: Manual Refresh Test Button
  local rf_lbl = is_en and 'Refresh Ayah Now (Test)' or 'Ganti Ayat Sekarang (Test)'
  draw_btn(gg, mx + 16, dy + 152, mw - 32, 42, rf_lbl, false, 'medium')

  -- Bottom Done / Close button
  draw_btn(gg, mx + 20, my + mh - 50, mw - 40, 42, is_en and 'Close' or 'Tutup', true, 'medium')
end

------------------------------------------------------------------ Modal: App Auto-Update (GitHub Releases)

function F.draw_update_modal(gg, cfg, update_info, update_state, update_err, update_saved_path, draw_btn, update_progress, update_tab)
  if type(update_saved_path) == 'function' and draw_btn == nil then
    draw_btn = update_saved_path
    update_saved_path = nil
  end
  if type(update_err) == 'function' and draw_btn == nil then
    draw_btn = update_err
    update_err = nil
  end

  local W, H = S.W, S.H
  local is_en = (cfg.lang == 'en')
  local mx, my, mw, mh = 16, 20, W - 32, 760

  -- Solid clean mask behind modal to completely prevent background UI bleed-through
  S.round_rect(gg, 0, 0, W, H, 0, nil, true, 0)

  -- Modal Sheet Card (Material 3 Surface)
  S.round_rect(gg, mx, my, mw, mh, 16, nil, true, 0)
  S.round_rect(gg, mx, my, mw, mh, 16, 2)

  -- Top grab handle
  gg:line(W // 2 - 20, my + 10, W // 2 + 20, my + 10, { line_width = 3 })

  -- Close button (✕)
  local cx, cy = mx + mw - 28, my + 26
  gg:line(cx - 6, cy - 6, cx + 6, cy + 6, { line_width = 2 })
  gg:line(cx - 6, cy + 6, cx + 6, cy - 6, { line_width = 2 })

  -- Title & Subtitle
  local u_ver = (update_info and update_info.version) or S.APP_VERSION
  local m_title = is_en and 'App Updates' or 'Pembaruan Aplikasi'
  if update_state == 'done' then
    m_title = is_en and 'Update Ready!' or 'Pembaruan Siap'
  elseif update_state == 'up_to_date' then
    m_title = is_en and 'MuslimInk Up to Date' or 'Versi Sudah Terbaru'
  elseif update_state == 'checking' then
    m_title = is_en and 'Checking Updates...' or 'Memeriksa Pembaruan...'
  elseif update_state == 'downloading' then
    m_title = is_en and 'Downloading Update...' or 'Sedang Mengunduh...'
  elseif update_state == 'error' then
    m_title = is_en and 'Update Failed' or 'Pembaruan Gagal'
  end
  gg:text(mx + 20, my + 20, S.fit_text(m_title, 'large', mw - 60), { font = S.font('large') })

  local m_sub = is_en
    and ('MuslimInk v' .. u_ver .. ' • Xteink X4 Pro')
    or ('MuslimInk v' .. u_ver .. ' • Khusus Xteink X4 Pro')
  gg:text(mx + 20, my + 50, m_sub, { font = S.font('small') })

  -- Hairline divider
  gg:line(mx + 16, my + 74, mx + mw - 16, my + 74, { line_width = 1 })

  if update_state == 'checking' then
    -- Checking for updates State View
    local bx, by, bw, bh = mx + 16, my + 90, mw - 32, 300
    S.round_rect(gg, bx, by, bw, bh, 12, nil, true, 0)
    S.round_rect(gg, bx, by, bw, bh, 12, 1)

    gg:text(bx + 20, by + 24, is_en and 'CONNECTING TO GITHUB' or 'MENGHUBUNGI GITHUB', { font = S.font('medium') })
    local msg = is_en
      and 'Checking latest release availability from GitHub repository...'
      or 'Menghubungi server GitHub untuk memeriksa ketersediaan rilis versi terbaru...'
    local w_msg = S.wrap_lines(msg, bw - 40, 'small')
    for i = 1, #w_msg do
      gg:text(bx + 20, by + 56 + (i - 1) * 20, w_msg[i], { font = S.font('small') })
    end

    -- Progress bar container
    local p_w, p_h = bw - 40, 18
    local px, py = bx + 20, by + 120
    S.round_rect(gg, px, py, p_w, p_h, 9, nil, true, 0)
    S.round_rect(gg, px, py, p_w, p_h, 9, 2)
    for sx = px + 4, px + p_w - 4, 12 do
      gg:line(sx, py + 2, sx + 4, py + p_h - 3, { line_width = 2 })
    end

    local tip = is_en and 'Please ensure device Wi-Fi is connected.' or 'Pastikan koneksi Wi-Fi perangkat aktif.'
    gg:text(bx + 20, by + 160, tip, { font = S.font('small') })

    draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Cancel' or 'Batal', false, 'medium')

  elseif update_state == 'up_to_date' then
    -- Already Up to Date State View
    local bx, by, bw, bh = mx + 16, my + 84, mw - 32, 320
    S.round_rect(gg, bx, by, bw, bh, 12, nil, true, 0)
    S.round_rect(gg, bx, by, bw, bh, 12, 1)

    -- Success Badge Header
    S.round_rect(gg, bx + 16, by + 16, bw - 32, 36, 8, nil, true, 0)
    S.round_rect(gg, bx + 16, by + 16, bw - 32, 36, 8, 1)
    local ok_lbl = is_en and '[ OK ] Up to Date' or '[ OK ] Versi Terbaru Aktif'
    S.center_text(gg, bx + bw // 2, by + 24, ok_lbl, 'medium')

    local desc1 = is_en
      and 'MuslimInk is already running the latest release from GitHub.'
      or 'Aplikasi MuslimInk pada perangkat Anda sudah menggunakan versi rilis terbaru dari GitHub.'
    local desc2 = is_en
      and 'No updates needed at this time.'
      or 'Tidak ada pembaruan yang diperlukan saat ini.'

    local w1 = S.wrap_lines(desc1, bw - 40, 'small')
    local ty = by + 68
    for i = 1, #w1 do
      gg:text(bx + 20, ty, w1[i], { font = S.font('small') })
      ty = ty + 20
    end
    ty = ty + 4
    local w2 = S.wrap_lines(desc2, bw - 40, 'small')
    for i = 1, #w2 do
      gg:text(bx + 20, ty, w2[i], { font = S.font('small') })
      ty = ty + 20
    end
    ty = ty + 24

    local cur_info = is_en
      and ('Active Version: v' .. S.APP_VERSION .. ' (Build ' .. S.APP_BUILD .. ')')
      or ('Versi Aktif: v' .. S.APP_VERSION .. ' (Build ' .. S.APP_BUILD .. ')')
    local dev_info = is_en and 'Device: XTEINK X4 Pro' or 'Perangkat: XTEINK X4 Pro'
    gg:text(bx + 20, ty, cur_info, { font = S.font('medium') })
    gg:text(bx + 20, ty + 24, dev_info, { font = S.font('small') })

    draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Close' or 'Tutup', true, 'medium')

  elseif update_state == 'downloading' then
    -- Downloading State View
    local bx, by, bw, bh = mx + 16, my + 84, mw - 32, 320
    S.round_rect(gg, bx, by, bw, bh, 12, nil, true, 0)
    S.round_rect(gg, bx, by, bw, bh, 12, 1)

    gg:text(bx + 20, by + 24, is_en and 'DOWNLOADING PACKAGE' or 'SEDANG MENGUNDUH PAKET', { font = S.font('medium') })
    local cur_b = (update_progress and update_progress.current) or 0
    local exp_b = (update_progress and update_progress.total) or ((update_info and update_info.size_bytes) or 422144)
    local cur_kb = math.floor(cur_b / 1024)
    local exp_kb = math.floor(exp_b / 1024)
    local pct = 0
    if exp_b > 0 then
      pct = math.min(100, math.floor(cur_b * 100 / exp_b))
    end

    local sub_dl = is_en
      and ('Progress: ' .. cur_kb .. ' / ' .. exp_kb .. ' KB (' .. pct .. '%)')
      or ('Progres: ' .. cur_kb .. ' / ' .. exp_kb .. ' KB (' .. pct .. '%)')
    gg:text(bx + 20, by + 52, sub_dl, { font = S.font('medium') })

    -- Progress bar container
    local p_w, p_h = bw - 40, 20
    local px, py = bx + 20, by + 86
    S.round_rect(gg, px, py, p_w, p_h, 10, nil, true, 0)
    S.round_rect(gg, px, py, p_w, p_h, 10, 2)
    -- Fill bar proportionally
    local fill_w = math.floor((p_w - 4) * pct / 100)
    if fill_w > 0 then
      S.round_rect(gg, px + 2, py + 2, fill_w, p_h - 4, 8, nil, true, 0)
      for sx = px + 4, px + fill_w - 2, 8 do
        gg:line(sx, py + 3, sx + 3, py + p_h - 4, { line_width = 2 })
      end
    end

    local note1 = is_en and 'Target storage path:' or 'Lokasi penyimpanan:'
    local note2 = 'XTApps/muslimink/files/'
    local note3 = is_en and 'Mode: 64 KB chunked transfer' or 'Metode: Unduhan bertahap 64 KB'
    local note4 = is_en and 'Keep Wi-Fi connected...' or 'Jangan matikan Wi-Fi...'
    gg:text(bx + 20, by + 122, note1, { font = S.font('small') })
    gg:text(bx + 20, by + 144, note2, { font = S.font('small') })
    gg:text(bx + 20, by + 172, note3, { font = S.font('small') })
    gg:text(bx + 20, by + 194, note4, { font = S.font('small') })

    draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Cancel' or 'Batal', false, 'medium')

  elseif update_state == 'done' then
    -- Download Completed View
    local bx, by, bw, bh = mx + 16, my + 78, mw - 32, 460
    S.round_rect(gg, bx, by, bw, bh, 12, nil, true, 0)
    S.round_rect(gg, bx, by, bw, bh, 12, 2)

    -- Success Badge Header
    S.round_rect(gg, bx + 16, by + 14, bw - 32, 34, 8, nil, true, 0)
    S.round_rect(gg, bx + 16, by + 14, bw - 32, 34, 8, 1)
    local succ_title = is_en and '[ OK ] Download Complete!' or '[ OK ] Unduhan Selesai!'
    S.center_text(gg, bx + bw // 2, by + 22, succ_title, 'medium')

    local final_path = update_saved_path or 'XTApps/muslimink/files/muslimink_update.xtapp'
    local is_root = final_path:find('^/sdcard/muslimink') or final_path:find('^muslimink')

    -- Inset Box for File Location
    local lbox_y = by + 58
    local lbox_h = 60
    S.round_rect(gg, bx + 16, lbox_y, bw - 32, lbox_h, 8, nil, true, 0)
    S.round_rect(gg, bx + 16, lbox_y, bw - 32, lbox_h, 8, 1)

    local folder_val = is_root and 'Kartu Memori (SD Root)' or 'XTApps/muslimink/files/'
    local file_val = 'muslimink_update.xtapp'

    gg:text(bx + 26, lbox_y + 8, (is_en and 'Folder : ' or 'Folder : ') .. folder_val, { font = S.font('small') })
    gg:text(bx + 26, lbox_y + 32, (is_en and 'File   : ' or 'Berkas : ') .. file_val, { font = S.font('medium') })

    local ty = lbox_y + lbox_h + 16
    gg:line(bx + 16, ty, bx + bw - 16, ty, { line_width = 1 })
    ty = ty + 12

    gg:text(bx + 16, ty, is_en and 'Steps to Install on X4 Pro:' or 'Langkah Pemasangan di X4 Pro:', { font = S.font('medium') })
    ty = ty + 24

    local steps = is_root and {
      '1. Menu Samping -> All Files',
      '2. Klik "muslimink_update.xtapp"',
      '3. Tekan OK untuk pasang',
      '4. Buka kembali di Ink App',
    } or {
      '1. Menu Samping -> All Files',
      '2. Buka XTApps > muslimink > files',
      '3. Klik "muslimink_update.xtapp"',
      '4. Tekan OK untuk pasang',
      '5. Buka kembali di Ink App',
    }

    for _, s in ipairs(steps) do
      local w_s = S.wrap_lines(s, bw - 32, 'small')
      for _, sub in ipairs(w_s) do
        gg:text(bx + 16, ty, sub, { font = S.font('small') })
        ty = ty + 24
      end
    end

    -- Bottom tips divider & text
    ty = ty + 8
    gg:line(bx + 16, ty, bx + bw - 16, ty, { line_width = 1 })
    ty = ty + 12

    gg:text(bx + 16, ty, is_en and 'Quick Install:' or 'Instalasi Cepat:', { font = S.font('medium') })
    ty = ty + 22
    local tip_desc = is_en
      and 'Tap "Exit App & Install" below, or follow the steps above.'
      or 'Tekan "Keluar Aplikasi & Pasang" atau ikuti langkah di atas.'
    local w_tip = S.wrap_lines(tip_desc, bw - 32, 'small')
    for i = 1, #w_tip do
      gg:text(bx + 16, ty, w_tip[i], { font = S.font('small') })
      ty = ty + 20
    end

    -- Bottom action buttons
    draw_btn(gg, mx + 20, my + mh - 110, mw - 40, 44, is_en and 'Exit App & Install' or 'Keluar Aplikasi & Pasang', true, 'medium')
    draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Close' or 'Tutup', false, 'medium')

  elseif update_state == 'error' then
    -- Error View
    local bx, by, bw, bh = mx + 16, my + 84, mw - 32, 280
    S.round_rect(gg, bx, by, bw, bh, 12, nil, true, 0)
    S.round_rect(gg, bx, by, bw, bh, 12, 1)

    local err_title = is_en and '[ ! ] Update Incomplete' or '[ ! ] Unduhan Belum Selesai'
    gg:text(bx + 20, by + 20, err_title, { font = S.font('medium') })
    local msg = update_err or (is_en and 'Network connection error.' or 'Terjadi kesalahan jaringan.')
    local w_lines = S.wrap_lines(msg, bw - 40, 'small')
    local my_y = by + 52
    for i = 1, #w_lines do
      gg:text(bx + 20, my_y, w_lines[i], { font = S.font('small') })
      my_y = my_y + 20
    end

    my_y = math.max(my_y + 8, by + 130)
    local tip = is_en
      and 'Ensure Wi-Fi is active, or scan QR code below.'
      or 'Pastikan Wi-Fi aktif, atau scan QR code di bawah.'
    local w_tips = S.wrap_lines(tip, bw - 40, 'small')
    for i = 1, #w_tips do
      gg:text(bx + 20, my_y, w_tips[i], { font = S.font('small') })
      my_y = my_y + 20
    end

    draw_btn(gg, mx + 20, my + mh - 164, mw - 40, 44, is_en and 'Download via Phone (Scan QR)' or 'Unduh Lewat HP (Scan QR)', false, 'medium')
    draw_btn(gg, mx + 20, my + mh - 110, mw - 40, 44, is_en and 'Retry on Device' or 'Coba Lagi di Perangkat', true, 'medium')
    draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Close' or 'Tutup', false, 'medium')

  else
    -- Idle State View: Changelog and Download Action
    local cur_v = S.APP_VERSION
    local rem_v = (update_info and update_info.version) or cur_v
    local sz_kb = math.floor(((update_info and update_info.size_bytes) or 427680) / 1024)
    local rel_date = (update_info and update_info.release_date) or '2026-11-06'

    -- Info Card
    local ix, iy, iw, ih = mx + 16, my + 78, mw - 32, 58
    S.round_rect(gg, ix, iy, iw, ih, 10, nil, true, 0)
    S.round_rect(gg, ix, iy, iw, ih, 10, 1)

    local t_line1 = is_en
      and ('Latest: v' .. rem_v .. '  (Current: v' .. cur_v .. ')')
      or ('Versi Baru: v' .. rem_v .. '  (Saat ini: v' .. cur_v .. ')')
    local t_line2 = is_en
      and ('Date: ' .. rel_date .. ' • Size: ~' .. sz_kb .. ' KB')
      or ('Rilis: ' .. rel_date .. ' • Ukuran: ~' .. sz_kb .. ' KB')
    gg:text(ix + 16, iy + 10, t_line1, { font = S.font('medium') })
    gg:text(ix + 16, iy + 32, t_line2, { font = S.font('small') })

    -- Segmented Tab at y = my + 144: [ Catatan Rilis ]  [ Scan QR HP ]
    local tab_y = my + 144
    local tab_w = mw - 32
    local tab_h = 36
    local active_tab_idx = (update_tab == 'qr') and 2 or 1
    local tab_labels = is_en and { 'Changelog', 'Scan QR (Phone)' } or { 'Catatan Rilis', 'Scan QR HP' }
    S.segmented_control(gg, mx + 16, tab_y, tab_w, tab_h, tab_labels, active_tab_idx)

    local cx, cy, cw, ch = mx + 16, tab_y + 44, mw - 32, 396
    S.round_rect(gg, cx, cy, cw, ch, 10, nil, true, 0)
    S.round_rect(gg, cx, cy, cw, ch, 10, 1)

    if update_tab == 'qr' then
      -- QR Code Card for Phone Scanning
      local qr_title = is_en and 'SCAN VIA PHONE CAMERA:' or 'PINDAI DENGAN KAMERA HP:'
      gg:text(cx + 14, cy + 12, qr_title, { font = S.font('small') })
      gg:line(cx + 14, cy + 30, cx + cw - 14, cy + 30, { line_width = 1 })

      local rel_url = (update_info and (update_info.release_page_url or update_info.download_url)) or S.RELEASE_LATEST_URL
      local qr_size = 150
      S.draw_qr(gg, rel_url, cx + cw // 2, cy + 38, qr_size)

      local qy = cy + 38 + qr_size + 14
      local rel_short = 'github.com/fiqsr/MuslimInk-XTEINK-X4-PRO/releases'
      S.center_text(gg, cx + cw // 2, qy, rel_short, 'small')
      qy = qy + 22

      local steps = is_en and {
        '1. Scan QR with your phone camera',
        '2. Download muslimink.xtapp to phone',
        '3. Copy to X4 Pro via USB / SD Card'
      } or {
        '1. Pindai QR di atas dengan kamera HP',
        '2. Unduh berkas muslimink.xtapp ke HP',
        '3. Salin ke X4 Pro via USB / SD Card'
      }
      for _, st in ipairs(steps) do
        S.center_text(gg, cx + cw // 2, qy, st, 'small')
        qy = qy + 19
      end

      -- Bottom action buttons
      local btn_dl = is_en and 'Download on Device (Wi-Fi)' or 'Unduh di X4 Pro (Wi-Fi)'
      draw_btn(gg, mx + 20, my + mh - 110, mw - 40, 44, btn_dl, true, 'medium')
      draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Close' or 'Tutup', false, 'medium')
    else
      -- Changelog Box
      gg:text(cx + 14, cy + 12, is_en and 'WHAT\'S NEW / CHANGELOG:' or 'CATATAN RILIS TERBARU:', { font = S.font('small') })
      gg:line(cx + 14, cy + 30, cx + cw - 14, cy + 30, { line_width = 1 })

      local logs = is_en
        and (update_info and update_info.changelog_en or { 'Bug fixes and performance improvements' })
        or (update_info and update_info.changelog_id or { 'Perbaikan bug dan peningkatan performa' })

      local ly = cy + 38
      for idx, item in ipairs(logs) do
        if ly + 20 <= cy + ch - 14 then
          local w_sub = S.wrap_lines('• ' .. item, cw - 28, 'small')
          for _, sub in ipairs(w_sub) do
            if ly + 18 <= cy + ch - 14 then
              gg:text(cx + 14, ly, sub, { font = S.font('small') })
              ly = ly + 18
            end
          end
          ly = ly + 4
        elseif idx <= #logs then
          gg:text(cx + 14, cy + ch - 18, is_en and '• ... and further optimizations.' or '• ... serta optimasi performa lainnya.', { font = S.font('small') })
          break
        end
      end

      -- Bottom action buttons
      local btn_dl = is_en and 'Download & Save to SD Card' or 'Unduh & Simpan ke SD Card'
      draw_btn(gg, mx + 20, my + mh - 110, mw - 40, 44, btn_dl, true, 'medium')
      draw_btn(gg, mx + 20, my + mh - 56, mw - 40, 42, is_en and 'Later' or 'Nanti', false, 'medium')
    end
  end
end

------------------------------------------------------------------ Manual GPS Coordinates Input Screen (Touch Numpad)

function F.draw_custom_coords_screen(gg, cfg, now_info, state, draw_btn)
  local W, H = S.W, S.H
  local is_en = (cfg.lang == 'en')
  local title = is_en and 'Manual Coordinates' or 'Koordinat Manual'

  -- Top App Bar: Title on Left, Clock + Hamburger on Right
  gg:text(20, 18, title, { font = S.font('large') })
  if now_info and now_info.hhmm then
    gg:text(W - 128, 20, now_info.hhmm, { font = S.font('medium') })
  end
  S.draw_hamburger_btn(gg, W - 50, 20)

  local cur_act = state.active_field or 1

  -- Field 1: Latitude (-90 to +90)
  local f1_active = (cur_act == 1)
  S.round_rect(gg, 20, 60, W - 40, 62, 10, nil, true, 0)
  S.round_rect(gg, 20, 60, W - 40, 62, 10, f1_active and 3 or 1)
  if f1_active then
    gg:rect(28, 64, 6, 54, { fill = true, radius = 3 })
  end
  local l_lat = is_en and 'Latitude / Lintang (-90.0 s.d +90.0)' or 'Lintang / Latitude (-90.0 s.d +90.0)'
  gg:text(42, 66, l_lat, { font = S.font('small') })
  local lat_display = (state.lat == '' and '0.0000' or state.lat) .. (f1_active and ' |' or '')
  gg:text(42, 88, lat_display, { font = S.font('medium') })

  -- Field 2: Longitude (-180 to +180)
  local f2_active = (cur_act == 2)
  S.round_rect(gg, 20, 128, W - 40, 62, 10, nil, true, 0)
  S.round_rect(gg, 20, 128, W - 40, 62, 10, f2_active and 3 or 1)
  if f2_active then
    gg:rect(28, 132, 6, 54, { fill = true, radius = 3 })
  end
  local l_lon = is_en and 'Longitude / Bujur (-180.0 s.d +180.0)' or 'Bujur / Longitude (-180.0 s.d +180.0)'
  gg:text(42, 134, l_lon, { font = S.font('small') })
  local lon_display = (state.lon == '' and '0.0000' or state.lon) .. (f2_active and ' |' or '')
  gg:text(42, 156, lon_display, { font = S.font('medium') })

  -- Field 3: Timezone UTC (-12 to +14)
  local f3_active = (cur_act == 3)
  S.round_rect(gg, 20, 196, W - 40, 56, 10, nil, true, 0)
  S.round_rect(gg, 20, 196, W - 40, 56, 10, f3_active and 3 or 1)
  if f3_active then
    gg:rect(28, 200, 6, 48, { fill = true, radius = 3 })
  end
  local l_tz = is_en and 'Timezone / Zona Waktu (UTC: +7, +8, +3, -5)' or 'Zona Waktu / Timezone (UTC: +7, +8, +3, -5)'
  gg:text(42, 200, l_tz, { font = S.font('small') })
  local tz_display = 'UTC ' .. (state.tz == '' and '+7' or state.tz) .. (f3_active and ' |' or '')
  gg:text(42, 222, tz_display, { font = S.font('medium') })

  -- Field 4: Calculation Method (Tappable Cycle Card)
  local m_idx = state.method_idx or 1
  local m_info = F.CUSTOM_METHODS[m_idx] or F.CUSTOM_METHODS[1]
  S.round_rect(gg, 20, 258, W - 40, 48, 10, nil, true, 0)
  S.round_rect(gg, 20, 258, W - 40, 48, 10, 1)
  local m_title = (is_en and 'Method: ' or 'Metode: ') .. m_info.name .. ' >'
  gg:text(36, 264, S.fit_text(m_title, 'small', W - 72), { font = S.font('small') })
  gg:text(36, 284, m_info.desc .. (is_en and ' (Tap to cycle)' or ' (Ketuk untuk ganti)'), { font = S.font('small') })

  -- Status / Error line
  if state.status_err then
    S.round_rect(gg, 20, 310, W - 40, 28, 6, nil, true, 0)
    S.round_rect(gg, 20, 310, W - 40, 28, 6, 1)
    S.center_text(gg, W // 2, 314, '(! ) ' .. state.status_err, 'small', W - 50)
  else
    local helper_txt = is_en
      and 'Tap field to edit • Auto UTC calculation'
      or 'Pilih kotak edit • Auto UTC dari bujur'
    S.center_text(gg, W // 2, 314, helper_txt, 'small', W - 32)
  end

  -- Touch Numpad Grid (y = 344..696, h = 344)
  local col_x = { 16, 128, 240, 352 }
  local col_w = { 104, 104, 104, 112 }
  local row_y = { 344, 432, 520, 608 }
  local row_h = 80

  local keys = {
    { { lbl = '1', fn = 'large' }, { lbl = '2', fn = 'large' }, { lbl = '3', fn = 'large' }, { lbl = 'Hapus', fn = 'small' } },
    { { lbl = '4', fn = 'large' }, { lbl = '5', fn = 'large' }, { lbl = '6', fn = 'large' }, { lbl = '+/-', fn = 'medium' } },
    { { lbl = '7', fn = 'large' }, { lbl = '8', fn = 'large' }, { lbl = '9', fn = 'large' }, { lbl = '.', fn = 'large' } },
    { { lbl = 'Tab', fn = 'small' }, { lbl = '0', fn = 'large' }, { lbl = 'Clear', fn = 'small' }, { lbl = 'Auto UTC', fn = 'small' } }
  }

  for r = 1, 4 do
    for c = 1, 4 do
      local k = keys[r][c]
      local bx = col_x[c]
      local by = row_y[r]
      local bw = col_w[c]
      local bh = row_h
      S.round_rect(gg, bx, by, bw, bh, 10, nil, true, 0)
      S.round_rect(gg, bx, by, bw, bh, 10, 2)
      local ty_off = (k.fn == 'large') and 24 or ((k.fn == 'medium') and 28 or 30)
      S.center_text(gg, bx + bw // 2, by + ty_off, k.lbl, k.fn, bw - 8)
    end
  end

  -- Bottom Action Bar (y = 716..776, h = 60)
  draw_btn(gg, 16, 716, 136, 60, is_en and 'Cancel' or 'Batal', false, 'medium')
  draw_btn(gg, 160, 716, W - 176, 60, is_en and 'Simpan & Hitung' or 'Simpan & Hitung', true, 'medium')
end

------------------------------------------------------------------ Modal: Storage & Cache Management

function F.draw_storage_modal(gg, cfg, draw_btn, cache_count, saved_count)
  local W, H = S.W, S.H
  local is_en = (cfg.lang == 'en')
  local mx, my, mw, mh = 20, 100, W - 40, 580

  -- Dim background with authentic e-ink scrim (every 4px scanlines)
  for sy = 0, H, 4 do
    gg:line(0, sy, W, sy, { line_width = 1 })
  end

  -- Solid white modal card
  gg:rect(mx, my, mw, mh, { fill = true, color = 0 })
  S.round_rect(gg, mx, my, mw, mh, 16, nil, true, 0)
  S.round_rect(gg, mx, my, mw, mh, 16, 2)

  -- Sheet grabber pill (━)
  S.sheet_grabber(gg, W // 2, my + 10)

  -- Header text
  local title = is_en and 'Storage & Cache' or 'Penyimpanan & Cache'
  local sub = is_en and 'Manage offline data & Doa cache' or 'Kelola data offline & cache doa'
  gg:text(mx + 20, my + 24, title, { font = S.font('medium') })
  gg:text(mx + 20, my + 48, sub, { font = S.font('small') })

  -- Close button (✕) at top right
  local cx, cy = mx + mw - 32, my + 30
  gg:line(cx - 7, cy - 7, cx + 7, cy + 7, { line_width = 2 })
  gg:line(cx - 7, cy + 7, cx + 7, cy - 7, { line_width = 2 })

  -- Hairline divider
  gg:line(mx + 16, my + 72, mx + mw - 16, my + 72, { line_width = 1 })

  -- Storage Overview Card (y = my + 82, h = 110)
  local cy_box = my + 82
  S.round_rect(gg, mx + 16, cy_box, mw - 32, 110, 10, nil, true, 0)
  S.round_rect(gg, mx + 16, cy_box, mw - 32, 110, 1)

  local s_title = is_en and 'LOCAL STORAGE OVERVIEW' or 'RINGKASAN PENYIMPANAN'
  gg:text(mx + 28, cy_box + 12, s_title, { font = S.font('small') })
  gg:line(mx + 28, cy_box + 30, mx + mw - 28, cy_box + 30, { line_width = 1 })

  local s1 = (is_en and 'Saved Bookmarks : ' or 'Doa Tersimpan   : ') .. tostring(saved_count or 0) .. ' item'
  local s2 = (is_en and 'Cached Doa Files: ' or 'Cache File Doa  : ') .. tostring(cache_count or 0) .. ' file'
  local s3 = (is_en and 'Catalog Index   : 227 Duas (Complete)' or 'Katalog Indeks  : 227 Doa (Lengkap)')
  gg:text(mx + 28, cy_box + 40, s1, { font = S.font('small') })
  gg:text(mx + 28, cy_box + 62, s2, { font = S.font('small') })
  gg:text(mx + 28, cy_box + 84, s3, { font = S.font('small') })

  -- Action 1: Clear Doa Files Cache (y = my + 208, h = 76)
  local ay1 = my + 208
  S.round_rect(gg, mx + 16, ay1, mw - 32, 76, 10, nil, true, 0)
  S.round_rect(gg, mx + 16, ay1, mw - 32, 76, 1)
  gg:text(mx + 28, ay1 + 14, is_en and '1. Clear Doa Files Cache' or '1. Hapus Cache File Doa', { font = S.font('medium') })
  local tip1 = is_en and 'Clears cached files to re-download fresh text' or 'Hapus file cache agar teks doa terunduh ulang segar'
  gg:text(mx + 28, ay1 + 42, S.fit_text(tip1, 'small', mw - 150), { font = S.font('small') })
  draw_btn(gg, mx + mw - 128, ay1 + 18, 96, 40, is_en and 'Clear' or 'Hapus', false, 'small')

  -- Action 2: Sync Doa Index from GitHub (y = my + 296, h = 76)
  local ay2 = my + 296
  S.round_rect(gg, mx + 16, ay2, mw - 32, 76, 10, nil, true, 0)
  S.round_rect(gg, mx + 16, ay2, mw - 32, 76, 1)
  gg:text(mx + 28, ay2 + 14, is_en and '2. Sync Doa Catalog (GitHub)' or '2. Segarkan Indeks Doa (GitHub)', { font = S.font('medium') })
  local tip2 = is_en and 'Updates full list of 227 prayers via Wi-Fi' or 'Perbarui daftar lengkap 227 doa via Wi-Fi'
  gg:text(mx + 28, ay2 + 42, S.fit_text(tip2, 'small', mw - 150), { font = S.font('small') })
  draw_btn(gg, mx + mw - 128, ay2 + 18, 96, 40, is_en and 'Sync' or 'Segarkan', false, 'small')

  -- Action 3: Reset Saved Bookmarks (y = my + 384, h = 76)
  local ay3 = my + 384
  S.round_rect(gg, mx + 16, ay3, mw - 32, 76, 10, nil, true, 0)
  S.round_rect(gg, mx + 16, ay3, mw - 32, 76, 1)
  gg:text(mx + 28, ay3 + 14, is_en and '3. Reset Saved Bookmarks' or '3. Reset Bookmark Doa', { font = S.font('medium') })
  local tip3 = is_en and 'Restore default 10 essential prayer bookmarks' or 'Kembalikan bookmark ke 10 doa bawaan'
  gg:text(mx + 28, ay3 + 42, S.fit_text(tip3, 'small', mw - 150), { font = S.font('small') })
  draw_btn(gg, mx + mw - 128, ay3 + 18, 96, 40, is_en and 'Reset' or 'Reset', false, 'small')

  -- Bottom Done / Close button
  draw_btn(gg, mx + 20, my + mh - 54, mw - 40, 44, is_en and 'Close' or 'Tutup', true, 'medium')
end

return F


