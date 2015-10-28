init_pd2 = UpgradesTweakData._init_pd2_values
player_def = UpgradesTweakData._player_definitions

function UpgradesTweakData:set_normal()
	self.values.player.body_armor.armor_normal = {
		level_1 = 2,
		level_2 = 3,
		level_3 = 4,
		level_4 = 5,
		level_5 = 7,
		level_6 = 9,
		level_7 = 12,
		level_8 = 8,
		level_9 = 10,
		level_11 = 20
	}
	self.values.player.body_armor.regen_normal = {
		level_1 = 2,		-- 1 second
		level_2 = 2.5,		-- 1.2
		level_3 = 3.076,	-- 1.3
		level_4 = 3.571,	-- 1.4
		level_5 = 4.375,	-- 1.6
		level_6 = 5,		-- 1.8
		level_7 = 6,		-- 2
		level_8 = 5,		-- 1.6
		level_9 = 8,		-- 1.25
		level_11 = 6.667	-- 3
	}
	self.values.player.body_armor.health_damage_reduction_normal = {
		level_1 = {
			{0, 0},
			{100, 0}
		},
		level_2 = {
			{0, 0},
			{20, 0.05}
		},
		level_3 = {
			{0, 0},
			{18, 0.09}
		},
		level_4 = {
			{1, 0.02},
			{17, 0.14}
		},
		level_5 = {
			{1.5, 0.05},
			{15.5, 0.19}
		},
		level_6 = {
			{2, 0.1},
			{14, 0.22}
		},
		level_7 = {
			{2.5, 0.15},
			{12.5, 0.25}
		},
		level_8 = {
			{4, 0.2},
			{10, 0.38}
		},
		level_9 = {
			{2, 0.05},
			{12, 0.25}
		},
		level_11 = {
			{2, 0.05},
			{16, 0.19}
		}
	}
	self.values.player.body_armor.deflect_normal = {
		level_1 = {
			{0, 0},
			{0, 0}
		},
		level_2 = {
			{0, 0.05},
			{4, 0}
		},
		level_3 = {
			{0, 0.1},
			{4.5, 0}
		},
		level_4 = {
			{0, 0.15},
			{5, 0}
		},
		level_5 = {
			{0, 0.25},
			{5.5, 0}
		},
		level_6 = {
			{0, 0.3},
			{6, 0}
		},
		level_7 = {
			{0, 0.35},
			{7, 0}
		},
		level_8 = {
			{0, 0.3},
			{6, 0}
		},
		level_9 = {
			{1, 0.5},
			{13, 0.1}
		},
		level_11 = {
			{0.5, 0.4},
			{7.5, 0.05}
		}
	}
end

function UpgradesTweakData:set_hard()
	self.values.player.body_armor.armor_hard = {
		level_1 = 2,
		level_2 = 3,
		level_3 = 4,
		level_4 = 5,
		level_5 = 7,
		level_6 = 9,
		level_7 = 12,
		level_8 = 8,
		level_9 = 10,
		level_11 = 20
	}
	self.values.player.body_armor.regen_hard = {
		level_1 = 2,		-- 1 second
		level_2 = 2.4,		-- 1.25
		level_3 = 2.963,	-- 1.35
		level_4 = 3.333,	-- 1.5
		level_5 = 4,		-- 1.75
		level_6 = 4.5,		-- 2
		level_7 = 4.8,		-- 2.5
		level_8 = 4.5,		-- 2
		level_9 = 6.667,	-- 1.5
		level_11 = 5		-- 4
	}
	self.values.player.body_armor.health_damage_reduction_hard = {
		level_1 = {
			{0, 0},
			{100, 0}
		},
		level_2 = {
			{0, 0},
			{20, 0.05}
		},
		level_3 = {
			{0, 0},
			{18, 0.09}
		},
		level_4 = {
			{1, 0.02},
			{17, 0.14}
		},
		level_5 = {
			{1.5, 0.05},
			{15.5, 0.19}
		},
		level_6 = {
			{2, 0.1},
			{14, 0.22}
		},
		level_7 = {
			{2.5, 0.15},
			{12.5, 0.25}
		},
		level_8 = {
			{4, 0.2},
			{10, 0.38}
		},
		level_9 = {
			{2, 0.05},
			{12, 0.25}
		},
		level_11 = {
			{2, 0.05},
			{16, 0.19}
		}
	}
	self.values.player.body_armor.deflect_hard = {
		level_1 = {
			{0, 0},
			{0, 0}
		},
		level_2 = {
			{0, 0.05},
			{4, 0}
		},
		level_3 = {
			{0, 0.1},
			{4.5, 0}
		},
		level_4 = {
			{0, 0.15},
			{5, 0}
		},
		level_5 = {
			{0, 0.25},
			{5.5, 0}
		},
		level_6 = {
			{0, 0.3},
			{6, 0}
		},
		level_7 = {
			{0, 0.35},
			{7, 0}
		},
		level_8 = {
			{0, 0.3},
			{6, 0}
		},
		level_9 = {
			{1, 0.5},
			{13, 0.1}
		},
		level_11 = {
			{0.5, 0.4},
			{7.5, 0.05}
		}
	}
