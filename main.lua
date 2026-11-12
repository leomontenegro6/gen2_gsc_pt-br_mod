-- Generated Gold translation mod.
return function(mod)
  mod.content.font:register("ttf", { file = mod.assets:path("fonts/fusion-pixel-10px-proportional-latin.ttf"), size = 10 })
  local function catalog(name)
    local body = mod:read("lang/" .. name .. ".lua")
    if not body then return {} end
    local chunk = loadstring(body)
    if not chunk then return {} end
    local ok, value = pcall(chunk)
    return ok and type(value) == "table" and value or {}
  end
  local function each(name, apply)
    for id, value in pairs(catalog(name)) do
      if type(value) == "string" and value ~= "" then apply(id, value) end
    end
  end
  each("dialogue", function(id, value) mod.content.text:override(id, value) end)
  each("phone_contacts", function(id, value) mod.content.phone_contacts:patch(id, { name = value }) end)
  each("decorations", function(id, value) mod.content.decorations:patch(id, { name = value }) end)
  each("radio_channels", function(id, value) mod.content.radio_channels:patch(id, { name = value }) end)
  each("species_names", function(id, value) mod.content.pokemon:patch(id, { name = value }) end)
  each("move_names", function(id, value) mod.content.moves:patch(id, { name = value }) end)
  each("item_names", function(id, value) mod.content.items:patch(id, { name = value }) end)
  each("trainer_class_names", function(id, value) mod.content.trainers:patch(id, { name = value }) end)
  each("species_kinds", function(id, value) mod.content.pokemon:patch(id, { dexEntry = { kind = value } }) end)
  each("species_dex_text", function(id, value) mod.content.pokemon:patch(id, { dexEntry = { text = value } }) end)
  each("species_dex_text2", function(id, value) mod.content.pokemon:patch(id, { dexEntry = { text2 = value } }) end)
  each("landmarks", function(id, value) mod.content.landmarks:patch(id, { name = value }) end)
  each("strings", function(id, value) mod.content.strings:override(id, value) end)
  local uiLabels = catalog("ui_labels")
  local function localizeItems(_, items)
    for _, item in ipairs(items or {}) do
      if type(item) == "table" and type(item.label) == "string" then
        local value = uiLabels[item.label]
        if value then item.label = value end
      end
      -- Two-line row descriptions (e.g. the START menu's highlighted-entry
      -- box) are keyed by their two lines joined with "\n", matching the
      -- catalog entry's source key; only replace both lines together so a
      -- one-line-only or missing translation never desyncs the pair.
      if type(item) == "table" and type(item.desc) == "table"
          and type(item.desc[1]) == "string" and type(item.desc[2]) == "string" then
        local value = uiLabels[item.desc[1] .. "\n" .. item.desc[2]]
        if value then
          local line1, line2 = value:match("^(.-)\n(.*)$")
          if line1 and line2 then
            item.desc[1], item.desc[2] = line1, line2
          end
        end
      end
    end
    return items
  end
  for _, hook in ipairs({
    "ui.pc.items", "ui.title_menu.items", "ui.start_menu.items",
    "ui.options.rows", "ui.party.submenu",
  }) do
    mod.hooks:wrap(hook, function(nextFn, ...)
      local args = {...}
      -- Public list hooks use (identity, game, items, ...).
      local items = args[3] or args[2] or args[1]
      if type(items) == "table" then localizeItems(nil, items) end
      return nextFn(table.unpack(args))
    end)
  end
  local oakSpeech = catalog("oak_speech")
  mod.hooks:wrap("intro.oak_speech.build", function(nextFn, steps, speech)
    speech.texts = speech.texts or {}
    for id, value in pairs(oakSpeech) do
      if type(value) == "string" and value ~= "" then speech.texts[id] = value end
    end
    return nextFn(steps, speech)
  end)
  -- Pokedex heights and weights in metres and kilograms, as the European
  -- and Japanese carts print them: the Pokedex prints a species'
  -- dexEntry.heightM and weightKg instead of feet, inches and pounds.
  for id, value in pairs(catalog("species_metrics")) do
    if type(value) == "table" and value[1] and value[2] then
      mod.content.pokemon:patch(id, { dexEntry = { heightM = value[1], weightKg = value[2] } })
    end
  end

  -- Crystal layer: its own dialogue catalog, applied only when
  -- running Pokemon Crystal (different bank:address pointers from
  -- Gold/Silver's own dialogue catalog above).
  local okGame, GameVersion = pcall(require, "src.core.GameVersion")
  local crystal_game_version = okGame and type(GameVersion) == "table"
      and type(GameVersion.get) == "function"
      and GameVersion.get() == "crystal"
  if crystal_game_version then
    local function crystalCatalog()
      local body = mod:read("lang/dialogue_crystal.lua")
      if not body then return {} end
      local chunk = loadstring(body)
      if not chunk then return {} end
      local ok, value = pcall(chunk)
      return ok and type(value) == "table" and value or {}
    end
    for id, value in pairs(crystalCatalog()) do
      if type(value) == "string" and value ~= "" then mod.content.text:override(id, value) end
    end
  end

  -- Crystal-only named records and Strings keys, and Crystal's own wording of the cart text read by label.
  -- The edition guard prevents every one from leaking into Gold/Silver.
  local okGame, GameVersion = pcall(require, "src.core.GameVersion")
  local crystal_game_version = okGame and type(GameVersion) == "table"
      and type(GameVersion.get) == "function"
      and GameVersion.get() == "crystal"
  if crystal_game_version then
    local function crystalRegistryCatalog(name)
      local body = mod:read("lang/" .. name .. ".lua")
      if not body then return {} end
      local chunk = loadstring(body)
      if not chunk then return {} end
      local ok, value = pcall(chunk)
      return ok and type(value) == "table" and value or {}
    end
    for id, value in pairs(crystalRegistryCatalog("crystal_item_names")) do
      if type(value) == "string" and value ~= "" then mod.content.items:patch(id, { name = value }) end
    end
    for id, value in pairs(crystalRegistryCatalog("crystal_trainer_class_names")) do
      if type(value) == "string" and value ~= "" then mod.content.trainers:patch(id, { name = value }) end
    end
    for id, value in pairs(crystalRegistryCatalog("crystal_landmarks")) do
      if type(value) == "string" and value ~= "" then mod.content.landmarks:patch(id, { name = value }) end
    end
    for id, value in pairs(crystalRegistryCatalog("crystal_strings")) do
      if type(value) == "string" and value ~= "" then mod.content.strings:override(id, value) end
    end
  end

  do
    local okTrainerGame, TrainerGameVersion = pcall(require, "src.core.GameVersion")
    local trainerCatalogName = "trainer_names"
    if okTrainerGame and type(TrainerGameVersion) == "table"
        and type(TrainerGameVersion.get) == "function"
        and TrainerGameVersion.get() == "crystal"
        and mod:read("lang/trainer_names_crystal.lua") then
      trainerCatalogName = "trainer_names_crystal"
    end
    local body = mod:read("lang/" .. trainerCatalogName .. ".lua")
    local chunk = body and loadstring(body)
    local ok, names = false, nil
    if chunk then ok, names = pcall(chunk) end
    local byClass = {}
    if ok and type(names) == "table" then
      for id, value in pairs(names) do
        if type(id) == "string" and type(value) == "string" and value ~= "" then
          local class, member, english = id:match("^(.-)#(%d+)#(.*)$")
          if class then
            byClass[class] = byClass[class] or {}
            byClass[class][tonumber(member)] = { english = english, name = value }
          end
        end
      end
    end
    for class, members in pairs(byClass) do
      local record = mod.content.trainers:get(class)
      local roster = type(record) == "table" and record.trainers
      if type(roster) == "table" then
        local renamed, changed = {}, false
        for index, row in ipairs(roster) do
          local copy = {}
          for key, value in pairs(row) do copy[key] = value end
          local entry = members[index]
          if entry and row.name == entry.english then
            copy.name = entry.name
            changed = true
          end
          renamed[index] = copy
        end
        if changed then mod.content.trainers:patch(class, { trainers = renamed }) end
      end
    end
  end

  -- Silver layer: its own #DEX flavor-text pages, applied only
  -- when running Pokemon Silver -- Gold and Silver have
  -- genuinely different Pokedex descriptions per species,
  -- unlike every other named catalog above (which the two
  -- versions share verbatim), so this patches over the
  -- unconditional species_dex_text{,2} catalogs' Gold text.
  local okSilverGame, SilverGameVersion = pcall(require, "src.core.GameVersion")
  local silver_game_version = okSilverGame and type(SilverGameVersion) == "table"
      and type(SilverGameVersion.get) == "function"
      and SilverGameVersion.get() == "silver"
  if silver_game_version then
    local function silverDexTextCatalog(name)
      local body = mod:read("lang/" .. name .. ".lua")
      if not body then return {} end
      local chunk = loadstring(body)
      if not chunk then return {} end
      local ok, value = pcall(chunk)
      return ok and type(value) == "table" and value or {}
    end
    for id, value in pairs(silverDexTextCatalog("species_dex_text_silver")) do
      if type(value) == "string" and value ~= "" then
        mod.content.pokemon:patch(id, { dexEntry = { text = value } })
      end
    end
    for id, value in pairs(silverDexTextCatalog("species_dex_text2_silver")) do
      if type(value) == "string" and value ~= "" then
        mod.content.pokemon:patch(id, { dexEntry = { text2 = value } })
      end
    end
  end

  -- Crystal layer: its own #DEX flavor-text pages, applied only
  -- when running Pokemon Crystal -- Crystal has a genuinely
  -- different Pokedex description per species from both Gold and
  -- Silver, unlike every other named catalog above (which all
  -- three versions share verbatim), so this patches over the
  -- unconditional species_dex_text{,2} catalogs' Gold text.
  local okCrystalDexGame, CrystalDexGameVersion = pcall(require, "src.core.GameVersion")
  local crystal_dex_game_version = okCrystalDexGame and type(CrystalDexGameVersion) == "table"
      and type(CrystalDexGameVersion.get) == "function"
      and CrystalDexGameVersion.get() == "crystal"
  if crystal_dex_game_version then
    local function crystalDexTextCatalog(name)
      local body = mod:read("lang/" .. name .. ".lua")
      if not body then return {} end
      local chunk = loadstring(body)
      if not chunk then return {} end
      local ok, value = pcall(chunk)
      return ok and type(value) == "table" and value or {}
    end
    for id, value in pairs(crystalDexTextCatalog("species_dex_text_crystal")) do
      if type(value) == "string" and value ~= "" then
        mod.content.pokemon:patch(id, { dexEntry = { text = value } })
      end
    end
    for id, value in pairs(crystalDexTextCatalog("species_dex_text2_crystal")) do
      if type(value) == "string" and value ~= "" then
        mod.content.pokemon:patch(id, { dexEntry = { text2 = value } })
      end
    end
  end

end
