if not ArmorOverhaul then return end
if not managers or not managers.menu_component then return end

if (not ArmorOverhaul.decrement_cooldown) or Application:time() > ArmorOverhaul.decrement_cooldown then
	managers.menu_component._blackmarket_gui:armor_page_down()
end

ArmorOverhaul.decrement_cooldown = Application:time() + 0.1