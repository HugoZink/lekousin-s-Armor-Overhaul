local outfit_string_orig = BlackMarketManager.outfit_string

function BlackMarketManager:outfit_string()
	local s = outfit_string_orig(self)
	local count
	for i = 1, #Global.real_armor do
		s, count = string.gsub(s, Global.real_armor[i], Global.spoof_armor[i])
	end
	return s
end