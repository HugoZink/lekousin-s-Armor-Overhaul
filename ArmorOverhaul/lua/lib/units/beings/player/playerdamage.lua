dofile(ModPath .. "armoroverhaulcore.lua")

Hooks:PostHook(PlayerDamage, "init", "armoroverhaul_playerdmg_init", function(self, unit)
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
	--[[
	managers.hud:update_armor_overhaul_values({
		current_health = self:get_real_health(),
		total_health = self:_max_health(),
		current_armor = self:get_real_armor(),
		total_armor = self:_max_armor(),
		bleeding = self:get_bleeding()
	})
	]]
end)

--[[
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
	managers.hud:update_armor_overhaul_values({
		current_health = self:get_real_health(),
		total_health = self:_max_health(),
		current_armor = self:get_real_armor(),
		total_armor = self:_max_armor(),
		bleeding = self:get_bleeding()
	})
end
]]

--[[
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
		self.bleeding = self.bleeding - (managers.player:body_armor_value("bleeding_reduction") * self:armor_ratio() + 1) * dt
	else
		self.bleeding = 0
		managers.hud:set_player_health({
			current = self:get_real_health(),
			total = self:_max_health(),
			revives = Application:digest_value(self._revives, false),
			bleeding = false
		})
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


				if self.fully_regened ~= 1 then
					local regen = dt * managers.player:ap_regen_value(armor_data, self._armor_suppress / self._armor_suppress_MAX)
					self:restore_armor(regen)
					self._armor_regenerating = true
				else
					self._armor_regenerating = false
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
		managers.hud:set_player_health({
			current = self:get_real_health(),
			total = self:_max_health(),
			revives = Application:digest_value(self._revives, false)
		})

	end

	if self._dead or self._bleed_out then
		self.Bleeding = 0
	end

	managers.hud:update_armor_overhaul_values({
		current_health = self:get_real_health(),
		total_health = self:_max_health(),
		current_armor = self:get_real_armor(),
		total_armor = self:_max_armor(),
		bleeding = self:get_bleeding()
	})
end
]]

-- Oh boy, the big one
--[[
function PlayerDamage:damage_bullet(attack_data)
	if self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self._last_received_dmg = attack_data.damage

	local moving = self._unit:movement():current_state()._moving


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


	-- Dodge mechanic changed to PoE Evasion's entropy mechanic (you force dodge <dodge_value * 0.2>% bullets; if you have 50 dodge, you'll force dodge one bullet every 20 one)

	if not self._dodge_entropy or (self._last_hit_time and managers.player:player_timer():time() - self._last_hit_time >= 10) then
		self._dodge_entropy = math.rand(1)
	end

	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = managers.player:body_armor_value("dodge")
	local skill_dodge_chance = managers.player:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = math.min((dodge_value + armor_dodge_chance + skill_dodge_chance) * (moving and 1 or 0.35), 0.95)

	-- Original dodge

	local dodge_roll = math.rand(1)
	--local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = managers.player:body_armor_value("dodge")
	local skill_dodge_chance = managers.player:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	--dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance
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

	self._dodge_entropy = self._dodge_entropy + 1 - (math.min(math.max(dodge_value + armor_dodge_chance + skill_dodge_chance, 0) * 0.2, 0.5))
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


	-- Deflection check (if armor > 0), clasic system


	local deflect_chance = tweak_data.player.damage.DEFLECT_CHANCE_INIT or 0
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
	deflect_chance = deflect_chance + managers.player:upgrade_value("player", "level_" .. armor_data.upgrade_level .. "_deflect_chance_addend", 0)
	local armor_deflect = managers.player:body_armor_value("deflect")
	if attack_data.damage <= armor_deflect[1][1] then
		deflect_chance = deflect_chance + armor_deflect[1][2]
	elseif attack_data.damage >= armor_deflect[2][1] then
		deflect_chance = deflect_chance + armor_deflect[2][2]
	else
		local damage = (attack_data.damage - armor_deflect[1][1]) / (armor_deflect[2][1] - armor_deflect[1][1])
		deflect_chance = deflect_chance + (armor_deflect[2][2] - armor_deflect[1][2]) * damage + armor_deflect[1][2]
	end
	if deflect_chance * (self:get_real_armor() > 0 and 1 or 0.4) > math.rand(1) then
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

	-- Deflection check (if armor > 0), also uses PoE Evasion's entropy


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
	self._armor_entropy = self._armor_entropy + 1 - (deflect_chance * 0.2 * (self:get_real_armor() > 0 and 1 or 0.4))
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

	managers.hud:update_armor_overhaul_values({
		current_health = self:get_real_health(),
		total_health = self:_max_health(),
		current_armor = self:get_real_armor(),
		total_armor = self:_max_armor(),
		bleeding = self:get_bleeding()
	})
end
]]

