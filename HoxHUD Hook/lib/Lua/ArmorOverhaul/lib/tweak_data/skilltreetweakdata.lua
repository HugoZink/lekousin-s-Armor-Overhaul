init_orig = SkillTreeTweakData.init

function SkillTreeTweakData:init()
	init_orig(self)
	self.skills.stockholm_syndrome = {
		["name_id"] = "menu_stockholm_syndrome",
		["desc_id"] = "menu_stockholm_syndrome_desc",
		["icon_xy"] = {3, 8},
		[1] = {
			upgrades = {
				"body_armor7"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_level_8_hp_regen_addend"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.tough_guy = {
		["name_id"] = "menu_tough_guy",
		["desc_id"] = "menu_tough_guy_desc",
		["icon_xy"] = {1, 1},
		[1] = {
			upgrades = {
				--"player_damage_shake_multiplier",
				"body_armor6"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				--"player_bleed_out_health_multiplier",
				"player_shield_knock",
				"player_run_and_shoot"
			},
			cost = self.costs.pro
		}
	}
	self.skills.juggernaut = {
		["name_id"] = "menu_juggernaut",
		["desc_id"] = "menu_juggernaut_desc",
		["icon_xy"] = {3, 1},
		[1] = {
			upgrades = {
				"body_armor10"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_level_11_edr_addend",
				"player_level_11_hp_addend",
				"player_level_11_movement_addend",
				"player_level_11_stamina_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.sentry_targeting_package = {
		["name_id"] = "menu_sentry_targeting_package",
		["desc_id"] = "menu_sentry_targeting_package_desc",
		["icon_xy"] = {1, 6},
		[1] = {
			upgrades = {
				"body_armor8"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_level_9_armor_regen_addend",
				"player_level_9_armor_regen_delay_multiplier",
				"player_level_9_deflect_chance_addend"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.sentry_2_0 = {
		["name_id"] = "menu_sentry_2_0",
		["desc_id"] = "menu_sentry_2_0_desc",
		["icon_xy"] = {5, 6},
		["prerequisites"] = {"sentry_gun"},
		[1] = {
			upgrades = {
				"sentry_gun_can_reload",
				"sentry_gun_spread_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"sentry_gun_shield",
				"sentry_gun_rot_speed_multiplier",
				"sentry_gun_extra_ammo_multiplier_1"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.moving_target = {
		["name_id"] = "menu_moving_target",
		["desc_id"] = "menu_moving_target_desc",
		["icon_xy"] = {2, 4},
		[1] = {
			upgrades = {
				"body_armor9",
				"player_can_strafe_run"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_level_10_dodge_addend",
				"player_can_free_run"
			},
			cost = self.costs.hightierpro
		}
	}
	self.trees[1].tiers[4] = {
		"kilmer",
		"medic_2x",
		"joker"
	}
	self.trees[1].tiers[5] = {
		"black_marketeer",
		"gun_fighter",
		"control_freak"
	}
	self.trees[1].tiers[6] = {
		"stockholm_syndrome",
		"pistol_messiah",
		"inspire"
	}
	self.trees[3].tiers[4] = {
		"mag_plus",
		"blast_radius",
		"silent_drilling"
	}
	self.trees[3].tiers[5] = {
		"sentry_2_0",
		"shaped_charge",
		"insulation"
	}
	self.trees[3].tiers[6] = {
		"sentry_gun_2x",
		"sentry_targeting_package",
		"iron_man"
	}
end