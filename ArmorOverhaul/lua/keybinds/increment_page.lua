if not ArmorOverhaul then return end
if not managers or not managers.menu_component then return end

if (not ArmorOverhaul.increment_cooldown) or Application:time() > ArmorOverhaul.increment_cooldown then
	managers.menu_component._blackmarket_gui:armor_page_up()
end

ArmorOverhaul.increment_cooldown = Application:time() + 0.1