end

function UpgradesTweakData:set_very_hard()
	self.values.player.body_armor.armor_overkill = {
		level_1 = 2,
		level_2 = 3.5,
		level_3 = 4.5,
		level_4 = 5.5,
		level_5 = 7.5,
		level_6 = 10,
		level_7 = 13,
		level_8 = 9,
		level_9 = 11,
		level_11 = 22
	}
	self.values.player.body_armor.regen_overkill = {
		level_1 = 2,		-- 1 second
		level_2 = 2.59,		-- 1.35
		level_3 = 3,		-- 1.5
		level_4 = 3.14,		-- 1.75
		level_5 = 3.75,		-- 2
		level_6 = 4,		-- 2.5
		level_7 = 4.333,	-- 3
		level_8 = 3.6,		-- 2.5
		level_9 = 6.286,	-- 1.75
		level_11 = 4.4		-- 5
	}
	self.values.player.body_armor.health_damage_reduction_overkill = {
		level_1 = {
			{0, 0},
			{100, 0}
		},
		level_2 = {
			{0, 0},
			{20, 0.05}
		},
		level_3 = {
			{0, 0},
			{18, 0.09}
		},
		level_4 = {
			{1, 0.02},
			{17, 0.14}
		},
		level_5 = {
			{1.5, 0.05},
			{15.5, 0.19}
		},
		level_6 = {
			{2, 0.1},
			{14, 0.22}
		},
		level_7 = {
			{2.5, 0.15},
			{12.5, 0.25}
		},
		level_8 = {
			{4, 0.2},
			{10, 0.38}
		},
		level_9 = {
			{2, 0.05},
			{12, 0.25}
		},
		level_11 = {
			{2, 0.05},
			{16, 0.19}
		}
	}
	self.values.player.body_armor.deflect_overkill = {
		level_1 = {
			{0, 0},
			{0, 0}
		},
		level_2 = {
			{0, 0.05},
			{4, 0}
		},
		level_3 = {
			{0, 0.1},
			{4.5, 0}
		},
		level_4 = {
			{0, 0.15},
			{5, 0}
		},
		level_5 = {
			{0, 0.25},
			{5.5, 0}
		},
		level_6 = {
			{0, 0.3},
			{6, 0}
		},
		level_7 = {
			{0, 0.35},
			{7, 0}
		},
		level_8 = {
			{0, 0.3},
			{6, 0}
		},
		level_9 = {
			{1, 0.5},
			{13, 0.1}
		},
		level_11 = {
			{0.5, 0.4},
			{7.5, 0.05}
		}
	}
end

