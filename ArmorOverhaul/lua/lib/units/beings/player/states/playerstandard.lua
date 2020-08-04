-- This jump stuff probably just breaks heists like Undercover and Brooklyn 10-10 now.

--[[
local max_speed_orig = PlayerStandard._get_max_walk_speed

function PlayerStandard:_check_action_jump(t, input)
	local new_action
	local action_wanted = input.btn_jump_press
	if action_wanted then
		local action_forbidden = self._jump_t and t < self._jump_t + 0.05
		action_forbidden = action_forbidden or self._unit:base():stats_screen_visible() or self._state_data.in_air or self:_interacting() or self:_on_zipline() or self:_does_deploying_limit_movement()
		if not action_forbidden then
			if self._state_data.ducking then
				self:_interupt_action_ducking(t)
			else
				if self._state_data.on_ladder then
					self:_interupt_action_ladder(t)
				end
				local action_start_data = {}
				local jump_vel_z = tweak_data.player.movement_state.standard.movement.jump_velocity.z
				jump_vel_z = jump_vel_z * self:jump_speed_multiplier()
				action_start_data.jump_vel_z = jump_vel_z
				if self._move_dir then
					local is_running = self._running and self._unit:movement():is_above_stamina_threshold() and t - self._start_running_t > 0.4
					local jump_vel_xy = tweak_data.player.movement_state.standard.movement.jump_velocity.xy[is_running and "run" or "walk"]
					action_start_data.jump_vel_xy = jump_vel_xy
					if is_running then
						self._unit:movement():subtract_stamina(tweak_data.player.movement_state.stamina.JUMP_STAMINA_DRAIN)
					end
				end
				new_action = self:_start_action_jump(t, action_start_data)
			end
		end
	end
	return new_action
end

function PlayerStandard:jump_speed_multiplier()
	local mul = 1
	mul = mul * managers.player:body_armor_value("jump_speed_multiplier", nil, 1)
	return mul
end

function PlayerStandard:_get_max_walk_speed(t)
	local movement_speed = max_speed_orig(self, t)
	local multiplier = self._ext_damage:armor_speed_multiplier()
	return movement_speed * multiplier
end
]]
