init_orig = PlayerTweakData.init
set_normal = PlayerTweakData._set_normal
set_hard = PlayerTweakData._set_hard
set_very_hard = PlayerTweakData._set_overkill
set_overkill = PlayerTweakData._set_overkill_145
set_deathwish = PlayerTweakData._set_overkill_290

function PlayerTweakData:_set_normal()
	set_normal(self)
	self.damage.HEALTH_INIT = 20
	self.fall_health_damage = 5
	self.damage.MIN_DAMAGE_INTERVAL = 0
end

function PlayerTweakData:_set_hard()
	set_hard(self)
	self.damage.HEALTH_INIT = 20
	self.fall_health_damage = 6
	self.damage.MIN_DAMAGE_INTERVAL = 0
end

function PlayerTweakData:_set_overkill()
	set_very_hard(self)
	self.damage.HEALTH_INIT = 22.5
	self.fall_health_damage = 7
	self.damage.MIN_DAMAGE_INTERVAL = 0
end

function PlayerTweakData:_set_overkill_145()
	set_overkill(self)
	self.damage.HEALTH_INIT = 25
	self.fall_health_damage = 10
	self.damage.MIN_DAMAGE_INTERVAL = 0
end

function PlayerTweakData:_set_overkill_290()
	set_deathwish(self)
	self.damage.HEALTH_INIT = 30
	self.fall_health_damage = 20
	self.damage.MIN_DAMAGE_INTERVAL = 0
end

