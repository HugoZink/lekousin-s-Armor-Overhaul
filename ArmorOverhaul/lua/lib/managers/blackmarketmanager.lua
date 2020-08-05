dofile(ModPath .. "armoroverhaulcore.lua")

local outfit_string_orig = BlackMarketManager.outfit_string
function BlackMarketManager:outfit_string()
    local s = outfit_string_orig(self)
    for real_armor, spoof_value in pairs(ArmorOverhaul.spoof) do
        s = s:gsub(real_armor, spoof_value)
    end
	return s
end
