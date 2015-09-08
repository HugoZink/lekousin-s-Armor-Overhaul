local armor_regen_orig = PlayerManager.body_armor_regen_multiplier
local stamina_orig = PlayerManager.stamina_multiplier
local movement_penalty_orig = PlayerManager.mod_movement_penalty
local setup_orig = PlayerManager._setup
local exp_orig = PlayerManager.get_skill_exp_multiplier
local health_mul_orig = PlayerManager.health_skill_multiplier
    function table_print(tt, done)
        local file = io.stdout--io.open("TableDump.txt", "a+")
        done = done or {}
        if type(tt) == "table" then
            for key, value in pairs(tt) do
                if type(value) == "table" and not done[value] then
                    done[value] = true
                    -- Console(string.format("<%s> => table", tostring(key)))
                    file:write("<"..tostring(key).."> => table\n")
                    table_print(value, done)
                else
                    -- Console(string.format("[%s] => %s", tostring(key), tostring(value)))
                    file:write("["..tostring(key).."] => "..tostring(value).."\n")
                end
            end
        else 
            -- Console(tt) 
            file:write(tostring(tt).."\n")
        end
        --file:close()
    end

function PlayerManager:_setup()
	setup_orig(self)
	self._global.crew_bonuses = {}
	self._global.synced_crew_bonuses = {}
	if LAOUtils.file_exists(ArmorOverhaul.ROOT .. "saves/crew_bonus.sav") then
		local f = io.open(ArmorOverhaul.ROOT .. "saves/crew_bonus.sav", "r")
		self:aquire_crew_bonus(tweak_data.upgrades.definitions["crew_" .. f:read()])
		f:close()
	end
end

function PlayerManager:aquire_crew_bonus(upgrade)
	self._global.crew_bonuses[upgrade.category] = self._global.crew_bonuses[upgrade.category] or {}
	self._global.crew_bonuses[upgrade.category][upgrade.upgrade] = upgrade.value
end

function PlayerManager:unaquire_crew_bonus(upgrade)
	if not self._global.crew_bonuses[upgrade.category] then
		Application:error("[PlayerManager:unaquire_crew_bonus] Can't unaquire crew upgrade of category", upgrade.category)
		return
	end
	if not self._global.crew_bonuses[upgrade.category][upgrade.upgrade] then
		Application:error("[PlayerManager:unaquire_crew_bonus] Can't unaquire crew upgrade", upgrade.upgrade)
		return
	end
	local val = self._global.crew_bonuses[upgrade.category][upgrade.upgrade]
	val = val - 1
	self._global.crew_bonuses[upgrade.category][upgrade.upgrade] = val > 0 and val or nil
end

function PlayerManager:empty_crew_bonuses()
	self._global.crew_bonuses = {}
end

function PlayerManager:crew_bonus_value(category, upgrade, default)
	for peer_id, categories in pairs(self._global.synced_crew_bonuses) do
		if categories[category] and categories[category][upgrade] then
			local level = categories[category][upgrade]
			return tweak_data.upgrades.values.crew[category][upgrade][level]
		end
	end
	return default or 0
end

function PlayerManager:has_crew_category_bonus(category, upgrade)
	for peer_id, categories in pairs(self._global.synced_team_upgrades) do
		if categories[category] and categories[category][upgrade] then
			return true
		end
	end
	return false
end

function PlayerManager:update_crew_bonuses_to_peers()
	for category, upgrades in pairs(self._global.crew_bonuses) do
		for upgrade, level in pairs(upgrades) do
			managers.network:session():send_to_peers_synched("add_synced_crew_bonus", category, upgrade, level)
		end
	end
end

function PlayerManager:update_crew_bonuses_to_peer(peer)
	for category, upgrades in pairs(self._global.crew_bonuses) do
		for upgrade, level in pairs(upgrades) do
			peer:send_queued_sync("add_synced_crew_bonus", category, upgrade, level)
		end
	end
end

function PlayerManager:add_synced_crew_bonus(peer_id, category, upgrade, level)
	self._global.synced_crew_bonuses[peer_id] = self._global.synced_crew_bonuses[peer_id] or {}
	self._global.synced_crew_bonuses[peer_id][category] = self._global.synced_crew_bonuses[peer_id][category] or {}
	self._global.synced_crew_bonuses[peer_id][category][upgrade] = level
end

function PlayerManager:get_skill_exp_multiplier(whisper_mode)
	local multiplier = exp_orig(self, whisper_mode)

	multiplier = multiplier + self:crew_bonus_value("xp", "multiplier", 1) - 1

	return multiplier
end

function PlayerManager:body_armor_regen_multiplier(moving)
	local multiplier = armor_regen_orig(self, moving)
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
	multiplier = multiplier * self:upgrade_value("player", armor_data.upgrade_level .. "_armor_regen_delay_multiplier", 1)
	return multiplier
end

function PlayerManager:explosion_damage_multiplier()
	local mul = 1
	mul = mul - managers.player:body_armor_value("explosion_damage_reduction")
	mul = mul - managers.player:upgrade_value("player", tostring(managers.blackmarket:equipped_armor(true)) .. "_edr_addend", 0)
	return mul
