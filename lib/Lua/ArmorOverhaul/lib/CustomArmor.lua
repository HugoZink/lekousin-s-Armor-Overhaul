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
			deflect_min_chance = 0.1,
			deflect_max_dmg = 0.5,
			deflect_max_chance = 0.05
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
			movement = -0.05,
			dodge = -0.05,
			damage_shake = -0.07
		},
		neck_lifa = {
			name_id = "custom_neck_lia",
			level = 1,
			armor = 0.3,
			movement = -0.04,
			dodge = -0.05,
			damage_shake = -0.06,
			health_regen = 0.035
		}
	},
	chest = {
		nothing = {name_id = "custom_nothing"},
		two_piece_suit = {
			name_id = "custom_two_piece_suit",
			armor = 2,
			skill_ammo_mul = -0.25,
			regen = 2
		},
		chest_lbv = {
			name_id = "custom_chest_lbv",
			level = 1,
			armor = 2.4,
			movement = -0.025,
			dodge = -0.05,
			damage_shake = -0.04
		},
		chest_bv = {
			name_id = "custom_chest_bv",
			level = 2,
			armor = 2.8,
			movement = -0.075,
			dodge = -0.1,
			damage_shake = -0.08
		},
		chest_fj = {
			name_id = "custom_chest_bv",
			level = 3,
			armor = 2.8,
			movement = -0.075,
			dodge = -0.1,
			damage_shake = -0.08,
			skill_ammo_mul = 0.25
		},
		chest_ltv = {
			name_id = "custom_chest_ltv",
			level = 3,
			armor = 3,
			movement = -0.07,
			dodge = -0.1,
			damage_shake = -0.06,
			skill_ammo_mul = 0.4,
			deflect_min_dmg = 0.025,
			deflect_min_chance = 0.1,
			deflect_max_dmg = 2,
			deflect_max_chance = 0.05
		}
	},
	legs = {
		nothing = {name_id = "custom_nothing"},
		small_legs = {
			name_id = "custom_small_legs",
			movement = 1,
			dodge = 0.1
		},
		legs_ctv = {
			name_id = "custom_legs_ctv",
			level = 1,
			armor = 1,
			movement = 0.725,
			dodge = -0.1,
			damage_shake = -0.1
		},
		legs_ictv = {
			name_id = "custom_legs_ictv",
			level = 2,
			armor = 2.5,
			movement = 0.625,
			dodge = -0.2,
			damage_shake = -0.2
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
			armor = 0.8,
			movement = -0.05,
			dodge = -0.1,
			damage_shake = -0.05
		},
		arms_ictv = {
			name_id = "custom_arms_ictv",
			level = 2,
			armor = 2.3,
			movement = -0.1,
			dodge = -0.15,
			damage_shake = -0.15
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
	if not CustomArmor.equipment[type][new] then io.stdout:write("no item matching this name for category " .. type .. ": " .. new .. "\n") end
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
	local f = io and io.open("lib/Lua/ArmorOverhaul/saves/custom_armor.sav", "r")
	if f == nil then
		io.close(f)
	else
		for i = 1, #list do
			local line = f:read()
			io.stdout:write(list[i] .. ": " .. line .. "\n")
			self:change_equipment(list[i], line)
		end
		io.close(f)
		io.stdout:write("Custom armor loaded\n")
	end
end

function CustomArmor:save()
	local list = {
		"head",
		"neck",
		"chest",
		"legs",
		"arms"
	}
	local f = io and io.open("lib/Lua/ArmorOverhaul/saves/custom_armor.sav", "w")
	if f == nil then
		io.close(f)
	else
		for i = 1, #list do
			f:write(string.sub(self._set[list[i]].name_id or "custom_nothing", 8) .. "\n")
		end
		io.close(f)
	end
end