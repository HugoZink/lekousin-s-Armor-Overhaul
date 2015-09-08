CustomArmor = CustomArmor or class()

--[[
	List of equipment parts
	All stats listed are cumulative with base ones
]]
CustomArmor.equipment = {
	head = {
		nothing = {name_id = "custom_nothing"},
		helmet_eod = {
			name_id = "custom_helmet_eod",
			level = 2,
			armor = 1,
			dodge = -0.3,
			movement = -0.075,
			damage_shake = -0.15,
			deflect_min_dmg = 0.1,
			deflect_min_value = 0.1,
			deflect_max_dmg = 0.5,
			deflect_max_value = 0.05,
			bleeding_reduction = 1
		}
	},
	neck = {
		nothing = {name_id = "custom_nothing"},
		small_neck = {
			name_id = "custom_small_neck",
			dodge = 0.05
		},
		neck_hbv = {
			name_id = "custom_neck_hbv",
			level = 1,
			armor = 0.4,
			movement = -0.075,
			dodge = -0.1,
			damage_shake = -0.07,
			regen = 0.2,
			deflect_min_value = 0.05,
			deflect_max_damage = 0.05,
			health_damage_reduction_min_value = 0.5,
			health_damage_reduction_max_dmg = -1,
			explosion_damage_reduction = 0.05,
			jump_speed_multiplier = -0.01,
			bleeding_reduction = 0.1
		},
		neck_lifa = {
			name_id = "custom_neck_lifa",
			level = 1,
			armor = 0.3,
			movement = -0.04,
			dodge = -0.05,
			damage_shake = -0.06,
			health_regen = 0.035,
			bleeding_reduction = 0.25
		}
	},
	chest = {
		nothing = {name_id = "custom_nothing"},
		two_piece_suit = {
			name_id = "custom_two_piece_suit",
			armor = 2,
			movement = 1,
			stamina = 1,
			dodge = 0.05,
			skill_ammo_mul = -0.25,
			regen = 2,
			jump_speed_multiplier = 1,
			bleeding_reduction = 1
		},
		chest_lbv = {
			name_id = "custom_chest_lbv",
			level = 1,
			armor = 2.4,
			movement = 0.975,
			stamina = 0.975,
			damage_shake = -0.04,
			regen = 2.15,
			deflect_min_value = 0.1,
			deflect_max_dmg = 2,
			health_damage_reduction_max_dmg = 10,
			health_damage_reduction_max_value = 0.05,
			explosion_damage_reduction = 0.02,
			jump_speed_multiplier = 1,
			bleeding_reduction = 1.1
		},
		chest_bv = {
			name_id = "custom_chest_bv",
			level = 2,
			armor = 2.8,
			movement = 0.925,
			stamina = 0.975,
			dodge = -0.05,
			damage_shake = -0.08,
			regen = 2.3,
			deflect_min_value = 0.2,
			deflect_max_dmg = 2.5,
			health_damage_reduction_max_dmg = 8.5,
			health_damage_reduction_max_value = 0.1,
			explosion_damage_reduction = 0.05,
			jump_speed_multiplier = 0.99,
			bleeding_reduction = 1.2
		},
		chest_fj = {
			name_id = "custom_chest_fj",
			level = 3,
			armor = 3.2,
			movement = 0.875,
			stamina = 0.975,
			dodge = -0.15,
			damage_shake = -0.1,
			skill_ammo_mul = 0.25,
			regen = 2.5,
			deflect_min_value = 0.25,
			deflect_max_dmg = 2.75,
			health_damage_reduction_min_value = 0.03,
			health_damage_reduction_max_dmg = 8,
			health_damage_reduction_max_value = 0.15,
			explosion_damage_reduction = 0.175,
			jump_speed_multiplier = 0.98,
			bleeding_reduction = 1.3
		},
		chest_ctv = {
			name_id = "custom_chest_ctv",
			level = 3,
			armor = 3.7,
			movement = 0.825,
			stamina = 0.975,
			dodge = -0.2,
			damage_shake = -0.15,
			regen = 2.65,
			deflect_min_value = 0.3,
			deflect_max_dmg = 3.25,
			health_damage_reduction_min_dmg = 0.5,
			health_damage_reduction_min_value = 0.08,
			health_damage_reduction_max_dmg = 7.5,
			health_damage_reduction_max_value = 0.15,
			explosion_damage_reduction = 0.125,
			jump_speed_multiplier = 0.98,
			bleeding_reduction = 1.45
		},
		chest_ltv = {
			name_id = "custom_chest_ltv",
			level = 3,
			armor = 3,
			movement = 0.93,
			stamina = 0.975,
			dodge = -0.1,
			damage_shake = -0.06,
			skill_ammo_mul = 0.4,
			deflect_min_dmg = 0.25,
			deflect_min_value = 0.1,
			deflect_max_dmg = 2,
			deflect_max_value = 0.05,
			bleeding_reduction = 1.25
		}
	},
	legs = {
		nothing = {name_id = "custom_nothing"},
		small_legs = {
			name_id = "custom_small_legs",
			dodge = 0.05
		},
		legs_ctv = {
			name_id = "custom_legs_ctv",
			level = 1,
			armor = 0.5,
			movement = -0.1,
			dodge = -0.05,
			damage_shake = -0.05,
			stamina = -0.15,
			regen = 0.1,
			health_damage_reduction_max_value = 0.025,
			jump_speed_multiplier = -0.02,
			bleeding_reduction = 0.1
		},
		legs_ictv = {
			name_id = "custom_legs_ictv",
			level = 2,
			armor = 2.25,
			movement = -0.15,
			dodge = -0.15,
			damage_shake = -0.15,
			stamina = -0.4,
			regen = 0.45,
			deflect_min_value = 0.05,
			deflect_max_dmg = 1,
			deflect_max_value = 0.05,
			health_damage_reduction_min_value = 0.05,
			health_damage_reduction_max_dmg = -1,
			health_damage_reduction_max_value = 0.1,
			explosion_damage_reduction = 0.075,
			jump_speed_multiplier = -0.04,
			bleeding_reduction = 0.25
		},
		legs_thin = {
			name_id = "custom_legs_thin"
		}
	},
	arms = {
		nothing = {name_id = "custom_nothing"},
		small_arms = {
			name_id = "custom_small_arms",
			dodge = 0.05
		},
		arms_fj = {
			name_id = "custom_arms_fj",
			level = 1,
			armor = 0.4,
			movement = -0.05,
			damage_shake = -0.03,
			regen = 0.03,
			deflect_min_value = 0.05,
			deflect_max_dmg = 0.25,
			health_damage_reduction_min_value = 0.02,
			health_damage_reduction_max_dmg = -0.5,
			health_damage_reduction_max_value = 0.025,
			explosion_damage_reduction = 0.075,
			jump_speed_multiplier = -0.01,
			bleeding_reduction = 0.1
		},
		arms_ictv = {
			name_id = "custom_arms_ictv",
			level = 2,
			armor = 1.65,
			movement = -0.2,
			damage_shake = -0.13,
			stamina = -0.05,
			regen = 0.43,
			deflect_min_value = 0.1,
			deflect_max_dmg = 1.25,
			deflect_max_value = 0.05,
			health_damage_reduction_min_dmg = 0.5,
			health_damage_reduction_min_value = 0.07,
			health_damage_reduction_max_dmg = -1.5,
			health_damage_reduction_max_value = 0.1,
			explosion_damage_reduction = 0.15,
			jump_speed_multiplier = -0.01,
			bleeding_reduction = 0.2
		}
	}
}

