------[[Script setup]]------

ArmorOverhaul = ArmorOverhaul or {}

ArmorOverhaul.HOOK_HOXHUD = "HoxHUD"
ArmorOverhaul.HOOK_BLT = "BLT"

ArmorOverhaul.ARMOR_OVERHAUL_INTERNAL_VERSION = "0.6"

ArmorOverhaul.ARMOR_OVERHAUL_HOOK = ArmorOverhaul.HOOK_BLT
ArmorOverhaul.ARMOR_OVERHAUL_VERSION = "Evolution"

ArmorOverhaul.ROOT = ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD and "lib/Lua/ArmorOverhaul/" or "mods/ArmorOverhaul/"

ArmorOverhaul.options = {}

-- Initializing values (if options file does not exist or option has not been mentioned there)
-- All options that are initialized at false do not need to be declared
ArmorOverhaul.options.lang = "en"
ArmorOverhaul.options.localize = true
ArmorOverhaul.options.gui_enabled = true
ArmorOverhaul.options.gui_health = true
ArmorOverhaul.options.gui_armor = true
ArmorOverhaul.options.panel_x = 200
ArmorOverhaul.options.panel_y = 200

dofile(ArmorOverhaul.ROOT .. "lua/options.lua")

LocalizationManager:load_localization_file(ArmorOverhaul.ROOT .. "lang/" .. ArmorOverhaul.options.lang .. ".json")

ArmorOverhaul.max_index = 2
ArmorOverhaul.index = 0

--dofile("mods/ArmorOverhaul/lua/lib/Utils.lua")

if LAOUtils then
    LAOUtils.print("Initialized ArmorOverhaul " .. ArmorOverhaul.ARMOR_OVERHAUL_VERSION .. " for " .. ArmorOverhaul.ARMOR_OVERHAUL_HOOK .. " hook" .. (ArmorOverhaul.options.debug and " with debug mode enabled\n" or "\n"))
end