end

function PlayerManager:movement_speed_multiplier(speed_state, bonus_multiplier, upgrade_level)
	local multiplier = 1
	local armor_level_s = (upgrade_level and ("level_" .. upgrade_level) or tostring(managers.blackmarket:equipped_armor(true)))
	local armor_level = armor_level_s:sub(7)
	local armor_penalty = self:mod_movement_penalty(self:body_armor_value("movement", upgrade_level, 1), upgrade_level) + (managers.player:upgrade_value("player", armor_level_s .. "_movement_addend", 0)) / (tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 10)
	multiplier = multiplier + armor_penalty - 1
	if bonus_multiplier then
		multiplier = multiplier + bonus_multiplier - 1
	end
	if speed_state then
		multiplier = multiplier + self:upgrade_value("player", speed_state .. "_speed_multiplier", 1) - 1
	end
	multiplier = multiplier + self:get_hostage_bonus_multiplier("speed") - 1
	multiplier = multiplier + self:upgrade_value("player", "movement_speed_multiplier", 1) - 1
	if self:num_local_minions() > 0 then
		multiplier = multiplier + self:upgrade_value("player", "minion_master_speed_multiplier", 1) - 1
	end
	if self:has_category_upgrade("player", "secured_bags_speed_multiplier") then
		local bags = 0
		bags = bags + (managers.loot:get_secured_mandatory_bags_amount() or 0)
		bags = bags + (managers.loot:get_secured_bonus_bags_amount() or 0)
		multiplier = multiplier + bags * (self:upgrade_value("player", "secured_bags_speed_multiplier", 1) - 1)
	end
	if managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") then
		multiplier = multiplier * (tweak_data.upgrades.berserker_movement_speed_multiplier or 1)
	end
	return multiplier
end

function PlayerManager:health_skill_multiplier()
	local multiplier = health_mul_orig(self)

	multiplier = multiplier + self:crew_bonus_value("health", "multiplier", 1) - 1

	return multiplier
end

function PlayerManager:stamina_multiplier(upgrade_level)
	local multiplier = stamina_orig(self, upgrade_level)
	multiplier = multiplier + self:upgrade_value("player", (upgrade_level and ("level_" .. upgrade_level) or tostring(managers.blackmarket:equipped_armor(true))) .. "_stamina_multiplier", 1) - 1
	return multiplier
end

function PlayerManager:ap_regen_value(armor_data, suppression)
	local suppression_mul = 1 - suppression
	suppression_mul = 1 - ((1 - suppression_mul) * self:upgrade_value("player", "suppression_armor_regen_multiplier", 1))
	local value = tweak_data.player.damage.AP_REGEN_INIT or 0
	value = value + managers.player:body_armor_value("regen")
	value = value + managers.player:upgrade_value("player", tostring(armor_data or managers.blackmarket:equipped_armor(true)) .. "_armor_regen_addend", 0)
	if suppression > 0 then
		value = value * managers.player:body_armor_value("ap_regen_suppressed_max_multiplier")
	end
	value = value * suppression_mul
	return value
end

function PlayerManager:hp_regen_value(armor_data)
	local value = tweak_data.player.damage.HP_REGEN_INIT or 0
	value = value + managers.player:body_armor_value("hp_regen")
	value = value + managers.player:upgrade_value("player", tostring(armor_data or managers.blackmarket:equipped_armor(true)) .. "_hp_regen_addend", 0)
	return value
end

function PlayerManager:mod_movement_penalty(movement_penalty, upgrade_level)
	if upgrade_level and upgrade_level == 11 then
		return movement_penalty
	end
	return movement_penalty_orig(self, movement_penalty, upgrade_level)
end

function PlayerManager:on_headshot_dealt()
	local player_unit = self:player_unit()
	if not player_unit then
		return
	end
	local t = Application:time()
	if self._on_headshot_dealt_t and t < self._on_headshot_dealt_t then
		return
	end
	self._on_headshot_dealt_t = t + (tweak_data.upgrades.on_headshot_dealt_cooldown or 0)
	local damage_ext = player_unit:character_damage()
	local regen_armor_bonus = managers.player:upgrade_value("player", "headshot_regen_armor_bonus", 0)
	if damage_ext then
		local old_max = damage_ext:_max_armor()
		local upgrade = managers.player:upgrade_value("player", "headshot_add_max_armor_bonus", {0, 0})
		local value = math.min(upgrade[1] * (damage_ext:_max_armor() - damage_ext:armor_bonus()), upgrade[2])
		damage_ext:change_bonus_armor(value)
		if regen_armor_bonus > 0 then
			damage_ext:restore_armor(regen_armor_bonus)
		end
	end
end

