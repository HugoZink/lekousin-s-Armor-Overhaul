init_pd2 = UpgradesTweakData._init_pd2_values
player_def = UpgradesTweakData._player_definitions

function UpgradesTweakData:_init_pd2_values()
	init_pd2(self)
	self.values.player.body_armor.armor = {
		0,
		1,
		2,
		3,
		5.5,
		8,
		18,
		6,
		10,
		-2,
		48
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
		0.2
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
		0.05,
		-0.05,
		-0.2,
		-0.25,
		-0.3,
		-0.4,
		-0.5,
		-0.4,
		-0.35,
		0.3,
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
		0.75,
		1,
		1,
		1,
		1.35,
		1,
		1,
		1,
		1.4,
		0.35,
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
			{0, 0.1},
			{1.2, 0}
		},
		{
			{0, 0.12},
			{1.5, 0}
		},
		{
			{0, 0.15},
			{2, 0}
		},
		{
			{0, 0.2},
			{3, 0}
		},
		{
			{0, 0.25},
			{3.5, 0}
		},
		{
			{0, 0.4},
			{6, 0.05}
		},
		{
			{0, 0.2},
			{3, 0}
		},
		{
			{0, 0.25},
			{3.5, 0.05}
		},
		{
			{0, 0}, 
			{0, 0}
		},
		{
			{1, 0.5},
			{4, 0.1}
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
		0.05,
		0,
		0,
		0
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
		3,
		0,
		-3,
		0
	}
	self.values.player.body_armor.jump_speed_multiplier = {
		1,
		1,
		0.96,
		0.92,
		0.875,
		0.8,
		0.65,
		0.775,
		0.85,
		1.1,
		0.2
	}
	self.values.player.level_8_hp_regen_addend = {0.1}
	self.values.player.level_9_armor_regen_addend = {1}
	self.values.player.level_9_armor_regen_delay_multiplier = {0.8}
	self.values.player.level_9_deflect_chance_addend = {0.1}
	self.values.player.level_10_dodge_addend = {0.25}
	self.values.player.level_11_edr_addend = {0.15}
	self.values.player.level_11_hp_addend = {1}
	self.values.player.level_11_movement_addend = {5.25}
	self.values.player.level_11_stamina_multiplier = {3}
end

function UpgradesTweakData:_player_definitions()
	player_def(self)
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
end