-- Instead of hijacking the whole update function, it turns out that _update_regenerate_timer is the part we actually want to change.
-- As a bonus, it even allows us to tell whether our armor is currently fully regenerated
-- Also maintains Anarchist compatibility
function PlayerDamage:_update_regenerate_timer(t, dt)
	-- Suppression slows regeneration
	if self._armor_suppress and self._armor_suppress > 0 then
		self._armor_suppress = self._armor_suppress - dt
	else
		self._armor_suppress = 0
	end

	if not self._armor_suppress_MAX then
		self._armor_suppress_MAX = 10 * managers.player:body_armor_regen_multiplier(alive(self._unit) and self._unit:movement():current_state()._moving)
	end

	-- If the player was hit in the past 3 seconds, do not regenerate any armor
	local cur_time = managers.player:player_timer():time()
	if self._last_hit_time and (cur_time - self._last_hit_time) < (ArmorOverhaul.tweak.armor_regeneration_delay_s) then
		return
	end

	local regen = dt * managers.player:ap_regen_value(armor_data, self._armor_suppress / self._armor_suppress_MAX)
	self:restore_armor(regen)
end

function PlayerDamage:damage_bullet(attack_data)
	if not self:_chk_can_take_dmg() then
		return
	end

	local damage_info = {
		result = {
			variant = "bullet",
			type = "hurt"
		},
		attacker_unit = attack_data.attacker_unit
	}
	local pm = managers.player
	local dmg_mul = pm:damage_reduction_skill_multiplier("bullet")
	attack_data.damage = attack_data.damage * dmg_mul
	attack_data.damage = managers.mutators:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage)
	attack_data.damage = managers.modifiers:modify_value("PlayerDamage:TakeDamageBullet", attack_data.damage, attack_data.attacker_unit:base()._tweak_table)

	if _G.IS_VR then
		local distance = mvector3.distance(self._unit:position(), attack_data.attacker_unit:position())

		if tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
			local step = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2], 0, 1)
			local mul = 1 - math.step(tweak_data.vr.long_range_damage_reduction[1], tweak_data.vr.long_range_damage_reduction[2], step)
			attack_data.damage = attack_data.damage * mul
		end
	end

	local damage_absorption = pm:damage_absorption()

	if damage_absorption > 0 then
		attack_data.damage = math.max(0, attack_data.damage - damage_absorption)
	end

	if self._god_mode then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, attack_data.damage)
		end

		self:_call_listeners(damage_info)

		return
	elseif self._invulnerable or self._mission_damage_blockers.invulnerable then
		self:_call_listeners(damage_info)

		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	elseif self._unit:movement():current_state().immortal then
		return
	elseif self._revive_miss and math.random() < self._revive_miss then
		self:play_whizby(attack_data.col_ray.position)

		return
	end

	self._last_received_dmg = attack_data.damage
	self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
	self._last_hit_time = managers.player:player_timer():time()

	-- Dodge mechanic changed to PoE Evasion's entropy mechanic (you force dodge <dodge_value * 0.2>% bullets; if you have 50 dodge, you'll force dodge one bullet every 20 one)
	if not self._dodge_entropy or (self._last_hit_time and managers.player:player_timer():time() - self._last_hit_time >= 10) then
		self._dodge_entropy = math.rand(1)
	end

	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = managers.player:body_armor_value("dodge")
	local skill_dodge_chance = managers.player:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = math.min((dodge_value + armor_dodge_chance + skill_dodge_chance) * (moving and 1 or ArmorOverhaul.tweak.standstill_dodge_mult), ArmorOverhaul.tweak.max_dodge_chance)

	local dodge_roll = math.random()
	-- Vanilla dodge code
	--[[
	local dodge_value = tweak_data.player.damage.DODGE_INIT or 0
	local armor_dodge_chance = pm:body_armor_value("dodge")
	local skill_dodge_chance = pm:skill_dodge_chance(self._unit:movement():running(), self._unit:movement():crouching(), self._unit:movement():zipline_unit())
	dodge_value = dodge_value + armor_dodge_chance + skill_dodge_chance
	]]

	if self._temporary_dodge_t and TimerManager:game():time() < self._temporary_dodge_t then
		dodge_value = dodge_value + self._temporary_dodge
	end

	local smoke_dodge = 0

	for _, smoke_screen in ipairs(managers.player._smoke_screen_effects or {}) do
		if smoke_screen:is_in_smoke(self._unit) then
			smoke_dodge = tweak_data.projectiles.smoke_screen_grenade.dodge_chance
			break
		end
	end

	dodge_value = 1 - (1 - dodge_value) * (1 - smoke_dodge)

	if dodge_roll < dodge_value then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end

		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())

		self._next_allowed_dmg_t = Application:digest_value(pm:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		self._last_hit_time = managers.player:player_timer():time()

		managers.player:send_message(Message.OnPlayerDodge)

		return
	end

	-- If we got this far, the attack was not dodged normally. Calculate dodge entropy and perhaps dodge anyway.
	self._dodge_entropy = self._dodge_entropy + 1 - (math.min(math.max(dodge_value + armor_dodge_chance + skill_dodge_chance, 0) * 0.2, 0.5))
	if self._dodge_entropy >= 1 then
		self._dodge_entropy = self._dodge_entropy - 1
	else
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end

		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())

		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		self._last_hit_time = managers.player:player_timer():time()

		managers.player:send_message(Message.OnPlayerDodge)

		return
	end

	-- Deflection check (if armor > 0), clasic system
	local deflect_chance = tweak_data.player.damage.DEFLECT_CHANCE_INIT or 0
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true)]
	deflect_chance = deflect_chance + managers.player:upgrade_value("player", "level_" .. armor_data.upgrade_level .. "_deflect_chance_addend", 0)
	local armor_deflect = managers.player:body_armor_value("deflect")
	if attack_data.damage <= armor_deflect[1][1] then
		deflect_chance = deflect_chance + armor_deflect[1][2]
	elseif attack_data.damage >= armor_deflect[2][1] then
		deflect_chance = deflect_chance + armor_deflect[2][2]
	else
		local damage = (attack_data.damage - armor_deflect[1][1]) / (armor_deflect[2][1] - armor_deflect[1][1])
		deflect_chance = deflect_chance + (armor_deflect[2][2] - armor_deflect[1][2]) * damage + armor_deflect[1][2]
	end

	if deflect_chance * (self:get_real_armor() > 0 and 1 or 0.4) > math.rand(1) then
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())
		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		self._last_hit_time = managers.player:player_timer():time()
		return
	end

	-- Entropy deflection check (if armor > 0), also uses PoE Evasion's entropy
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
	self._armor_entropy = self._armor_entropy + 1 - (deflect_chance * 0.2 * (self:get_real_armor() > 0 and 1 or 0.4))
	if self._armor_entropy >= 1 then
		self._armor_entropy = self._armor_entropy - 1
	else
		if attack_data.damage > 0 then
			self:_send_damage_drama(attack_data, 0)
		end
		self:_call_listeners(damage_info)
		self:play_whizby(attack_data.col_ray.position)
		self:_hit_direction(attack_data.attacker_unit:position())

		self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)
		self._last_received_dmg = attack_data.damage
		self._last_hit_time = managers.player:player_timer():time()

		return
	end

	if attack_data.attacker_unit:base()._tweak_table == "tank" then
		managers.achievment:set_script_data("dodge_this_fail", true)
	end

	if self:get_real_armor() > 0 then
		self._unit:sound():play("player_hit")
	else
		self._unit:sound():play("player_hit_permadamage")
	end

	local shake_armor_multiplier = pm:body_armor_value("damage_shake") * pm:upgrade_value("player", "damage_shake_multiplier", 1)
	local gui_shake_number = tweak_data.gui.armor_damage_shake_base / shake_armor_multiplier
	gui_shake_number = gui_shake_number + pm:upgrade_value("player", "damage_shake_addend", 0)
	shake_armor_multiplier = tweak_data.gui.armor_damage_shake_base / gui_shake_number
	local shake_multiplier = math.clamp(attack_data.damage, 0.2, 2) * shake_armor_multiplier

	self._unit:camera():play_shaker("player_bullet_damage", 1 * shake_multiplier)

	if not _G.IS_VR then
		managers.rumble:play("damage_bullet")
	end

	self:_hit_direction(attack_data.attacker_unit:position())
	pm:check_damage_carry(attack_data)

	attack_data.damage = managers.player:modify_value("damage_taken", attack_data.damage, attack_data)

	if self._bleed_out then
		self:_bleed_out_damage(attack_data)
		return
	end

	if not attack_data.ignore_suppression and not self:is_suppressed() then
		return
	end

	self:_check_chico_heal(attack_data)

	local armor_reduction_multiplier = 0

	if self:get_real_armor() <= 0 then
		armor_reduction_multiplier = 1
	end

	local health_subtracted = self:_calc_armor_damage(attack_data)

	-- Is this even still used?
	managers.player:activate_temporary_upgrade("temporary", "wolverine_health_regen")
	
	-- Armor Overhaul has this here for some reason, is this still necessary?
	-- self._next_allowed_dmg_t = Application:digest_value(managers.player:player_timer():time() + self._dmg_interval, true)

	if attack_data.armor_piercing then
		attack_data.damage = attack_data.damage - health_subtracted
	else
		attack_data.damage = attack_data.damage * armor_reduction_multiplier
	end

	health_subtracted = health_subtracted + self:_calc_health_damage(attack_data)

	if not self._bleed_out and health_subtracted > 0 then
		self:_send_damage_drama(attack_data, health_subtracted)
	elseif self._bleed_out and attack_data.attacker_unit and attack_data.attacker_unit:alive() and attack_data.attacker_unit:base()._tweak_table == "tank" then
		self._kill_taunt_clbk_id = "kill_taunt" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._kill_taunt_clbk_id, callback(self, self, "clbk_kill_taunt", attack_data), TimerManager:game():time() + tweak_data.timespeed.downed.fade_in + tweak_data.timespeed.downed.sustain + tweak_data.timespeed.downed.fade_out)
	end

	pm:send_message(Message.OnPlayerDamage, nil, attack_data)
	self:_call_listeners(damage_info)
