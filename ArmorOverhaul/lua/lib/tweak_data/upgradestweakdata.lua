Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "armoroverhaul_initpd2values_upgradestweak", function(self)
	self.values.player.body_armor.scaling_normal = {
		armor = 1,
		movement = 1,
		dodge = 1,
		damage_shake = 1,
		stamina = 1,
		skill_ammo_mul = 1,
		health_damage_reduction = 0.4,
		deflect = 0.4,
		regen = 0.6,
		explosion_damage_reduction = 1,
		hp_regen = 1,
		hp_addend = 1,
		jump_speed_multiplier = 1,
		ap_regen_suppressed_max_multiplier = 1
	}
	self.values.player.body_armor.scaling_hard = {
		armor = 1.25,
		movement = 1,
		dodge = 1,
		damage_shake = 1,
		stamina = 1,
		skill_ammo_mul = 1,
		health_damage_reduction = 0.5,
		deflect = 0.5,
		regen = 0.65,
		explosion_damage_reduction = 1,
		hp_regen = 1,
		hp_addend = 1.375,
		jump_speed_multiplier = 1,
		ap_regen_suppressed_max_multiplier = 1
	}
	self.values.player.body_armor.scaling_overkill = {
		armor = 1.5,
		movement = 1,
		dodge = 1,
		damage_shake = 1,
		stamina = 1,
		skill_ammo_mul = 1,
		health_damage_reduction = 0.6,
		deflect = 0.6,
		regen = 0.75,
		explosion_damage_reduction = 1,
		hp_regen = 1,
		hp_addend = 1.75,
		jump_speed_multiplier = 1,
		ap_regen_suppressed_max_multiplier = 1
	}
	self.values.player.body_armor.scaling_overkill_145 = {
		armor = 2,
		movement = 1,
		dodge = 1,
		damage_shake = 1,
		stamina = 1,
		skill_ammo_mul = 1,
		health_damage_reduction = 0.8,
		deflect = 0.8,
		regen = 0.9,
		explosion_damage_reduction = 1,
		hp_regen = 1,
		hp_addend = 2.125,
		jump_speed_multiplier = 1,
		ap_regen_suppressed_max_multiplier = 1
	}
	self.values.player.body_armor.scaling_overkill_290 = {
		armor = 2.5,
		movement = 1,
		dodge = 1,
		damage_shake = 1,
		stamina = 1,
		skill_ammo_mul = 1,
		health_damage_reduction = 1,
		deflect = 1,
		regen = 1,
		explosion_damage_reduction = 1,
		hp_regen = 1,
		hp_addend = 2.5,
		jump_speed_multiplier = 1,
		ap_regen_suppressed_max_multiplier = 1
	}
	self.values.player.body_armor.armor = { -- Level-independent armor values -- Old values
		2,
		3,
		4,
		5,
		7.5,
		10,
		20,
		8,
		12,
		0,
		50
	}
	self.values.player.body_armor.armor = { -- Normal armor
		2,
		2.5,
		3,
		3.5,
		4.5,
		6.5,
		10,
		5,
		8,
		0,
		20
	}
	--Increased Armor scaling (no cooldown version)
	self.values.player.body_armor.scaling_hard.armor = 1.1
	self.values.player.body_armor.scaling_overkill.armor = 1.35
	self.values.player.body_armor.scaling_overkill_145.armor = 1.75
	self.values.player.body_armor.scaling_overkill_290.armor = 2.5
	self.values.player.body_armor.scaling_normal.regen = 0.7--0.9
	self.values.player.body_armor.scaling_hard.regen = 0.8--0.975
	self.values.player.body_armor.scaling_overkill.regen = 0.875--1.125
	self.values.player.body_armor.scaling_overkill_145.regen = 0.95--1.35
	self.values.player.body_armor.scaling_overkill_290.regen = 1--1.5
	--[[
	self.values.player.body_armor.armor = { -- Incremental armor
		0,
		1,
		1,
		1,
		2.5,
		2.5,
		10,
		-12,
		4,
		-12,
		48
	}--]]
	self.values.player.body_armor.armor_normal = {
		level_1 = 2,
	}
	self.values.player.body_armor.armor_hard = {
		level_1 = 2,
	}
	self.values.player.body_armor.armor_overkill = {
		level_1 = 2,
	}
	self.values.player.body_armor.armor_overkill_145 = {
		level_1 = 2,
	}
	self.values.player.body_armor.armor_overkill_290 = {
		level_1 = 3,
	}
	self.values.player.body_armor.movement = {
		1,
		0.975,
		0.925,
		0.85,
		0.75,
		0.6,
		0.4,
		0.5,
		0.65,
		1.2,
		0.285725
	}
	self.values.player.body_armor.concealment = {
		30,
		26,
		23,
		21,
		18,
		12,
		1,
		12,
		12,
		30,
		1
	}
	self.values.player.body_armor.dodge = {
		0.15,
		0.05,
		0,
		-0.1,
		-0.25,
		-0.4,
		-0.5,
		-0.4,
		-0.25,
		0.5,
		-1
	}
	self.values.player.body_armor.damage_shake = {
		1,
		0.96,
		0.92,
		0.85,
		0.8,
		0.7,
		0.5,
		0.75,
		0.8,
		1.2,
		0
	}
	self.values.player.body_armor.stamina = {
		1,
		0.975,
		0.925,
		0.85,
		0.75,
		0.6,
		0.4,
		0.55,
		0.65,
		1.1,
		0.1
	}
	self.values.player.body_armor.skill_ammo_mul = {
		1,
		1,
		1,
		1,
		1.35,
		1,
		1,
		1,
		1.4,
		0.8,
		1
	}


	-- {min damage, min hdr}, {max damage, max hdr}
	self.values.player.body_armor.health_damage_reduction = {
		{
			{0, 0},
			{0, 0}
		},
		{
			{0, 0},
			{10, 0.05}
		},
		{
			{0, 0},
			{8.5, 0.1}
		},
		{
			{0, 0.05},
			{7.5, 0.1}
		},
		{
			{0, 0.1},
			{6.5, 0.175}
		},
		{
			{0.5, 0.15},
			{6, 0.2}
		},
		{
			{1, 0.25},
			{5, 0.35}
		},
		{
			{0, 0.15},
			{7.5, 0.25}
		},
		{
			{0.5, 0.175},
			{5.5, 0.225}
		},
		{
			{0, 0},
			{0, 0}
		},
		{
			{2, 0.35},
			{4, 0.5}
		}
	}
	-- {min damage, min deflect chance}, {max damage, max deflect chance}
	self.values.player.body_armor.deflect = {
		{
			{0, 0},
			{0, 0}
		},
		{
			{0, 0.05},
			{2, 0}
		},
		{
			{0, 0.1},
			{2.5, 0}
		},
		{
			{0, 0.15},
			{3, 0}
		},
		{
			{0, 0.25},
			{3.5, 0}
		},
		{
			{0, 0.3},
			{4, 0}
		},
		{
			{0, 0.35},
			{5, 0}
		},
		{
			{0, 0.3},
			{3, 0}
		},
		{
			{1, 0.5},
			{9, 0.1}
		},
		{
			{0, 0},
			{0, 0}
		},
		{
			{0.5, 0.5},
			{5, 0.05}
		}
	}
	-- Amount of armor regenerated per second
	self.values.player.body_armor.regen = {
		2,
		2.15,
		2.3,
		2.5,
		3,
		3.25,
		4,
		2.7,
		4,
		0,
		6.25
	}
	self.values.player.body_armor.explosion_damage_reduction = {
		0,
		0.02,
		0.05,
		0.1,
		0.25,
		0.2,
		0.35,
		0.2,
		0.25,
		0,
		0.75
	}
	-- Amount of HP regen per second
	self.values.player.body_armor.hp_regen = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0.4,
		0,
		0,
		0
	}
	self.values.player.body_armor.hp_regen_normal = {
		level_1 = 0,
		level_2 = 0.001,
		level_3 = 0.0025,
		level_4 = 0.005,
		level_5 = 0.0075,
		level_6 = 0.01,
		level_7 = 0.02,
		level_8 = 0.1,
		level_9 = 0.015,
		level_10 = 0,
		level_11 = 0.025
	}
	-- Amount of max HP bonus (factored before skills)
	self.values.player.body_armor.hp_addend = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		10,
		0,
		-3,
		0
	}
	self.values.player.body_armor.jump_speed_multiplier = {
		1,
		1,
		0.99,
		0.98,
		0.97,
		0.95,
		0.93,
		0.94,
		0.96,
		1.1,
		0.9
	}
	self.values.player.body_armor.ap_regen_suppressed_max_multiplier = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		0.75
	}
	self.values.player.body_armor.bleeding_reduction = {
		6,
		6.6,
		7.2,
		7.8,
		9,
		10.5,
		12,
		20,
		13.5,
		2,
		15
	}
	self.values.player.level_8_hp_regen_addend = {0.2}
	self.values.player.level_9_armor_regen_addend = {1}
	self.values.player.level_9_armor_regen_delay_multiplier = {0.8}
	self.values.player.level_9_deflect_chance_addend = {0.1}
	self.values.player.level_10_dodge_addend = {0.15}
	self.values.player.level_11_edr_addend = {0.15}
	self.values.player.level_11_hp_addend = {4}
	self.values.player.level_11_movement_addend = {6}
	self.values.player.level_11_stamina_multiplier = {5}
	self.values.player.headshot_add_max_armor_bonus = {
		{0.01, 0.05},
		{0.02, 0.1},
		{0.03, 0.2},
		{0.04, 0.35},
		{0.05, 0.5}
	}

	self.values.crew = {}
	self.values.crew.xp = {}
	self.values.crew.armor = {}
	self.values.crew.health = {}
	self.values.crew.deflect_chance = {}
	self.values.crew.xp.multiplier = {1.1}
	self.values.crew.armor.multiplier = {1.2}
	self.values.crew.health.multiplier = {1.2}
	self.values.crew.deflect_chance.addend = {0.1}
