if not armor_skills then
	if not tweak_data then return end
	armor_skills = true

	tweak_data.skilltree.default_upgrades = {
		"cable_tie",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		"player_civ_harmless_melee",
		"striker_reload_speed_default",
		"temporary_first_aid_damage_reduction",
		"temporary_passive_revive_damage_reduction_2",

		"player_add_armor_stat_skill_ammo_mul"
	}
end