end

-- Reset the last hit time on fire, fall or "simple" damage
local function update_hit_time(self)
	self._last_hit_time = managers.player:player_timer():time()
end
Hooks:PostHook(PlayerDamage, "damage_melee", "armoroverhaul_damagemelee_updatelasthittime", update_hit_time)
Hooks:PostHook(PlayerDamage, "damage_simple", "armoroverhaul_damagesimple_updatelasthittime", update_hit_time)
Hooks:PostHook(PlayerDamage, "damage_fire", "armoroverhaul_damagefire_updatelasthittime", update_hit_time)
Hooks:PostHook(PlayerDamage, "damage_killzone", "armoroverhaul_damagekillzone_updatelasthittime", update_hit_time)

function PlayerDamage:_calc_armor_damage(attack_data)
	local health_subtracted = 0
	local old_armor = self:get_real_armor()
	if 0 < self:get_real_armor() then
		health_subtracted = self:get_real_armor() > attack_data.damage and attack_data.damage or self:get_real_armor()
		self:set_armor(self:get_real_armor() - attack_data.damage)
		--health_subtracted = health_subtracted - self:get_real_armor()
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

			local pm = managers.player

			self:_start_regen_on_the_side(pm:upgrade_value("player", "passive_always_regen_armor", 0))

			if pm:has_inactivate_temporary_upgrade("temporary", "armor_break_invulnerable") then
				pm:activate_temporary_upgrade("temporary", "armor_break_invulnerable")

				self._can_take_dmg_timer = pm:temporary_upgrade_value("temporary", "armor_break_invulnerable", 0)
			end

		end
		self.fully_regened = 0
	end

	if old_armor > 0 and self:get_real_armor() <= 0 then
		self:armor_break()
	end

	return health_subtracted