function UpgradesTweakData:set_overkill()
	self.values.player.body_armor.armor_overkill_145 = {
		level_1 = 2,
		level_2 = 4,
		level_3 = 5,
		level_4 = 6,
		level_5 = 8,
		level_6 = 10,
		level_7 = 15,
		level_8 = 10,
		level_9 = 12,
		level_11 = 25
	}
	self.values.player.body_armor.regen_overkill_145 = {
		level_1 = 2,		-- 1 second
		level_2 = 2.667,	-- 1.5
		level_3 = 2.857,	-- 1.75
		level_4 = 3,		-- 2
		level_5 = 3.2,		-- 2.5
		level_6 = 3.333,	-- 3
		level_7 = 3.75,		-- 4
		level_8 = 3.333,	-- 3
		level_9 = 6,		-- 2
		level_11 = 4.167	-- 6
	}
	self.values.player.body_armor.health_damage_reduction_overkill_145 = {
		level_1 = {
			{0, 0},
			{100, 0}
		},
		level_2 = {
			{0, 0},
			{20, 0.05}
		},
		level_3 = {
			{0, 0},
			{18, 0.09}
		},
		level_4 = {
			{1, 0.02},
			{17, 0.14}
		},
		level_5 = {
			{1.5, 0.05},
			{15.5, 0.19}
		},
		level_6 = {
			{2, 0.1},
			{14, 0.22}
		},
		level_7 = {
			{2.5, 0.15},
			{12.5, 0.25}
		},
		level_8 = {
			{4, 0.2},
			{10, 0.38}
		},
		level_9 = {
			{2, 0.05},
			{12, 0.25}
		},
		level_11 = {
			{2, 0.05},
			{16, 0.19}
		}
	}
	self.values.player.body_armor.deflect_overkill_145 = {
		level_1 = {
			{0, 0},
			{0, 0}
		},
		level_2 = {
			{0, 0.05},
			{4, 0}
		},
		level_3 = {
			{0, 0.1},
			{4.5, 0}
		},
		level_4 = {
			{0, 0.15},
			{5, 0}
		},
		level_5 = {
			{0, 0.25},
			{5.5, 0}
		},
		level_6 = {
			{0, 0.3},
			{6, 0}
		},
		level_7 = {
			{0, 0.35},
			{7, 0}
		},
		level_8 = {
			{0, 0.3},
			{6, 0}
		},
		level_9 = {
			{1, 0.5},
			{13, 0.1}
		},
		level_11 = {
			{0.5, 0.4},
			{7.5, 0.05}
		}
	}
end

function UpgradesTweakData:set_deathwish()
	self.values.player.body_armor.armor_overkill_290 = {
		level_1 = 3,
		level_2 = 5,
		level_3 = 7,
		level_4 = 8,
		level_5 = 10,
		level_6 = 12,
		level_7 = 18,
		level_8 = 11,
		level_9 = 14,
		level_11 = 35
	}
	self.values.player.body_armor.regen_overkill_290 = {
		level_1 = 3,		-- 1 second
		level_2 = 2.85,		-- 1.75
		level_3 = 3.5,		-- 2
		level_4 = 3.555,	-- 2.25
		level_5 = 3.636,	-- 2.75
		level_6 = 4,		-- 3
		level_7 = 6,		-- 5
		level_8 = 4.4,		-- 4
		level_9 = 7,		-- 2.5
		level_11 = 5		-- 7
	}
	self.values.player.body_armor.health_damage_reduction_overkill_290 = {
		level_1 = {
			{0, 0},
			{100, 0}
		},
		level_2 = {
			{0, 0},
			{20, 0.05}
		},
		level_3 = {
			{0, 0},
			{18, 0.09}
		},
		level_4 = {
			{1, 0.02},
			{17, 0.14}
		},
		level_5 = {
			{1.5, 0.05},
			{15.5, 0.19}
		},
		level_6 = {
			{2, 0.1},
			{14, 0.22}
		},
		level_7 = {
			{2.5, 0.15},
			{12.5, 0.25}
		},
		level_8 = {
			{4, 0.2},
			{10, 0.38}
		},
		level_9 = {
			{2, 0.05},
			{12, 0.25}
		},
		level_11 = {
			{2, 0.05},
			{16, 0.19}
		}
	}
	self.values.player.body_armor.deflect_overkill_290 = {
		level_1 = {
			{0, 0},
			{0, 0}
		},
		level_2 = {
			{0, 0.05},
			{4, 0}
		},
		level_3 = {
			{0, 0.1},
			{4.5, 0}
		},
		level_4 = {
			{0, 0.15},
			{5, 0}
		},
		level_5 = {
			{0, 0.25},
			{5.5, 0}
		},
		level_6 = {
			{0, 0.3},
			{6, 0}
		},
		level_7 = {
			{0, 0.35},
			{7, 0}
		},
		level_8 = {
			{0, 0.3},
			{6, 0}
		},
		level_9 = {
			{1, 0.5},
			{13, 0.1}
		},
		level_11 = {
			{0.5, 0.4},
			{7.5, 0.05}
		}
	}
end

