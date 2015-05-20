function PlayerManager:body_armor_regen_multiplier(moving)
	local multiplier = 1
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
	multiplier = multiplier * self:upgrade_value("player", armor_data.upgrade_level .. "_armor_regen_delay_multiplier", 1)
	multiplier = multiplier * self:upgrade_value("player", "armor_regen_timer_multiplier_tier", 1)
	multiplier = multiplier * self:upgrade_value("player", "armor_regen_timer_multiplier", 1)
	multiplier = multiplier * self:upgrade_value("player", "armor_regen_timer_multiplier_passive", 1)
	multiplier = multiplier * self:team_upgrade_value("armor", "regen_time_multiplier", 1)
	multiplier = multiplier * self:team_upgrade_value("armor", "passive_regen_time_multiplier", 1)
	multiplier = multiplier * self:upgrade_value("player", "perk_armor_regen_timer_multiplier", 1)
	if not moving then
		multiplier = multiplier * managers.player:upgrade_value("player", "armor_regen_timer_stand_still_multiplier", 1)
	end
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
	local armor_penalty = self:mod_movement_penalty(self:body_armor_value("movement", upgrade_level, 1)) + (managers.player:upgrade_value("player", (upgrade_level and ("level_" .. upgrade_level) or tostring(managers.blackmarket:equipped_armor(true))) .. "_movement_addend", 0)) / (tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 10)
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

function PlayerManager:stamina_multiplier(upgrade_level)
	local multiplier = 1
	multiplier = multiplier + self:upgrade_value("player", "stamina_multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("stamina", "multiplier", 1) - 1
	multiplier = multiplier + self:team_upgrade_value("stamina", "passive_multiplier", 1) - 1
	multiplier = multiplier + self:get_hostage_bonus_multiplier("stamina") - 1
	multiplier = multiplier + self:upgrade_value("player", (upgrade_level and ("level_" .. upgrade_level) or tostring(managers.blackmarket:equipped_armor(true))) .. "_stamina_multiplier", 1) - 1
	return multiplier
end

function PlayerManager:ap_regen_value(armor_data, suppression)
	local suppression_mul = 1 - suppression
	suppression_mul = 1 - ((1 - suppression_mul) * self:upgrade_value("player", "suppression_armor_regen_multiplier", 1))
	local value = tweak_data.player.damage.AP_REGEN_INIT or 0
	value = value + managers.player:body_armor_value("regen")
	value = value + managers.player:upgrade_value("player", tostring(armor_data or managers.blackmarket:equipped_armor(true)) .. "_armor_regen_addend", 0)
	value = value * suppression_mul
	return value
end

function PlayerManager:hp_regen_value(armor_data)
	local value = tweak_data.player.damage.HP_REGEN_INIT or 0
	value = value + managers.player:body_armor_value("hp_regen")
	value = value + managers.player:upgrade_value("player", tostring(armor_data or managers.blackmarket:equipped_armor(true)) .. "_hp_regen_addend", 0)
	return value
end