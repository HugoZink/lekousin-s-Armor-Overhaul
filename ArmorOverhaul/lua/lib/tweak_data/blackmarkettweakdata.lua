Hooks:PostHook(BlackMarketTweakData, "_init_armors", "armoroverhaul_init_armors_bmtweak", function(self)
	self.armors.level_8 = {}
	self.armors.level_8.name_id = "bm_armor_level_8"
	self.armors.level_8.sequence = "var_model_06"
	self.armors.level_8.upgrade_level = 8
	self.armors.level_9 = {}
	self.armors.level_9.name_id = "bm_armor_level_9"
	self.armors.level_9.sequence = "var_model_06"
	self.armors.level_9.upgrade_level = 9
	self.armors.level_10 = {}
	self.armors.level_10.name_id = "bm_armor_level_10"
	self.armors.level_10.sequence = "var_model_01"
	self.armors.level_10.upgrade_level = 10
	self.armors.level_11 = {}
	self.armors.level_11.name_id = "bm_armor_level_11"
	self.armors.level_11.sequence = "var_model_07"
	self.armors.level_11.upgrade_level = 11
	self:_add_desc_from_name_macro(self.armors)
end)