function InstantBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing)
	local action_data = {}
	action_data.variant = "bullet"
	action_data.damage = damage
	action_data.weapon_unit = weapon_unit
	action_data.attacker_unit = user_unit
	action_data.col_ray = col_ray
	action_data.armor_piercing = armor_piercing
	action_data.power_type = weapon_unit:base().weapon_tweak_data and (weapon_unit:base():weapon_tweak_data().power_type or "normal") or "normal"
	local defense_data = col_ray.unit:character_damage():damage_bullet(action_data)
	return defense_data
end