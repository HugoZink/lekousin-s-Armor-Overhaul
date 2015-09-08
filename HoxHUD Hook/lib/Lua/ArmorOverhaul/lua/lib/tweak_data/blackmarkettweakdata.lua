function BlackMarketTweakData:_init_armors()
	self.armors = {}
	self.armors.level_1 = {}
	self.armors.level_1.name_id = "bm_armor_level_1"
	self.armors.level_1.sequence = "var_model_01"
	self.armors.level_1.upgrade_level = 1
	self.armors.level_2 = {}
	self.armors.level_2.name_id = "bm_armor_level_2"
	self.armors.level_2.sequence = "var_model_02"
	self.armors.level_2.upgrade_level = 2
	self.armors.level_3 = {}
	self.armors.level_3.name_id = "bm_armor_level_3"
	self.armors.level_3.sequence = "var_model_03"
	self.armors.level_3.upgrade_level = 3
	self.armors.level_4 = {}
	self.armors.level_4.name_id = "bm_armor_level_4"
	self.armors.level_4.sequence = "var_model_04"
	self.armors.level_4.upgrade_level = 4
	self.armors.level_5 = {}
	self.armors.level_5.name_id = "bm_armor_level_5"
	self.armors.level_5.sequence = "var_model_05"
	self.armors.level_5.upgrade_level = 5
	self.armors.level_6 = {}
	self.armors.level_6.name_id = "bm_armor_level_6"
	self.armors.level_6.sequence = "var_model_06"
	self.armors.level_6.upgrade_level = 6
	self.armors.level_7 = {}
	self.armors.level_7.name_id = "bm_armor_level_7"
	self.armors.level_7.sequence = "var_model_07"
	self.armors.level_7.upgrade_level = 7
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
	--[[self.armors.level_12 = {}
	self.armors.level_12.name_id = "bm_armor_level_12"
	self.armors.level_12.sequence = "var_model_07"
	self.armors.level_12.upgrade_level = -1]]
	if not ArmorOverhaul.options.localize then
		self.armors.level_8.name_id = "Lifa Vest"
		self.armors.level_9.name_id = "Lightweight Tactical Vest"
		self.armors.level_10.name_id = "Thin Suit"
		self.armors.level_11.name_id = "EOD Suit"
	end
	self:_add_desc_from_name_macro(self.armors)
end