end

-- Modified to not enter bleedout/swansong if you still have armor
-- Can also apply bleeding
function PlayerDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()

	self:change_health(-attack_data.damage)

	health_subtracted = health_subtracted - self:get_real_health()
	local trigger_skills = table.contains({
		"bullet",
		"explosion",
		"melee",
		"delayed_tick"
	}, attack_data.variant)

	-- Only check swansong with empty armor
	if self:get_real_health() == 0 and trigger_skills and self:get_real_armor() <= 0 then
		self:_chk_cheat_death()
	end

	self:_damage_screen()

	-- Only bleedout with empty armor
	if self:get_real_armor() <= 0 then
		self:_check_bleed_out(trigger_skills)
	end

	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	managers.statistics:health_subtracted(health_subtracted)

	-- Check bleeding
	if attack_data.damage >= ArmorOverhaul.tweak.health_dmg_bleed_threshold then
		self.bleeding = math.rand(1) < 0.5 and 20 or self.bleeding
	else
		local chance = attack_data.damage / ArmorOverhaul.tweak.health_dmg_bleed_threshold
		local value = attack_data.damage * 2

		-- Bleed value may not be higher than the max tweak value
		if value > ArmorOverhaul.tweak.health_dmg_max_bleed_value then
			value = ArmorOverhaul.tweak.health_dmg_max_bleed_value
		end

		local roll = math.rand(1)
		if roll < chance then
			self.bleeding = value
		end
	end
	if self:get_real_health() <= 0 then
		self.bleeding = 0
	end

	return health_subtracted
