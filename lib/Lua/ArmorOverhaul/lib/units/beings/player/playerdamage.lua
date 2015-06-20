local init_orig = PlayerDamage.init
local total_armor_orig = PlayerDamage._total_armor
local recover_health_orig = PlayerDamage.recover_health
if not fully_regened then fully_regened = 0 end

function PlayerDamage:init(unit)
	init_orig(self, unit)
	self._armor_reduction = {}
	for i = 0, 50 do
		table.insert(self._armor_reduction, 1 - (i / 100))
	end
	self._armor_speed = {}
	for i = 0, 50 do
		table.insert(self._armor_speed, 1 + (i / 500))
	end
	self._armor_reduction_index = 1
	self._bonus_armor = 0
end

function PlayerDamage:update(unit, t, dt)
	local is_berserker_active = managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier")
	if self._check_berserker_done then
		if not is_berserker_active then
			self._check_berserker_done = nil
			managers.hud:set_teammate_condition(HUDManager.PLAYER_PANEL, "mugshot_normal", "")
			managers.hud:set_player_custom_radial({
				current = 0,
				total = self:_max_health(),
				revives = Application:digest_value(self._revives, false)
			})
			self:set_health(0)
			self:_chk_cheat_death()
			self:_damage_screen()
			self:_check_bleed_out()
			managers.hud:set_player_health({
				current = self:get_real_health(),
				total = self:_max_health(),
				revives = Application:digest_value(self._revives, false)
			})
			self:_send_set_health()
			self:_set_health_effect()
		else
			local expire_time = managers.player:get_activate_temporary_expire_time("temporary", "berserker_damage_multiplier")
			local total_time = managers.player:upgrade_value("temporary", "berserker_damage_multiplier")
			total_time = total_time and total_time[2] or 0
			local delta = 0
			local max_health = self:_max_health()
			if total_time ~= 0 then
				delta = math.clamp((expire_time - Application:time()) / total_time, 0, 1)
			end
			managers.hud:set_player_custom_radial({
				current = delta * max_health,
				total = max_health,
				revives = Application:digest_value(self._revives, false)
			})
		end
	end
	if self._bleed_out_blocked_by_zipline and not self._unit:movement():zipline_unit() then
		self:_check_bleed_out()
		self._bleed_out_blocked_by_zipline = nil
	end
	
	local armor_data = managers.blackmarket:equipped_armor(true)
	if self.bleeding and self.bleeding > 0 then
		self.bleeding = self.bleeding - managers.player:body_armor_value("bleeding_reduction") * self:armor_ratio() * dt
	else
		self.bleeding = 0
	end
	if self._armor_suppress and self._armor_suppress > 0 then
		self._armor_suppress = self._armor_suppress - dt
	else
		self._armor_suppress = 0
	end

	if self._regenerate_timer and not self._dead and not self._bleed_out and not self._check_berserker_done then
		if not is_berserker_active and not self._bleed_out_blocked_by_zipline then
			self._regenerate_timer = self._regenerate_timer - dt
			local top_fade = math.clamp(self._hurt_value - 0.8, 0, 1) / 0.2
			local hurt = self._hurt_value - (1 - top_fade) * ((1 + math.sin(t * 500)) / 2) / 10
			managers.environment_controller:set_hurt_value(hurt)




			if self:get_real_armor() <= 0 then
				self._bonus_armor = 0
			end

			if not self._armor_suppress_MAX then
				self._armor_suppress_MAX = 10 * managers.player:body_armor_regen_multiplier(alive(self._unit) and self._unit:movement():current_state()._moving)
			end

			if 0 > self._regenerate_timer then
				--self:_regenerate_armor()


				-- Armor progressive regeneration


				if fully_regened ~= 1 then
					local regen = dt * managers.player:ap_regen_value(armor_data, self._armor_suppress / self._armor_suppress_MAX)
					self:restore_armor(regen)
					self._armor_regenerating = true
				else
					self._armor_regenerating = false
					fully_regened = 1
				end


				


			end
		end
	elseif self._hurt_value then
		if not self._dead and not self._bleed_out and not self._check_berserker_done then
			self._hurt_value = math.min(1, self._hurt_value + dt)
			local top_fade = math.clamp(self._hurt_value - 0.8, 0, 1) / 0.2
			local hurt = self._hurt_value - (1 - top_fade) * ((1 + math.sin(t * 500)) / 2) / 10
			managers.environment_controller:set_hurt_value(hurt)
			local armor_value = math.max(self._armor_value or 0, self._hurt_value)
			managers.hud:set_player_armor({
				current = self:get_real_armor() * armor_value,
				total = self:_total_armor(),
				max = self:_max_armor()
			})
			SoundDevice:set_rtpc("shield_status", self._hurt_value * 100)
			if 1 <= self._hurt_value then
				self._hurt_value = nil
				managers.environment_controller:set_hurt_value(1)
			end
		else
			local hurt = self._hurt_value - (1 + math.sin(t * 500)) / 2 / 10
			managers.environment_controller:set_hurt_value(hurt)
		end
	end
	if self._tinnitus_data then
		self._tinnitus_data.intensity = (self._tinnitus_data.end_t - t) / self._tinnitus_data.duration
		if 0 >= self._tinnitus_data.intensity then
			self:_stop_tinnitus()
		else
			SoundDevice:set_rtpc("downed_state_progression", math.max(self._downed_progression or 0, self._tinnitus_data.intensity * 100))
		end
	end
	if not self._downed_timer and self._downed_progression then
		self._downed_progression = math.max(0, self._downed_progression - dt * 50)
		managers.environment_controller:set_downed_value(self._downed_progression)
		SoundDevice:set_rtpc("downed_state_progression", self._downed_progression)
		if self._downed_progression == 0 then
			self._unit:sound():play("critical_state_heart_stop")
			self._downed_progression = nil
		end
	end
	if self._auto_revive_timer then
		if not managers.platform:presence() == "Playing" or not self._bleed_out or self._dead or self:incapacitated() or self:arrested() or self._check_berserker_done then
			self._auto_revive_timer = nil
		else
			self._auto_revive_timer = self._auto_revive_timer - dt
			if 0 >= self._auto_revive_timer then
				self:revive(true)
				self._unit:sound_source():post_event("nine_lives_skill")
				self._auto_revive_timer = nil
			end
		end
	end
	if self._revive_miss then
		self._revive_miss = self._revive_miss - dt
		if 0 >= self._revive_miss then
			self._revive_miss = nil
		end
	end
	self:_upd_suppression(t, dt)
	if not self._dead and not self._bleed_out and not self._check_berserker_done then
		self:_upd_health_regen(t, dt)

		local hp_regen = dt * managers.player:hp_regen_value(armor_data)
		hp_regen = hp_regen - (self.bleeding / 10) * dt
		self:restore_health(hp_regen, true)

	end
