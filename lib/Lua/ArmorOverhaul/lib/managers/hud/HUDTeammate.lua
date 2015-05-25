function HUDTeammate:set_health(data)
	local teammate_panel = self._panel:child("player")
	local radial_health_panel = teammate_panel:child("radial_health_panel")
	local radial_health = radial_health_panel:child("radial_health")
	local red = data.current / data.total
	--[[if red < radial_health:color().red then
		self:_damage_taken()
	end]]
	radial_health:set_color(Color(1, red, 1, 1))
end