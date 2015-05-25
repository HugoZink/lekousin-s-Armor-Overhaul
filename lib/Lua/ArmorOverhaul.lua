------[[Script setup]]------

function file_exists(name)
   local f=io and io.open(name,"r") or nil
   if f~=nil then io.close(f) return true else return false end
end

ArmorOverhaul = ArmorOverhaul or {}
ArmorOverhaul.lang = "en"
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

--[[OPTIONAL POSTREQUIRE SCRIPTS (but recommended)]]
if file_exists("lib/Lua/ArmorOverhaul/lib/managers/localizationmanager_" .. ArmorOverhaul.lang .. ".lua") then
	RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/localizationmanager_" .. ArmorOverhaul.lang .. ".lua", 2, "lib/managers/localizationmanager")
else
	RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/localizationmanager_en.lua", 2, "lib/managers/localizationmanager")
end
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/menu/blackmarketgui.lua", 2, "lib/managers/menu/blackmarketgui")
RegisterScript("lib/Lua/ArmorOverhaul/lib/menuhelper.lua", 2, "lib/managers/menumanager")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/hud/HUDTeammate.lua", 2, "lib/managers/hud/hudteammate")

--[[PERSIST SCRIPTS]]
AddPersistScript("AmmoPool", "lib/Lua/ArmorOverhaul/persistscripts/default_upgrades.lua")
AddPersistScript("SimpleMenu", "lib/Lua/ArmorOverhaul/persistscripts/SimpleMenu.lua")

--[[KEYBINDS]]
BindKey("VK_F1", "lib/Lua/ArmorOverhaul/keybinds/decrement_page.lua")
BindKey("VK_F2", "lib/Lua/ArmorOverhaul/keybinds/increment_page.lua")
