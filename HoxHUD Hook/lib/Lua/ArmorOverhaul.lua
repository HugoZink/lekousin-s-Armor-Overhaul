------[[Script setup]]------
--[[POSTREQUIRE SCRIPTS]]
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/upgradestweakdata.lua", 2, "lib/tweak_data/upgradestweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/playermanager.lua", 2, "lib/managers/playermanager")
RegisterScript("lib/Lua/ArmorOverhaul/lib/units/beings/player/playerdamage.lua", 2, "lib/units/beings/player/playerdamage")
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/skilltreetweakdata.lua", 2, "lib/tweak_data/skilltreetweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/tweak_data/blackmarkettweakdata.lua", 2, "lib/tweak_data/blackmarkettweakdata")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/blackmarketmanager.lua", 2, "lib/managers/blackmarketmanager")
RegisterScript("lib/Lua/ArmorOverhaul/lib/units/beings/player/states/playerstandard.lua", 2, "lib/units/beings/player/states/playerstandard")

--[[OPTIONAL POSTREQUIRE SCRIPTS (but recommended)]]
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/localizationmanager.lua", 2, "lib/managers/localizationmanager")
RegisterScript("lib/Lua/ArmorOverhaul/lib/managers/menu/blackmarketgui.lua", 2, "lib/managers/menu/blackmarketgui")

--[[PERSIST SCRIPTS]]
AddPersistScript("AmmoPool", "lib/Lua/ArmorOverhaul/persistscripts/default_upgrades.lua")