end)

Hooks:PostHook(UpgradesTweakData, "_player_definitions", "armoroverhaul_playerdefinitions_upgradestweak", function(self)
	self.definitions.body_armor7 = {
		category = "armor",
		armor_id = "level_8",
		name_id = "bm_armor_level_8"
	}
	self.definitions.body_armor8 = {
		category = "armor",
		armor_id = "level_9",
		name_id = "bm_armor_level_9"
	}
	self.definitions.body_armor9 = {
		category = "armor",
		armor_id = "level_10",
		name_id = "bm_armor_level_10"
	}
	self.definitions.body_armor10 = {
		category = "armor",
		armor_id = "level_11",
		name_id = "bm_armor_level_11"
	}
	--[[
	self.definitions.body_armor11 = {
		category = "armor",
		armor_id = "level_12",
		name_id = "bm_armor_level_12"
	}
	]]
	self.definitions.player_level_8_hp_regen_addend = {
		category = "feature",
		name_id = "menu_player_level_8_hp_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "level_8_hp_regen_addend",
			value = 1
		}
	}
	self.definitions.player_level_9_armor_regen_addend = {
		category = "feature",
		name_id = "menu_player_level_9_armor_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "level_9_armor_regen_addend",
			value = 1
		}
	}
	self.definitions.player_level_9_armor_regen_delay_multiplier = {
		category = "feature",
		name_id = "menu_player_level_9_armor_regen_delay_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_9_armor_regen_delay_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_9_deflect_chance_addend = {
		category = "feature",
		name_id = "menu_player_level_9_deflect_chance_addend",
		upgrade = {
			category = "player",
			upgrade = "level_9_deflect_chance_addend",
			value = 1
		}
	}
	self.definitions.player_level_10_dodge_addend = {
		category = "feature",
		name_id = "menu_player_level_10_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_10_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_11_edr_addend = {
		category = "feature",
		name_id = "menu_player_level_11_edr_addend",
		upgrade = {
			category = "player",
			upgrade = "level_11_edr_addend",
			value = 1
		}
	}
	self.definitions.player_level_11_hp_addend = {
		category = "feature",
		name_id = "menu_player_level_11_hp_addend",
		upgrade = {
			category = "player",
			upgrade = "level_11_hp_addend",
			value = 1
		}
	}
	self.definitions.player_level_11_movement_addend = {
		category = "feature",
		name_id = "menu_player_level_11_movement_addend",
		upgrade = {
			category = "player",
			upgrade = "level_11_movement_addend",
			value = 1
		}
	}
	self.definitions.player_level_11_stamina_multiplier = {
		category = "feature",
		name_id = "menu_player_level_11_stamina_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_11_stamina_multiplier",
			value = 1
		}
	}
	self.definitions.player_headshot_add_max_armor_bonus_1 = {
		category = "feature",
		name_id = "menu_player_headshot_add_max_armor_bonus_1",
		upgrade = {
			category = "player",
			upgrade = "headshot_add_max_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_headshot_add_max_armor_bonus_2 = {
		category = "feature",
		name_id = "menu_player_headshot_add_max_armor_bonus_2",
		upgrade = {
			category = "player",
			upgrade = "headshot_add_max_armor_bonus",
			value = 2
		}
	}
	self.definitions.player_headshot_add_max_armor_bonus_3 = {
		category = "feature",
		name_id = "menu_player_headshot_add_max_armor_bonus_3",
		upgrade = {
			category = "player",
			upgrade = "headshot_add_max_armor_bonus",
			value = 3
		}
	}
	self.definitions.player_headshot_add_max_armor_bonus_4 = {
		category = "feature",
		name_id = "menu_player_headshot_add_max_armor_bonus_4",
		upgrade = {
			category = "player",
			upgrade = "headshot_add_max_armor_bonus",
			value = 4
		}
	}
	self.definitions.player_headshot_add_max_armor_bonus_5 = {
		category = "feature",
		name_id = "menu_player_headshot_add_max_armor_bonus_5",
		upgrade = {
			category = "player",
			upgrade = "headshot_add_max_armor_bonus",
			value = 5
		}
	}

	self.definitions.crew_xp_multiplier = {
		category = "crew",
		name_id = "menu_crew_xp_multiplier",
		upgrade = {
			category = "xp",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.crew_armor_multiplier = {
		category = "crew",
		name_id = "menu_crew_armor_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.crew_health_multiplier = {
		category = "crew",
		name_id = "menu_crew_health_multiplier",
		upgrade = {
			category = "health",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.crew_deflect_chance_addend = {
		category = "crew",
		name_id = "menu_crew_deflect_chance_addend",
		upgrade = {
			category = "deflect_chance",
			upgrade = "addend",
			value = 1
		}
	}
end)
