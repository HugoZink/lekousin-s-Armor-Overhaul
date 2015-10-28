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

		"player_add_armor_stat_skill_ammo_mul",
		"body_armor11",

		"player_all_dodge_addend",
		"player_all_ammo_addend",
		"player_all_deflect_addend",
		"player_all_hdr_addend",
		"player_all_edr_addend",
		"player_all_jump_addend",

		"player_headshot_add_max_armor_bonus_2"
	}
end