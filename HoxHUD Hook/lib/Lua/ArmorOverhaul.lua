------[[Script setup]]------
ArmorOverhaul = ArmorOverhaul or {}
ArmorOverhaul.options = {}

-- Initializing values (if options file does not exist or option has not been mentioned there)
-- All options that are initialized at false do not need to be declared
ArmorOverhaul.options.lang = "en"
ArmorOverhaul.options.localize = true
ArmorOverhaul.options.gui_enabled = true
ArmorOverhaul.options.gui_health = true
ArmorOverhaul.options.gui_armor = true

ArmorOverhaul.HOOK_HOXHUD = "HoxHUD"
ArmorOverhaul.HOOK_BLT = "BLT"

ArmorOverhaul.ARMOR_OVERHAUL_INTERNAL_VERSION = "0.6"

ArmorOverhaul.ARMOR_OVERHAUL_HOOK = ArmorOverhaul.HOOK_HOXHUD
ArmorOverhaul.ARMOR_OVERHAUL_VERSION = "Evolution"

ArmorOverhaul.ROOT = ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD and "lib/Lua/ArmorOverhaul/" or "mods/ArmorOverhaul/"

dofile(ArmorOverhaul.ROOT .. "lua/options.lua")


ArmorOverhaul.max_index = 3
ArmorOverhaul.index = 0

dofile(ArmorOverhaul.ROOT .. "lua/lib/Utils.lua")

--[[POSTREQUIRE SCRIPTS]]
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/tweak_data/upgradestweakdata.lua", 2, "lib/tweak_data/upgradestweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/managers/playermanager.lua", 2, "lib/managers/playermanager")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/units/beings/player/playerdamage.lua", 2, "lib/units/beings/player/playerdamage")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/tweak_data/skilltreetweakdata.lua", 2, "lib/tweak_data/skilltreetweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/tweak_data/blackmarkettweakdata.lua", 2, "lib/tweak_data/blackmarkettweakdata")
--RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/network/base/networkpeer.lua", 2, "lib/network/base/networkpeer")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/units/beings/player/states/playerstandard.lua", 2, "lib/units/beings/player/states/playerstandard")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/tweak_data/playertweakdata.lua", 2, "lib/tweak_data/playertweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/network/handlers/unitnetworkhandler.lua", 2, "lib/network/handlers/unitnetworkhandler")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/network/networkmember.lua", 2, "lib/network//networkmember")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/managers/upgradesmanager.lua", 2, "lib/managers/upgradesmanager")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/managers/blackmarketmanager.lua", 2, "lib/managers/blackmarketmanager")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/tweak_data/CharacterTweakData.lua", 2, "lib/tweak_data/charactertweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/CustomArmor.lua", 2, "lib/tweak_data/upgradestweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/managers/menu/blackmarketgui.lua", 2, "lib/managers/menu/blackmarketgui")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/menuhelper.lua", 2, "lib/managers/menumanager")
RegisterScript("lib/Lua/ArmorOverhaul/lua/lib/managers/hud/HUDTeammate.lua", 2, "lib/managers/hud/hudteammate")

if ArmorOverhaul.options.localize then
	RegisterScript("lib/Lua/ArmorOverhaul/lua/lang/localizationmanager_" .. ArmorOverhaul.options.lang .. ".lua", 2, "lib/managers/localizationmanager")
end

--[[PERSIST SCRIPTS]]
AddPersistScript("AmmoPool", "lib/Lua/ArmorOverhaul/lua/persistscripts/default_upgrades.lua")
AddPersistScript("SimpleMenu", "lib/Lua/ArmorOverhaul/lua/persistscripts/SimpleMenu.lua")
AddPersistScript("SmallTweaks", "lib/Lua/ArmorOverhaul/lua/persistscripts/SmallTweaks.lua")

--[[KEYBINDS]]
BindKey("VK_F1", "lib/Lua/ArmorOverhaul/lua/keybinds/decrement_page.lua")
BindKey("VK_F2", "lib/Lua/ArmorOverhaul/lua/keybinds/increment_page.lua")




if LAOUtils then
    LAOUtils.print("Initialized ArmorOverhaul " .. ArmorOverhaul.ARMOR_OVERHAUL_VERSION .. " for " .. ArmorOverhaul.ARMOR_OVERHAUL_HOOK .. " hook" .. (ArmorOverhaul.options.debug and " with debug mode enabled\n" or "\n"))
end