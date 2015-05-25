if not ArmorOverhaul then return end

if (not ArmorOverhaul.increment_cooldown) or Application:time() > ArmorOverhaul.increment_cooldown then
	ArmorOverhaul.index = ArmorOverhaul.index < ArmorOverhaul.max_index and ArmorOverhaul.index + 1 or ArmorOverhaul.index
end

ArmorOverhaul.increment_cooldown = Application:time() + 0.1