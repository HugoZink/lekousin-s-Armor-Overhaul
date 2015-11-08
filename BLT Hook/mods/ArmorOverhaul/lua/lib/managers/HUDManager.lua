function string.remove_zeros(base_format, str)
	local string_value = string.format(base_format, str)
	while string.sub(string_value, -1) == "0" do
		string_value = string.sub(string_value, 1, -2)
	end
	if string.sub(string_value, -1) == "." then
		string_value = string.sub(string_value, 1, -2)
	end
	return string_value
end

function HUDManager:set_doom_armor(data)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	local cur_doom_armor = string.remove_zeros("%0.2f", data.doom*10)
	local max_doom_armor = string.remove_zeros("%0.2f", data.doom_max*10)
	local doom_mitigation = string.remove_zeros("%0.2f", data.doom_absorb*100)
	hud.panel:child("ArmorOverhaul"):child("doom_armor_text"):set_text(max_doom_armor ~= "0" and (cur_doom_armor .. " / " .. max_doom_armor .. " (" .. doom_mitigation .. "%)") or "")
	local radial_doom = hud.panel:child("ArmorOverhaul"):child("radial_doom")
	local color = radial_doom:color()
	color.red = cur_doom_armor / max_doom_armor
	color.blue = 1
	color.green = 1
	radial_doom:set_color(color)
end

function HUDManager:set_armor(data)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	local cur_armor = string.remove_zeros("%0.2f", data.current_armor*10)
	local max_armor = string.remove_zeros("%0.2f", data.total_armor*10)
	hud.panel:child("ArmorOverhaul"):child("armor_text"):set_text(max_armor ~= "0" and (cur_armor .. " / " .. max_armor) or "")
end

function HUDManager:set_health(data)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	local cur_health = string.remove_zeros("%0.2f", data.current_health*10)
	local max_health = string.remove_zeros("%0.2f", data.total_health*10)
	hud.panel:child("ArmorOverhaul"):child("hp_text"):set_text(cur_health .. " / " .. max_health)
end

function HUDManager:set_bleeding(data)
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	hud.panel:child("bleeding_text"):set_text(data.bleeding > 0 and "Bleeding !" or "")
	hud.panel:child("bleeding_rate_text"):set_text(data.bleeding > 0 and ("Rate: " .. data.bleeding) or "")
end

function HUDManager:update_armor_overhaul_values(data)
	self:set_health(data)
	self:set_armor(data)
	--self:set_doom_armor(data)
	self:set_bleeding(data)
end