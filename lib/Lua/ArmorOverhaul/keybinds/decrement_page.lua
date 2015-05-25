if not ArmorOverhaul then return end

if (not ArmorOverhaul.decrement_cooldown) or Application:time() > ArmorOverhaul.decrement_cooldown then
	ArmorOverhaul.index = ArmorOverhaul.index > 0 and ArmorOverhaul.index - 1 or ArmorOverhaul.index
end

ArmorOverhaul.decrement_cooldown = Application:time() + 0.1