end

-- PlayerDamage:damage_explosion is longer necessary, the only changed line (applying explosion damage reduction) was moved to the far cleaner PlayerManager:damage_reduction_skill_multiplier

--[[
local damage_fall_orig = PlayerDamage.damage_fall
function PlayerDamage:damage_fall(data)
	self.fully_regened = 0
	local damage_info = {
		result = {type = "hurt", variant = "fall"}
	}
	if self._god_mode or self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	end
	local height_limit = 400--300
	local death_limit = 800--631
	if height_limit > data.height then
		return
	end
	local die = death_limit < data.height
	self._unit:sound():play("player_hit")
	managers.environment_controller:hit_feedback_down()
	managers.hud:on_hit_direction("down")
	if self._bleed_out then
		return
	end
	local health_damage_multiplier = 0
	if die then
		self._check_berserker_done = false
		self:set_health(0)
	else
		health_damage_multiplier = managers.player:upgrade_value("player", "fall_damage_multiplier", 1) * managers.player:upgrade_value("player", "fall_health_damage_multiplier", 1)
		health_damage_multiplier = health_damage_multiplier * (data.height - height_limit) / (death_limit - height_limit)
		self:change_health(-(tweak_data.player.fall_health_damage * health_damage_multiplier))
	end
	if die or health_damage_multiplier > 0 then
		local alert_rad = tweak_data.player.fall_damage_alert_size or 500
		local new_alert = {
			"vo_cbt",
			self._unit:movement():m_head_pos(),
			alert_rad,
			self._unit:movement():SO_access(),
			self._unit
		}
		managers.groupai:state():propagate_alert(new_alert)
	end
	local max_armor = self:_max_armor()
	if die then
		self:set_armor(0)
	else
		self:set_armor(self:get_real_armor() - max_armor * managers.player:upgrade_value("player", "fall_damage_multiplier", 1))
	end
	managers.hud:set_player_armor({
		current = self:get_real_armor(),
		total = self:_total_armor(),
		max = max_armor,
		no_hint = true
	})
	SoundDevice:set_rtpc("shield_status", 0)
	self:_send_set_armor()
	managers.hud:set_player_health({
		current = self:get_real_health(),
		total = self:_max_health(),
		revives = Application:digest_value(self._revives, false)
	})
	self:_send_set_health()
	self:_set_health_effect()
	self:_damage_screen()
	self:_check_bleed_out()
	self:_call_listeners(damage_info)
	return true
	--return damage_fall_orig(self, data)
end
]]