--[[function PlayerTweakData:init()
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.arrest = {arrest_timeout = 240, aggression_timeout = 60}
	self.put_on_mask_time = 2
	self.damage = {}
	if is_console then
		self.damage.ARMOR_INIT = 5
	else
		self.damage.ARMOR_INIT = 2
	end
	self.damage.DODGE_INIT = 0
	self.damage.HEALTH_REGEN = 0
	self.damage.ARMOR_STEPS = 1
	self.damage.ARMOR_DAMAGE_REDUCTION = 0
	self.damage.ARMOR_DAMAGE_REDUCTION_STEPS = {
		1,
		0.6,
		0.7,
		0.8,
		0.9,
		0.95,
		0.96,
		0.97,
		0.98,
		0.99
	}
	self.damage.HEALTH_INIT = 30--23
	self.damage.LIVES_INIT = 4
	if is_console then
		self.damage.REGENERATE_TIME = 2.35
	else
		self.damage.REGENERATE_TIME = 3
	end
	self.damage.REVIVE_HEALTH_STEPS = {0.4}
	self.damage.BLEED_OT_TIME = 40
	self.damage.TASED_TIME = 10
	self.damage.TASED_RECOVER_TIME = 1
	self.damage.BLEED_OUT_HEALTH_INIT = 10
	self.damage.DOWNED_TIME = 30
	self.damage.DOWNED_TIME_DEC = 5
	self.damage.DOWNED_TIME_MIN = 10
	self.damage.ARRESTED_TIME = 60
	self.damage.INCAPACITATED_TIME = 30
	self.damage.MIN_DAMAGE_INTERVAL = 0
	self.damage.respawn_time_penalty = 30
	self.damage.base_respawn_time_penalty = 5
	self.fall_health_damage = 5
	self.fall_damage_alert_size = 250
	self.SUSPICION_OFFSET_LERP = 0.75
	self.long_dis_interaction = {
		intimidate_strength = 0.5,
		highlight_range = 3000,
		intimidate_range_enemies = 1000,
		intimidate_range_civilians = 1000
	}
	self.suppression = {
		max_value = 20,
		decay_start_delay = 1,
		receive_mul = 10,
		spread_mul = 1,
		autohit_chance_mul = 1,
		tolerance = 1
	}
	self.suspicion = {
		max_value = 8,
		range_mul = 1,
		buildup_mul = 1
	}
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{6, 6},
			{6, 6}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			1,
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			1,
			0
		}
	}
	self.max_nr_following_hostages = 1
	self.TRANSITION_DURATION = 0.23
	self.stances = {
		default = {
			standard = {
				head = {},
				shoulders = {},
				vel_overshot = {}
			},
			crouched = {
				head = {},
				shoulders = {},
				vel_overshot = {}
			},
			steelsight = {
				shoulders = {},
				vel_overshot = {}
			}
		}
	}
	self.stances.default.standard.head.translation = Vector3(0, 0, 145)
	self.stances.default.standard.head.rotation = Rotation()
	self.stances.default.standard.shakers = {}
	self.stances.default.standard.shakers.breathing = {}
	self.stances.default.standard.shakers.breathing.amplitude = 0.3
	self.stances.default.crouched.shakers = {}
	self.stances.default.crouched.shakers.breathing = {}
	self.stances.default.crouched.shakers.breathing.amplitude = 0.25
	self.stances.default.steelsight.shakers = {}
	self.stances.default.steelsight.shakers.breathing = {}
	self.stances.default.steelsight.shakers.breathing.amplitude = 0.025
	self.stances.default.mask_off = deep_clone(self.stances.default.standard)
	self.stances.default.mask_off.head.translation = Vector3(0, 0, 160)
	self.stances.default.clean = deep_clone(self.stances.default.mask_off)
	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	local pivot_shoulder_translation = Vector3()
	local pivot_shoulder_rotation = Rotation()
	self.stances.default.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.default.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.default.standard.vel_overshot.yaw_neg = 6
	self.stances.default.standard.vel_overshot.yaw_pos = -6
	self.stances.default.standard.vel_overshot.pitch_neg = -10
	self.stances.default.standard.vel_overshot.pitch_pos = 10
	self.stances.default.standard.vel_overshot.pivot = Vector3(0, 0, 0)
	self.stances.default.standard.FOV = 65
	self.stances.default.crouched.head.translation = Vector3(0, 0, 75)
	self.stances.default.crouched.head.rotation = Rotation()
	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	self.stances.default.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.default.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.default.crouched.vel_overshot.yaw_neg = 6
	self.stances.default.crouched.vel_overshot.yaw_pos = -6
	self.stances.default.crouched.vel_overshot.pitch_neg = -10
	self.stances.default.crouched.vel_overshot.pitch_pos = 10
	self.stances.default.crouched.vel_overshot.pivot = Vector3(0, 0, 0)
	self.stances.default.crouched.FOV = self.stances.default.standard.FOV
	local pivot_head_translation = Vector3(0, 0, 0)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.default.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.default.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.default.steelsight.vel_overshot.yaw_neg = 4
	self.stances.default.steelsight.vel_overshot.yaw_pos = -4
	self.stances.default.steelsight.vel_overshot.pitch_neg = -2
	self.stances.default.steelsight.vel_overshot.pitch_pos = 2
	self.stances.default.steelsight.vel_overshot.pivot = pivot_shoulder_translation
	self.stances.default.steelsight.zoom_fov = true
	self.stances.default.steelsight.FOV = self.stances.default.standard.FOV
	self.stances.jowi = deep_clone(self.stances.default)
	local pivot_shoulder_translation = Vector3(11.391, 45.0507, -3.38766)
	local pivot_shoulder_rotation = Rotation(-0.326422, 0.247368, -0.0156885)
	local pivot_head_translation = Vector3(10.95, 30, -4)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.jowi.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.jowi.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -86, 0)
	local pivot_head_translation = Vector3(10.95, 42, -3)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.jowi.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.jowi.steelsight.zoom_fov = false
	self.stances.jowi.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -36, 0)
	self.stances.jowi.steelsight.vel_overshot.yaw_neg = 5
	self.stances.jowi.steelsight.vel_overshot.yaw_pos = -5
	self.stances.jowi.steelsight.vel_overshot.pitch_neg = -12
	self.stances.jowi.steelsight.vel_overshot.pitch_pos = 12
	local pivot_head_translation = Vector3(10.95, 32, -3)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.jowi.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.jowi.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -36, 0)
	self:_init_new_stances()
	self.movement_state = {}
	self.movement_state.standard = {}
	self.movement_state.standard.movement = {
		speed = {},
		jump_velocity = {
			xy = {}
		}
	}
	self.movement_state.standard.movement.speed.STANDARD_MAX = 350
	self.movement_state.standard.movement.speed.RUNNING_MAX = 575
	self.movement_state.standard.movement.speed.CROUCHING_MAX = 225
	self.movement_state.standard.movement.speed.STEELSIGHT_MAX = 185
	self.movement_state.standard.movement.speed.INAIR_MAX = 185
	self.movement_state.standard.movement.speed.CLIMBING_MAX = 200
	self.movement_state.standard.movement.jump_velocity.z = 470
	self.movement_state.standard.movement.jump_velocity.xy.run = self.movement_state.standard.movement.speed.RUNNING_MAX * 1
	self.movement_state.standard.movement.jump_velocity.xy.walk = self.movement_state.standard.movement.speed.STANDARD_MAX * 1.2
	self.movement_state.interaction_delay = 1.5
	self.movement_state.stamina = {}
	self.movement_state.stamina.STAMINA_INIT = 20
	self.movement_state.stamina.STAMINA_REGEN_RATE = 3
	self.movement_state.stamina.STAMINA_DRAIN_RATE = 2
	self.movement_state.stamina.REGENERATE_TIME = 1
	self.movement_state.stamina.MIN_STAMINA_THRESHOLD = 4
	self.movement_state.stamina.JUMP_STAMINA_DRAIN = 2
	self.camera = {}
	self.camera.MIN_SENSITIVITY = 0.3
	self.camera.MAX_SENSITIVITY = 1.7
	self.omniscience = {}
	self.omniscience.start_t = 3.5
	self.omniscience.interval_t = 1
	self.omniscience.sense_radius = 1000
	self.omniscience.target_resense_t = 15

	
	self.damage.ARMOR_INIT = 0
end]]