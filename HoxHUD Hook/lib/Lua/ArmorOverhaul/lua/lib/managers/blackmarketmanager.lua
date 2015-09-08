local outfit_string_orig = BlackMarketManager.outfit_string

Global.real_armor = {
    "level_8",
    "level_9",
    "level_10",
    "level_11",
    "level_12"
}
Global.spoof_armor = {
    "level_6",
    "level_6",
    "level_1",
    "level_7",
    "level_1"
}
---- Updates armor level
function BlackMarketManager:update_custom_armor_level()
	Global.spoof_armor[5] = "level_" .. Global._custom_armor._skin_level
end

function BlackMarketManager:outfit_string()
	self:update_custom_armor_level()
	local s = outfit_string_orig(self)
	local count
	for i = 1, #Global.real_armor do
		s, count = string.gsub(s, Global.real_armor[i], Global.spoof_armor[i])
	end
	return s
end