------[[Script setup]]------
ArmorOverhaul = ArmorOverhaul or {}

ArmorOverhaul.HOOK_HOXHUD = "HoxHUD"
ArmorOverhaul.HOOK_BLT = "BLT"

ArmorOverhaul.ARMOR_OVERHAUL_HOOK = ArmorOverhaul.HOOK_HOXHUD
ArmorOverhaul.ARMOR_OVERHAUL_STEP = "Beta"
ArmorOverhaul.ARMOR_OVERHAUL_VERSION = "0.6"
ArmorOverhaul.ARMOR_OVERHAUL_BRANCH = "Beta " -- Space must be here if branch is release



ArmorOverhaul.max_index = 3
ArmorOverhaul.index = 0

--[[POSTREQUIRE SCRIPTS]]
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/upgradestweakdata.lua", 2, "lib/tweak_data/upgradestweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/playermanager.lua", 2, "lib/managers/playermanager")
RegisterScript("lib/Lua/ArmorOverhaul/lib/units/beings/player/playerdamage.lua", 2, "lib/units/beings/player/playerdamage")
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/skilltreetweakdata.lua", 2, "lib/tweak_data/skilltreetweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/blackmarkettweakdata.lua", 2, "lib/tweak_data/blackmarkettweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/network/base/networkpeer.lua", 2, "lib/network/base/networkpeer")
RegisterScript("lib/Lua/ArmorOverhaul/lib/units/beings/player/states/playerstandard.lua", 2, "lib/units/beings/player/states/playerstandard")
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/playertweakdata.lua", 2, "lib/tweak_data/playertweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/network/handlers/unitnetworkhandler.lua", 2, "lib/network/handlers/unitnetworkhandler")
RegisterScript("lib/Lua/ArmorOverhaul/lib/network/networkmember.lua", 2, "lib/network//networkmember")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/upgradesmanager.lua", 2, "lib/managers/upgradesmanager")

--[[OPTIONAL POSTREQUIRE SCRIPTS (but recommended)]]
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/menu/blackmarketgui.lua", 2, "lib/managers/menu/blackmarketgui")
RegisterScript("lib/Lua/ArmorOverhaul/lib/menuhelper.lua", 2, "lib/managers/menumanager")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/hud/HUDTeammate.lua", 2, "lib/managers/hud/hudteammate")

--[[PERSIST SCRIPTS]]
AddPersistScript("AmmoPool", "lib/Lua/ArmorOverhaul/persistscripts/default_upgrades.lua")
AddPersistScript("SimpleMenu", "lib/Lua/ArmorOverhaul/persistscripts/SimpleMenu.lua")

--[[KEYBINDS]]
BindKey("VK_F1", "lib/Lua/ArmorOverhaul/keybinds/decrement_page.lua")
BindKey("VK_F2", "lib/Lua/ArmorOverhaul/keybinds/increment_page.lua")


dofile("lib/Lua/ArmorOverhaul/lib/Utils.lua")

if Utils then
    if Utils.file_exists("lib/Lua/ArmorOverhaul/ArmorOverhaul.ini") then
        Utils.parse_options("lib/Lua/ArmorOverhaul/ArmorOverhaul.ini")
    end
    if not ArmorOverhaul.lang then
        ArmorOverhaul.lang = "en"
    end
    
    RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/localizationmanager_" .. ArmorOverhaul.lang .. ".lua", 2, "lib/managers/localizationmanager")

    Utils.print_log("Initialized ArmorOverhaul " .. ArmorOverhaul.ARMOR_OVERHAUL_STEP .. " " .. ArmorOverhaul.ARMOR_OVERHAUL_VERSION .. " " .. ArmorOverhaul.ARMOR_OVERHAUL_BRANCH .. "for " .. ArmorOverhaul.ARMOR_OVERHAUL_HOOK .. " hook\n")
else
    ArmorOverhaul.lang = "en"
    
    RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/localizationmanager_" .. ArmorOverhaul.lang .. ".lua", 2, "lib/managers/localizationmanager")
end