end

function PlayerDamage:damage_bullet(attack_data)
	if self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self._last_received_dmg = attack_data.damage



	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	local dmg_mul = managers.player:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered", 1) * managers.player:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered_strong", 1) * managers.player:temporary_upgrade_value("temporary", "dmg_dampener_close_contact", 1) * managers.player:upgrade_value("player", "damage_dampener", 1) * managers.player:temporary_upgrade_value("temporary", "first_aid_damage_reduction", 1) * managers.player:temporary_upgrade_value("temporary", "passive_revive_damage_reduction", 1)
	if self._unit:movement()._current_state and self._unit:movement()._current_state:_interacting() then
		dmg_mul = dmg_mul * managers.player:upgrade_value("player", "interacting_damage_multiplier", 1)
	end
	if CopDamage.is_gangster(attack_data.attacker_unit:base()._tweak_table) then
		dmg_mul = dmg_mul * managers.player:upgrade_value("player", "gangster_damage_dampener", 1)
	end
	attack_data.damage = attack_data.damage * dmg_mul


	-- Dodge mechanic changed to PoE Evasion's entropy mechanic (you force dodge <dodge_value * 0.1>% bullets; if you have 50 dodge, you'll force dodge one bullet every 20 one)

	if not self._dodge_entropy or (self._last_hit_time and managers.player:player_timer():time() - self._last_hit_time >= 6) then
		self._dodge_entropy = math.rand(1)
	end

	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = managers.player:body_armor_value("dodge")
	local skill_dodge_chance = managers.player:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = math.min(dodge_value + armor_dodge_chance + skill_dodge_chance, 0.95)

	self._dodge_entropy = self._dodge_entropy + 1 - (math.max(dodge_value, 0) * 0.1)
	Utils.print_log("entropy:\n\tdodge: " .. self._dodge_entropy .. " => " .. (self._dodge_entropy >= 1 and "hit" or "dodged") .. "\n")
	if self._dodge_entropy >= 1 then
		self._dodge_entropy = self._dodge_entropy - 1
	else
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.col_ray)
		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		self._last_hit_time = managers.player:player_timer():time()
		return
	end

	-- Original dodge, if entropy dodge didn't help you dodge

	local dodge_roll = math.rand(1)
	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = managers.player:body_armor_value("dodge")
	local skill_dodge_chance = managers.player:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance
	if dodge_roll < dodge_value then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.col_ray)
		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		return
	end


	-- Deflection check (if armor > 0), also uses PoE Evasion's entropy


	if self:get_real_armor() > 0 then
		if not self._armor_entropy or (self._last_hit_time and managers.player:player_timer():time() - self._last_hit_time >= 6) then
			self._armor_entropy = math.rand(1)
		end

		local deflect_chance = tweak_data.player.damage.DEFLECT_CHANCE_INIT or 0
		local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
		deflect_chance = deflect_chance + managers.player:upgrade_value("player", armor_data.upgrade_level .. "_deflect_chance_addend", 0)
		local armor_deflect = managers.player:body_armor_value("deflect")
		if attack_data.damage <= armor_deflect[1][1] then
			deflect_chance = deflect_chance + armor_deflect[1][2]
		elseif attack_data.damage >= armor_deflect[2][1] then
			deflect_chance = deflect_chance + armor_deflect[2][2]
		else
			local damage = (attack_data.damage - armor_deflect[1][1]) / (armor_deflect[2][1] - armor_deflect[1][1])
			deflect_chance = deflect_chance + (armor_deflect[2][2] - armor_deflect[1][2]) * damage + armor_deflect[1][2]
		end
		self._armor_entropy = self._armor_entropy + 1 - (deflect_chance * 0.1)
		Utils.print_log("entropy:\n\tarmor: " .. self._armor_entropy .. " => " .. (self._armor_entropy >= 1 and "hit" or "deflected") .. "\n")
		if self._armor_entropy >= 1 then
			self._armor_entropy = self._armor_entropy - 1
		else
			if attack_data.damage > 0 then
				self:_send_damage_drama(attack_data, 0)
			end
			self:_call_listeners(damage_info)
			self:play_whizby(attack_data.col_ray.position)
			self:_hit_direction(attack_data.col_ray)
			self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
			self._last_received_dmg = attack_data.damage
			self._last_hit_time = managers.player:player_timer():time()
			return
		end
	end

	-- Deflection check (if armor > 0), clasic system


	if self:get_real_armor() > 0 then
		local deflect_chance = tweak_data.player.damage.DEFLECT_CHANCE_INIT or 0
		local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
		deflect_chance = deflect_chance + managers.player:upgrade_value("player", armor_data.upgrade_level .. "_deflect_chance_addend", 0)
		local armor_deflect = managers.player:body_armor_value("deflect")
		if attack_data.damage <= armor_deflect[1][1] then
			deflect_chance = deflect_chance + armor_deflect[1][2]
		elseif attack_data.damage >= armor_deflect[2][1] then
			deflect_chance = deflect_chance + armor_deflect[2][2]
		else
			local damage = (attack_data.damage - armor_deflect[1][1]) / (armor_deflect[2][1] - armor_deflect[1][1])
			deflect_chance = deflect_chance + (armor_deflect[2][2] - armor_deflect[1][2]) * damage + armor_deflect[1][2]
		end
		if deflect_chance > math.rand(1) then
			if attack_data.damage > 0 then
				self:_send_damage_drama(attack_data, 0)
			end
			self:_call_listeners(damage_info)
			self:play_whizby(attack_data.col_ray.position)
			self:_hit_direction(attack_data.col_ray)
			self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
			self._last_received_dmg = attack_data.damage
			self._last_hit_time = managers.player:player_timer():time()
			return
		end
	end

	self._last_hit_time = managers.player:player_timer():time()


	if self._god_mode then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, attack_data.damage)
		end
		self:_call_listeners(damage_info)
		return
	elseif self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	elseif self._revive_miss and math.random() < self._revive_miss then
		self:play_whizby(attack_data.col_ray.position)
		return
	end
	if attack_data.attacker_unit:base()._tweak_table == "tank" then
		managers.achievment:set_script_data("dodge_this_fail", true)
	end
	if 0 < self:get_real_armor() then
		self._unit:sound():play("player_hit")
	else
		self._unit:sound():play("player_hit_permadamage")
	end
	local shake_armor_multiplier = managers.player:body_armor_value("damage_shake") * managers.player:upgrade_value("player", "damage_shake_multiplier", 1)
	local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
	gui_shake_number = gui_shake_number + managers.player:upgrade_value("player", "damage_shake_addend", 0)
	shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
	local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier
	self._unit:camera():play_shaker("player_bullet_damage", 1 * shake_multiplier)
	managers.rumble:play("damage_bullet")
	self:_hit_direction(attack_data.col_ray)
	managers.player:check_damage_carry(attack_data)
	if self._bleed_out then
		self:_bleed_out_damage(attack_data)
		return
	end
	if not self:is_suppressed() then
		return
	end
	local armor_reduction_multiplier = 0
	if 0 >= self:get_real_armor() then
		armor_reduction_multiplier = 1
	end


	local potential_damage = attack_data.damage


	local health_subtracted = self:_calc_armor_damage(attack_data)
	if attack_data.armor_piercing then
		attack_data.damage = attack_data.damage - health_subtracted
	else
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
	end
	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)
	managers.player:activate_temporary_upgrade("temporary", "wolverine_health_regen")
	self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
	--self._last_received_dmg = potential_damage	--health_subtracted
												-- Fixes the HDR bug causing health bar to be depleted too quickly, due to HDR fucking up damage values
	if not self._bleed_out and health_subtracted > 0 then
		self:_send_damage_drama(attack_data, health_subtracted)
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "tank" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())
		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + tweak_data.timespeed.downed.fade_in + tweak_data.timespeed.downed.sustain + tweak_data.timespeed.downed.fade_out)
	end
	self:_call_listeners(damage_info)