function UpgradesTweakData:_init_pd2_values()
	init_pd2(self)

	self.values.player.hostage_health_regen_addend = {0.006, 0.02}
	self.skill_descs.black_marketeer.multibasic = "0.6%"
	self.skill_descs.black_marketeer.multipro = "2%"
	self.values.player.passive_health_regen = {0.02}

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
	self.values.player.body_armor.armor = { -- Level-independant armor values -- Old values
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
		9,
		5,
		7.5,
		0,
		16
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
		0.4,
		0.25,
		0.15,
		0.05,
		-0.2,
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
		0.2
	}
	self.values.player.body_armor.skill_ammo_mul = {
		1,
		1,
		1,
		1,
		1.333,
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
		5
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
		0.1,
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
	self.values.player.body_armor.power_type_reduction = {
		{

		},
		{

		},
		{

		},
		{

		},
		{

		},
		{

		},
		{
			--m14 = 1.1,
		},
		{

		},
		{
			m14 = 0.85,
			raging_bull = 0.8
		},
		{

		},
		{
			--[[m14 = 2,
			mp9 = 1.25,
			r870 = 1.35,
			saiga = 0.9,
			ak47 = 0.75,
			m4 = 1.5]]
		}
	}
	self.values.player.body_armor.doom_armor = {
		0,
		15,
		25,
		25,
		27.5,
		35,
		40,
		20,
		30,
		0,
		10
	}
	self.values.player.body_armor.doom_absorption = {
		0,
		0.1,
		0.15,
		0.2,
		0.25,
		0.4,
		0.5,
		0.3,
		0.25,
		0,
		0.75
	}
	--[[self.values.player.body_armor.doom_absorption = {
		{
			{0, 0}
		},
		{
			{12, 0.1},
			{10, 0.09},
			{8, 0.075},
			{6, 0.06},
			{4, 0.04},
			{2, 0.02}
		}
	}
	]]

	self:set_normal()
	self:set_hard()
	self:set_very_hard()
	self:set_overkill()
	self:set_deathwish()

	self.values.player.level_8_hp_regen_addend = {0.2}
	self.values.player.level_9_armor_regen_addend = {1}
	self.values.player.level_9_armor_regen_delay_multiplier = {0.8}
	self.values.player.level_9_deflect_chance_addend = {0.1}
	self.values.player.level_10_dodge_addend = {0.15}
	self.values.player.level_11_edr_addend = {0.15}
	self.values.player.level_11_hp_addend = {4}
	self.values.player.level_11_movement_addend = {6}
	self.values.player.level_11_stamina_multiplier = {3}
	self.values.player.headshot_add_max_armor_bonus = {
		{
			0.01,
			0.2,
			0.01
		},
		{
			0.03,
			1,
			0.05
		}
	}
	self.values.player.all_dodge_addend = {0.01}
	self.values.player.all_ammo_addend = {0.01}
	self.values.player.all_deflect_addend = {0.01}
	self.values.player.all_hdr_addend = {0.01}
	self.values.player.all_edr_addend = {0.01}
	self.values.player.all_jump_addend = {0.01}

	self.values.crew = {}
	self.values.crew.xp = {}
	self.values.crew.armor = {}
	self.values.crew.health = {}
	self.values.crew.deflect_chance = {}
	self.values.crew.xp.multiplier = {1.1}
	self.values.crew.armor.multiplier = {1.2}
	self.values.crew.health.multiplier = {1.2}
	self.values.crew.deflect_chance.addend = {0.1}
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
	self.definitions.body_armor11 = {
		category = "armor",
		armor_id = "level_12",
		name_id = "bm_armor_level_12"
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
	self.definitions.player_all_dodge_addend = {
		category = "feature",
		name_id = "menu_player_all_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "all_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_all_deflect_addend = {
		category = "feature",
		name_id = "menu_player_all_deflect_addend",
		upgrade = {
			category = "player",
			upgrade = "all_deflect_addend",
			value = 1
		}
	}
	self.definitions.player_all_ammo_addend = {
		category = "feature",
		name_id = "menu_player_all_ammo_addend",
		upgrade = {
			category = "player",
			upgrade = "all_ammo_addend",
			value = 1
		}
	}
	self.definitions.player_all_hdr_addend = {
		category = "feature",
		name_id = "menu_player_all_hdr_addend",
		upgrade = {
			category = "player",
			upgrade = "all_hdr_addend",
			value = 1
		}
	}
	self.definitions.player_all_edr_addend = {
		category = "feature",
		name_id = "menu_player_all_edr_addend",
		upgrade = {
			category = "player",
			upgrade = "all_edr_addend",
			value = 1
		}
	}
	self.definitions.player_all_jump_addend = {
		category = "feature",
		name_id = "menu_player_all_jump_addend",
		upgrade = {
			category = "player",
			upgrade = "all_jump_addend",
			value = 1
		}
	}
end