function PlayerManager:body_armor_value(category, override_value, default)
	Global._custom_armor = Global._custom_armor or CustomArmor:new()
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
	local difficulty = Global.game_settings.difficulty
	local difficulty_multiplier = tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty] and (tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty][category] or 1) or 1
	if override_value == -1 or (not override_value and armor_data.upgrade_level == -1) then
		--[[if category == "health_damage_reduction" then
			local t = {
				{0, 0},
				{0, 0}
			}
			t[1][1] = Global.custom_armor[Global.custom_armor.index][category .. "_min_dmg"] * (Global.custom_armor.stats[category .. "_min_dmg"] and Global.custom_armor.stats[category .. "_min_dmg"] or 1)
			t[1][2] = Global.custom_armor[Global.custom_armor.index][category .. "_min_value"] * (Global.custom_armor.stats[category .. "_min_value"] and Global.custom_armor.stats[category .. "_min_value"] or 1)
			t[2][1] = Global.custom_armor[Global.custom_armor.index][category .. "_max_dmg"] * (Global.custom_armor.stats[category .. "_max_dmg"] and Global.custom_armor.stats[category .. "_max_dmg"] or 1)
			t[2][2] = Global.custom_armor[Global.custom_armor.index][category .. "_max_value"] * (Global.custom_armor.stats[category .. "_max_value"] and Global.custom_armor.stats[category .. "_max_value"] or 1)
			return t
		elseif category == "deflect" then
			local t = {
				{0, 0},
				{0, 0}
			}
			t[1][1] = Global.custom_armor[Global.custom_armor.index][category .. "_min_dmg"] * (Global.custom_armor.stats[category .. "_min_dmg"] and Global.custom_armor.stats[category .. "_min_dmg"] or 1)
			t[1][2] = Global.custom_armor[Global.custom_armor.index][category .. "_min_value"] * (Global.custom_armor.stats[category .. "_min_value"] and Global.custom_armor.stats[category .. "_min_value"] or 1)
			t[2][1] = 10 - (Global.custom_armor[Global.custom_armor.index][category .. "_max_dmg"] * (Global.custom_armor.stats[category .. "_max_dmg"] and Global.custom_armor.stats[category .. "_max_dmg"] or 1))
			t[2][2] = Global.custom_armor[Global.custom_armor.index][category .. "_max_value"] * (Global.custom_armor.stats[category .. "_max_value"] and Global.custom_armor.stats[category .. "_max_value"] or 1)
			return t
		elseif category == "concealment" then
			return Global.custom_armor.stats.concealment[Global.custom_armor[Global.custom_armor.index][category]]
		--[[else
			local value = Global.custom_armor[Global.custom_armor.index][category]
			if category == "movement" then
				value = value / 35
			elseif category == "stamina" then
				value = value / 20
			elseif category == "damage_shake" then
				value = 1 - value
			--elseif category == "jump_speed_multiplier" then
			--	value = 0.75 + value
			elseif category == "regen" then
				value = value + 1
			end
			return value
		end
		return Global.custom_armor[Global.custom_armor.index][category]]
		if category == "health_damage_reduction" or category == "deflect" then
			local t = {
				{0, 0},
				{0, 0}
			}
			local tmp = Global._custom_armor:calculate_stat(category .. "_min_dmg")
			t[1][1] = tmp[1] * tmp[2] * difficulty_multiplier
			tmp = Global._custom_armor:calculate_stat(category .. "_min_value")
			t[1][2] = tmp[1] * tmp[2]
			tmp = Global._custom_armor:calculate_stat(category .. "_max_dmg")
			t[2][1] = tmp[1] * tmp[2] * difficulty_multiplier
			tmp = Global._custom_armor:calculate_stat(category .. "_max_value")
			t[1][2] = tmp[1] * tmp[2]
			return t
		else
			local values = Global._custom_armor:calculate_stat(category)
			return values[1] * values[2] * difficulty_multiplier
		end
	end
	if tweak_data.upgrades.values.player.body_armor[category .. "_" .. difficulty] and tweak_data.upgrades.values.player.body_armor[category .. "_" .. difficulty]["level_" .. (override_value or armor_data.upgrade_level)] then
		return tweak_data.upgrades.values.player.body_armor[category .. "_" .. difficulty]["level_" .. (override_value or armor_data.upgrade_level)]
	end
	local value = self:upgrade_value_by_level("player", "body_armor", category, {})[override_value or armor_data.upgrade_level] or default or 0
	local orig_value = type(value) == "table" and (type(value[1]) == "table" and value or {{0, 0},{0, 0}}) or {{0, 0},{0, 0}}
	if tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty] and tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty][category] then
		if category == "health_damage_reduction" or category == "deflect" then
			value = {}
			for i = 1, 2 do
				value[i] = {}
				for j = 1, 2 do
					value[i][j] = orig_value[i][j] * tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty][category]
				end
			end
		--[[elseif category == "armor" then
			value = 0--tweak_data.upgrades.values.player.body_armor[category .. "_" .. difficulty].level_1
			for i = 1, (override_value or armor_data.upgrade_level) do
				value = value + (self:upgrade_value_by_level("player", "body_armor", category, {})[i] or default or 0) * tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty].armor
				log("armor at level " .. i .. ": " .. value)
			end]]
		else
			value = value * tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty][category]
			if category == "ap_regen_suppressed_max_multiplier" then
				value = math.min(value, 1)
			end
		end
	end
	return value
end