end

function PlayerDamage:_calc_armor_damage(attack_data)
	local health_subtracted = 0
	local old_armor = self:get_real_armor()
	if 0 < self:get_real_armor() then
		health_subtracted = self:get_real_armor()
		self:set_armor(self:get_real_armor() - attack_data.damage)
		health_subtracted = health_subtracted - self:get_real_armor()
		self:_damage_screen()
		managers.hud:set_player_armor({
			current = self:get_real_armor(),
			total = self:_total_armor(),
			max = self:_max_armor()
		})
		SoundDevice:set_rtpc("shield_status", self:get_real_armor() / self:_total_armor() * 100)
		self:_send_set_armor()
		if 0 >= self:get_real_armor() then
			self._unit:sound():play("player_armor_gone_stinger")
			if attack_data.armor_piercing then
				self._unit:sound():play("player_sniper_hit_armor_gone")
			end
		end
		fully_regened = 0
	end

	if old_armor > 0 and self:get_real_armor() <= 0 then
		self:armor_break()
	end

	return health_subtracted
end

function PlayerDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()


	local hdr = 0
	local armor_deflect = managers.player:body_armor_value("health_damage_reduction")
	if attack_data.damage <= armor_deflect[1][1] then
		hdr = hdr + armor_deflect[1][2]
	elseif attack_data.damage >= armor_deflect[2][1] then
		hdr = hdr + armor_deflect[2][2]
	else
		local damage = (attack_data.damage - armor_deflect[1][1]) / (armor_deflect[2][1] - armor_deflect[1][1])
		hdr = hdr + (armor_deflect[2][2] - armor_deflect[1][2]) * damage + armor_deflect[1][2]
	end
	attack_data.damage = attack_data.damage * (1 - hdr)


	self:change_health(-attack_data.damage)
	health_subtracted = health_subtracted - self:get_real_health()
	local bullet_or_explosion_or_melee = attack_data.variant and (attack_data.variant == "bullet" or attack_data.variant == "explosion") or attack_data.variant == "melee"
	if self:get_real_health() == 0 and bullet_or_explosion_or_melee then
		self:_chk_cheat_death()
	end
	self:_damage_screen()
	self:_check_bleed_out(bullet_or_explosion_or_melee)
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false),
		bleeding = self.bleeding > 0
	})
	self:_send_set_health()
	self:_set_health_effect()
	managers.statistics:health_subtracted(health_subtracted)

	if attack_data.damage >= 10 then
		self.bleeding = math.rand(1) < 0.5 and 10 or self.bleeding
	else
		local chance = attack_data.damage / 20
		local value = attack_data.damage / 2
		local roll = math.rand(1)
		if roll < chance then
			self.bleeding = value
			managers.hud:show_hint( { text = "Bleeding", time = 1.5 --[[SECONDS]] } )
		end
	end
	return health_subtracted