local max_health_orig = PlayerDamage._max_health
function PlayerDamage:_max_health()
	-- Per-difficulty health multiplier
	--[[
	local difficulty = Global.game_settings.difficulty
	local hp_addend_mul = tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty] and (tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty].hp_addend or 1) or 1
	local base_max_health = self._HEALTH_INIT + managers.player:thick_skin_value() + managers.player:body_armor_value("hp_addend") + (managers.player:upgrade_value("player", tostring(managers.blackmarket:equipped_armor(true)) .. "_hp_addend", 0) * hp_addend_mul)
	local mul = managers.player:health_skill_multiplier()
	return base_max_health * mul
	]]

	local health = max_health_orig(self)

	health = health + managers.player:body_armor_value("hp_addend") + (managers.player:upgrade_value("player", tostring(managers.blackmarket:equipped_armor(true)) .. "_hp_addend", 0))

	return health
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
	--local base_max_armor = total_armor_orig(self)-- Commented because of a calculation error (haven't Dled new sources); if mul != 1 then base_max_armor decreases by twice (1 - mul)
	local base_max_armor = self._ARMOR_INIT + managers.player:body_armor_value("armor") + managers.player:body_armor_skill_addend()
	local mul = managers.player:body_armor_skill_multiplier()
	base_max_armor = base_max_armor * mul
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
end

function PlayerDamage:armor_break()
	self._bonus_armor = 0
	self._armor_reduction_index = self._armor_reduction_index + 1
	self._regenerating_from_break = true
end

function PlayerDamage:armor_speed_multiplier()
	return self._armor_speed[math.min(self._armor_reduction_index, #self._armor_speed)] or 1
end

--[[
function PlayerDamage:armor_ratio()
	local ratio = self:_max_armor() > 0 and self:get_real_armor() / self:_max_armor() or 1
	ratio = ratio > 0 and ratio or 0
	if ratio < 1 then
		self.fully_regened = 0
	end
	return ratio
end
]]

function PlayerDamage:armor_bonus()
	return self._bonus_armor
end

function PlayerDamage:get_bleeding()
	return self.bleeding or 0
end

function PlayerDamage:reset_bleeding()
	self.bleeding = 0
end

Hooks:PostHook(PlayerDamage, "recover_health", "armoroverhaul_recoverhealth_stopbleeding", function(self)
	self:reset_bleeding()
end)


-- Largely unneeded anymore, sets fully_regened variable and updates the HUD.
--[[
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
		self.fully_regened = 1
	end
	managers.hud:set_player_armor({
		current = self:get_real_armor(),
		total = self:_total_armor(),
		max = max_armor,
		no_hint = true
	})
end
]]

-- Instead we can now check if self._current_state is nil, which is what we do to halt the armor regeneration updater once armor is full
Hooks:PostHook(PlayerDamage, "restore_armor", "armoroverhaul_armorrestored_haltupdate", function(self, armor_restored)
	if self:armor_ratio() >= 1 then
		self._current_state = nil
		if self._unit:sound() then
			self._unit:sound():play("shield_full_indicator")
		end
	end
end)

-- Update armor health regen
Hooks:PostHook(PlayerDamage, "_upd_health_regen", "armoroverhaul_update_armor_health_regen", function(self, t, dt)
	if self:armor_ratio() >= 1 then
		local hp_regen = managers.player:body_armor_value("bleeding_reduction") * dt * 0.03
		if hp_regen > 0 then
			self:restore_health(hp_regen, true)
		end
	end
end)