function CustomArmor:init()
	self._set = {
		head = CustomArmor.equipment.head.nothing, 
		neck = CustomArmor.equipment.neck.small_neck, 
		chest = CustomArmor.equipment.chest.two_piece_suit, 
		legs = CustomArmor.equipment.legs.small_legs, 
		arms = CustomArmor.equipment.arms.small_arms
	}
	self._skin_level = 1
end

function CustomArmor:calculate_level()
	local level = 1
	for i = 1, #self._set do
		if self._set[i].level then
			level = level + self._set[i].level
		end
	end
	self._skin_level = level < 7 and level or 7
end

function CustomArmor:calculate_stat(stat)
	local fixed = (stat == "skill_ammo_mul" or stat == "damage_shake") and 1 or 0
	local multiplier = 1
	for equipment, _ in pairs(self._set) do
		if self._set[equipment] and self._set[equipment][stat] then
			if type(self._set[equipment][stat]) == "table" and not self._set[equipment][stat][2] then
				multiplier = multiplier + self._set[equipment][stat][1]
			else
				fixed = fixed + (type(self._set[equipment][stat]) == "table" and self._set[equipment][stat][1] or self._set[equipment][stat])
			end
		end
	end
	return {fixed, multiplier}
end

function CustomArmor:change_equipment(type, new)
	if not CustomArmor.equipment[type] then return end
	if not CustomArmor.equipment[type][new] then LAOUtils.debug("no item matching this name for category " .. type .. ": " .. new .. "\n") end
	self._set[type] = CustomArmor.equipment[type][new] or self._set[type]
	self:calculate_level()
end

function CustomArmor:load()
	local list = {
		"head",
		"neck",
		"chest",
		"legs",
		"arms"
	}
	--[[local f = io and io.open(ArmorOverhaul.ROOT .. "saves/custom_armor.sav", "r")
	if f == nil then
		LAOUtils.print("Could not load custom armor")
	else
		for i = 1, #list do
			local line = f:read()
			LAOUtils.debug(list[i] .. ": " .. line .. "\n")
			self:change_equipment(list[i], line)
		end
		io.close(f)
		LAOUtils.debug("Custom armor loaded\n")
	end]]
end

function CustomArmor:save()
	local list = {
		"head",
		"neck",
		"chest",
		"legs",
		"arms"
	}
	--[[local f = io and io.open(ArmorOverhaul.ROOT .. "saves/custom_armor.sav", "w")
	if f == nil then
		LAOUtils.print("Could not save custom armor")
	else
		for i = 1, #list do
			f:write(string.sub(self._set[list[i]]--[[.name_id or "custom_nothing", 8) .. "\n")
		end
		io.close(f)
	end]]
end

Global._custom_armor =  CustomArmor:new()
Global._custom_armor:load()