end

function PlayerDamage:damage_explosion(attack_data)
	local damage_info = {
		result = {type = "hurt", variant = "explosion"}
	}
	if self._god_mode or self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	end
	local distance = mvector3.distance(attack_data.position, self._unit:position())
	if distance > attack_data.range then
		return
	end
	local damage = (attack_data.damage or 1) * (1 - distance / attack_data.range)
	if self._bleed_out then
		return
	end
	local dmg_mul = managers.player:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered", 1) * managers.player:temporary_upgrade_value("temporary", "dmg_dampener_outnumbered_strong", 1) * managers.player:temporary_upgrade_value("temporary", "dmg_dampener_close_contact", 1) * managers.player:upgrade_value("player", "damage_dampener", 1) * managers.player:temporary_upgrade_value("temporary", "first_aid_damage_reduction", 1) * managers.player:temporary_upgrade_value("temporary", "passive_revive_damage_reduction", 1)
	if self._unit:movement()._current_state and self._unit:movement()._current_state:_interacting() then
		dmg_mul = dmg_mul * managers.player:upgrade_value("player", "interacting_damage_multiplier", 1)
	end


	dmg_mul = dmg_mul * managers.player:explosion_damage_multiplier()


	attack_data.damage = damage * dmg_mul
	local armor_subtracted = self:_calc_armor_damage(attack_data)
	attack_data.damage = attack_data.damage - (armor_subtracted or 0)
	local health_subtracted = self:_calc_health_damage(attack_data)
	self:_call_listeners(damage_info)
