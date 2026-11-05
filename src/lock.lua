-- Lockscreen entry for Jadwal Sholat (bundled with src/core.lua as `S` by build.py)

local asked_at = nil

local function try_fetch_month(now_info, cfg)
  if not cfg.prov or not cfg.kab then return end
  if asked_at and (now_info.epoch - asked_at) < 900 then return end
  asked_at = now_info.epoch
  pcall(function()
    local body_req = string.format(
      '{"provinsi":"%s","kabkota":"%s","bulan":%d,"tahun":%d}',
      cfg.prov, cfg.kab, now_info.m, now_info.y
    )
    ctx.net:request({
      url = 'https://equran.id/api/v2/shalat',
      method = 'POST',
      headers = { ['Content-Type'] = 'application/json' },
      body = body_req,
      timeout_ms = 25000,
    }, function(c, resp)
      pcall(function()
        if type(resp) ~= 'table' or type(resp.body) ~= 'string' then return end
        local cache_s = S.parse_schedule_json(resp.body, cfg.prov, cfg.kab)
        if cache_s then
          S.write(S.cache_name(now_info.y, now_info.m), cache_s)
          pcall(function() ctx:invalidate() end)
        end
      end)
    end)
  end)
end

function on_draw(c, gg)
  if not gg then return end
  local ok, err = pcall(function()
    gg:clear(0)
    local cfg = S.load_cfg()
    local L = S.L(cfg)
    local now_info = S.now(cfg)
    local info = S.compute(now_info, cfg)

    -- Top Header: Classical Mosque App Icon + Gregorian & Hijri Dates
    S.draw_app_icon(gg, 20, 14, 52)
    gg:text(84, 16, S.fit_text(now_info.date_str, 'medium', S.W - 104), { font = S.font('medium') })
    gg:text(84, 44, S.fit_text(info.hijri_str, 'small', S.W - 104), { font = S.font('small') })

    -- Big TrueType Wall Clock (Seamlessly below dates without harsh divider)
    S.big_clock(gg, now_info.hhmm, S.W // 2, 86, 96, cfg.cfont)

    -- Apple Lockscreen Capsule Widget for Location
    local sub_loc = (cfg.country == 'Indonesia' or not cfg.country) and (cfg.prov or 'DKI Jakarta') or (cfg.country or 'Indonesia')
    local loc_str = (cfg.kab or 'Kota Jakarta') .. '  •  ' .. sub_loc
    local lw = math.min(S.text_w(loc_str, 'small') + 28, S.W - 40)
    local lx = (S.W - lw) // 2
    S.round_rect(gg, lx, 196, lw, 28, 14, nil, true, 0)
    S.round_rect(gg, lx, 196, lw, 28, 14, 1)
    S.center_text(gg, S.W // 2, 201, loc_str, 'small', lw - 16)

    if not info.has_data then
      try_fetch_month(now_info, cfg)
      S.card(gg, 24, 250, S.W - 48, 180, 2, true)
      S.center_text(gg, S.W // 2, 284, L.lock_no_data, 'large', S.W - 80)
      S.center_text(gg, S.W // 2, 330, L.lock_no_l1, 'small', S.W - 80)
      S.center_text(gg, S.W // 2, 356, L.lock_no_l2, 'small', S.W - 80)
    else
      -- Next Prayer Live Activity Highlight Card
      S.draw_next_card(gg, 20, 238, S.W - 40, 130, info, cfg.cfont)

      -- 8-Row Prayer Timeline
      S.draw_timeline(gg, 20, 382, S.W - 40, 37, info)
    end

    -- Trigger background online quote sync if scheduled
    S.try_fetch_quote(now_info, cfg, info)

    -- Bottom Divider & 3-Line Daily Quote
    S.divider(gg, 692, 24, S.W - 24)
    S.draw_quote(gg, 706, now_info.day, cfg)
  end)
  if not ok then
    pcall(function()
      gg:text(12, 760, 'Lock err: ' .. tostring(err):sub(1, 42), { font = S.font('small') })
    end)
  end
end

function on_load() end
function on_tick() end
function on_input() return false end
