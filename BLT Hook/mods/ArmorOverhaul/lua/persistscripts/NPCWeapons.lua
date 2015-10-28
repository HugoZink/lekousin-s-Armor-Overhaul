if not tweak_data then return end
if NPCWeapons then return end

for name, weap in pairs(tweak_data.weapon) do
	if name:sub(-4) == "_npc" then
		weap.power_type = name:sub(1, -5)
	end
end

for _, preset in pairs(tweak_data.character.presets.weapon) do
	for _, weap in pairs(preset) do
		weap.inacc = 1
	end
end

NPCWeapons = true