end

damage_fall_orig = PlayerDamage.damage_fall

function PlayerDamage:damage_fall(data)
	self.fully_regened = 0
	return damage_fall_orig(self, data)
end

function PlayerDamage:_max_health()
	local base_max_health = self._HEALTH_INIT + managers.player:thick_skin_value() + managers.player:body_armor_value("hp_addend") + managers.player:upgrade_value("player", tostring(managers.blackmarket:equipped_armor(true)) .. "_hp_addend", 0)
	local mul = managers.player:health_skill_multiplier()
	return base_max_health * mul

end

function PlayerDamage:_upd_suppression(t, dt)
	local data = self._supperssion_data
	if data.value then
		if t > data.decay_start_t then
			data.value = data.value - dt
			if data.value <= 0 then
				data.value = nil
				data.decay_start_t = nil
				managers.environment_controller:set_suppression_value(0, 0)
			end
		elseif data.value == tweak_data.player.suppression.max_value and self._regenerate_timer then
			if not self._armor_regenerating then
				self:set_regenerate_timer_to_max()
			else
				if not self._armor_suppress_MAX then
					self._armor_suppress_MAX = 10 * managers.player:body_armor_regen_multiplier(alive(self._unit) and self._unit:movement():current_state()._moving)
				end
				self._armor_suppress = self._armor_suppress_MAX
			end
		end
		if data.value then
			managers.environment_controller:set_suppression_value(self:effective_suppression_ratio(), self:suppression_ratio())
		end
	end
end

function PlayerDamage:_total_armor()
	local base_max_armor = total_armor_orig(self)
	local mul = (self._armor_reduction and self._armor_reduction[math.min(self._armor_reduction_index, #self._armor_reduction)] or 1)
	return base_max_armor * mul + (self._bonus_armor and self._bonus_armor or 0)
end

function PlayerDamage:change_bonus_armor(value)
	if not self._bonus_armor then
		self._bonus_armor = 0
	end
	if value <= 0 then return end
	local old_bonus = self._bonus_armor
	self._bonus_armor = self._bonus_armor + value
	self:restore_armor(value * self:armor_ratio())
	managers.hud:show_hint( { text = self:_total_armor() .. " armor", time = 0.5 --[[SECONDS]] } )
end

function PlayerDamage:armor_break()
	self._bonus_armor = 0
	self._armor_reduction_index = self._armor_reduction_index + 1
	managers.hud:show_hint( { text = self:_total_armor() .. " armor", time = 0.5 --[[SECONDS]] } )
end

function PlayerDamage:armor_speed_multiplier()
	return self._armor_speed[math.min(self._armor_reduction_index, #self._armor_speed)] or 1
end

function PlayerDamage:armor_ratio()
	local ratio = self:get_real_armor() / self:_max_armor()
	ratio = ratio > 0 and ratio or 0
	if ratio < 1 then
		self.fully_regened = 0
	end
	return ratio
end

function PlayerDamage:armor_bonus()
	return self._bonus_armor
end

function PlayerDamage:get_bleeding()
	return self.bleeding or 0
end

function PlayerDamage:reset_bleeding()
	self.bleeding = 0
end

function PlayerDamage:recover_health()
	recover_health_orig(self)
	self:reset_bleeding()
end

function PlayerDamage:restore_armor(armor_restored)
	if self._dead or self._bleed_out or self._check_berserker_done then
		return
	end
	local max_armor = self:_max_armor()
	local armor = self:get_real_armor()
	local new_armor = math.min(armor + armor_restored, max_armor)
	self:set_armor(new_armor)
	self:_send_set_armor()
	if self._unit:sound() and new_armor ~= armor and new_armor == max_armor then
		self._unit:sound():play("shield_full_indicator")
		fully_regened = 1
	end
	managers.hud:set_player_armor({
		current = self:get_real_armor(),
		total = self:_total_armor(),
		max = max_armor,
		no_hint = true
	})
end