dofile(ModPath .. "armoroverhaulcore.lua")

function string.remove_zeros(base_format, str)
	local string_value = string.format(base_format, str)
	while string.sub(string_value, -1) == "0" do
		string_value = string.sub(string_value, 1, -2)
	end
	if string.sub(string_value, -1) == "." then
		string_value = string.sub(string_value, 1, -2)
	end
	return string_value
end

local ammo_info_orig = BlackMarketGui.get_weapon_ammo_info

local is_win32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not is_win32
local WIDTH_MULTIPLIER = NOT_WIN_32 and 0.68 or 0.71
local BOX_GAP = 13.5
local GRID_H_MUL = (NOT_WIN_32 and 7 or 6.9) / 8
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size

function BlackMarketGui:_get_armor_stats(name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data({armors = name}, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	detection_risk = math.round(detection_risk * 100)
	local bm_armor_tweak = tweak_data.blackmarket.armors[name]
	local upgrade_level = bm_armor_tweak.upgrade_level
	local difficulty = Global.game_settings.difficulty
	for i, stat in ipairs(self._armor_stats_shown) do
		base_stats[stat.name] = {value = 0}
		mods_stats[stat.name] = {value = 0}
		skill_stats[stat.name] = {value = 0}
		if stat.name == "armor" then
			local base = tweak_data.player.damage.ARMOR_INIT
			local mod = managers.player:body_armor_value("armor", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = (base_stats[stat.name].value + managers.player:body_armor_skill_addend(name) * tweak_data.gui.stats_present_multiplier) * managers.player:body_armor_skill_multiplier() - base_stats[stat.name].value
			}
		elseif stat.name == "health" then
			local base = tweak_data.player.damage.HEALTH_INIT
			-- Thick skin value is an old unused value related to steadiness or HP bonus or something?
			local mod = managers.player:thick_skin_value()
			local overhaul_addend = managers.player:body_armor_value("hp_addend", upgrade_level)
			local hp_addend_mul = tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty] and (tweak_data.upgrades.values.player.body_armor["scaling_" .. difficulty].hp_addend or 1) or 1
			local overhaul_skill = managers.player:upgrade_value("player", name .. "_hp_addend", 0) * hp_addend_mul
			base_stats[stat.name] = {
				value = math.round((base + mod + overhaul_addend + overhaul_skill) * tweak_data.gui.stats_present_multiplier)
			}
			skill_stats[stat.name] = {
				value = math.round(base_stats[stat.name].value * managers.player:health_skill_multiplier() - base_stats[stat.name].value)
			}
		elseif stat.name == "concealment" then
			base_stats[stat.name] = {
				value = math.round(managers.player:body_armor_value("concealment", upgrade_level))
			}
			skill_stats[stat.name] = {
				value = math.round(managers.blackmarket:concealment_modifier("armors"))
			}
		elseif stat.name == "movement" then
			local base = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 100 * tweak_data.gui.stats_present_multiplier
			local movement_penalty = managers.player:body_armor_value("movement", upgrade_level)
			local base_value = movement_penalty * base
			base_stats[stat.name] = {value = base_value}
			local skill_mod = managers.player:movement_speed_multiplier(false, false, upgrade_level)
			local skill_value = skill_mod * base - base_value
			skill_stats[stat.name] = {value = skill_value}
			skill_stats[stat.name].skill_in_effect = skill_value > 0
		elseif stat.name == "dodge" then
			local base = 0
			local mod = managers.player:body_armor_value("dodge", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * 100
			}
			skill_stats[stat.name] = {
				value = managers.player:skill_dodge_chance(false, false, false, name, detection_risk) * 100
			}
		elseif stat.name == "damage_shake" then
			local base = tweak_data.gui.armor_damage_shake_base
			local mod = math.max(managers.player:body_armor_value("damage_shake", upgrade_level, nil, 1), 0.01)
			local skill = math.max(managers.player:upgrade_value("player", "damage_shake_multiplier", 1), 0.01)
			local base_value = base
			local mod_value = base / mod - base_value
			local skill_value = base / mod / skill - base_value - mod_value + managers.player:upgrade_value("player", "damage_shake_addend", 0)
			base_stats[stat.name] = {
				value = (base_value + mod_value) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = skill_value * tweak_data.gui.stats_present_multiplier
			}
		elseif stat.name == "stamina" then
			local stamina_data = tweak_data.player.movement_state.stamina
			local base = stamina_data.STAMINA_INIT
			local mod = managers.player:body_armor_value("stamina", upgrade_level)
			local skill = managers.player:stamina_multiplier(upgrade_level)
			local base_value = base
			local mod_value = base * mod - base_value
			local skill_value = base * mod * skill - base_value - mod_value-- + managers.player:upgrade_value("player", name .. "_stamina_multiplier", 0)
			base_stats[stat.name] = {
				value = base_value + mod_value
			}
			skill_stats[stat.name] = {
				value = skill_value
			}



		elseif stat.name == "regen" then
			local base = managers.player:body_armor_value("regen", upgrade_level) * 10
			local skill = 1 / managers.player:body_armor_regen_multiplier(false) + managers.player:upgrade_value("player", name .. "_armor_regen_addend", 0)
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * (skill - 1)
			}
		elseif stat.name == "regen_delay" then
			local base = managers.player:body_armor_value("regen_delay", upgrade_level)
			local skill = 0
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
			}
		elseif stat.name == "deflect_min_dmg" then
			local base = managers.player:body_armor_value("deflect", upgrade_level)[1][1] * 10
			local skill = 0
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
			}
		elseif stat.name == "deflect_min_procent" then
			local base = managers.player:body_armor_value("deflect", upgrade_level)[1][2] * 100
			local skill = managers.player:upgrade_value("player", name .. "_deflect_chance_addend", 0) * 100
			local skill_addend = managers.player:upgrade_value("player", "all_deflect_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = skill + skill_addend
			}
		elseif stat.name == "deflect_max_dmg" then
			local base = managers.player:body_armor_value("deflect", upgrade_level)[2][1] * 10
			local skill = 0
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
			}
		elseif stat.name == "deflect_max_procent" then
			local base = managers.player:body_armor_value("deflect", upgrade_level)[2][2] * 100
			local skill = managers.player:upgrade_value("player", name .. "_deflect_chance_addend", 0) * 100
			local skill_addend = managers.player:upgrade_value("player", "all_deflect_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = skill + skill_addend
			}
		elseif stat.name == "hdr_min_dmg" then
			local base = managers.player:body_armor_value("health_damage_reduction", upgrade_level)[1][1] * 10
			local skill = 0
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
			}
		elseif stat.name == "hdr_min_procent" then
			local base = managers.player:body_armor_value("health_damage_reduction", upgrade_level)[1][2] * 100
			local skill = 0
			local skill_addend = managers.player:upgrade_value("player", "all_hdr_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill + skill_addend
			}
		elseif stat.name == "hdr_max_dmg" then
			local base = managers.player:body_armor_value("health_damage_reduction", upgrade_level)[2][1] * 10
			local skill = 0
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
			}
		elseif stat.name == "hdr_max_procent" then
			local base = managers.player:body_armor_value("health_damage_reduction", upgrade_level)[2][2] * 100
			local skill = 0
			local skill_addend = managers.player:upgrade_value("player", "all_hdr_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill + skill_addend
			}
		elseif stat.name == "explosion_damage_reduction" then
			local base = managers.player:body_armor_value("explosion_damage_reduction", upgrade_level) * 100
			local skill = managers.player:upgrade_value("player", name .. "_edr_addend", 0) * 100
			local skill_addend = managers.player:upgrade_value("player", "all_edr_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = skill + skill_addend
			}
		elseif stat.name == "ammo_mul" then
			local base = managers.player:body_armor_value("skill_ammo_mul", upgrade_level) * 100 - 100
			local skill = 1
			local skill_addend = managers.player:upgrade_value("player", "all_ammo_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * (skill - 1) + skill_addend
			}
		elseif stat.name == "jump_speed_multiplier" then
			local base = managers.player:body_armor_value("jump_speed_multiplier", upgrade_level) * 100 - 100
			local skill = 1
			local skill_addend = managers.player:upgrade_value("player", "all_jump_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * (skill - 1) + skill_addend
			}
		elseif stat.name == "bleeding_reduction" then
			local base = managers.player:body_armor_value("bleeding_reduction", upgrade_level) + 1
			local skill = 1
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * (skill - 1)
			}

			

		end
		skill_stats[stat.name].skill_in_effect = skill_stats[stat.name].skill_in_effect or skill_stats[stat.name].value ~= 0
	end
	return base_stats, mods_stats, skill_stats
end

-- This PreHook saves us from having to override the whole show_stats function. Nice!
Hooks:PreHook(BlackMarketGui, "show_stats", "armoroverhaul_bm_showarmorstats_initarmorpage", function(self)
	self._armor_stats_panel:hide()
	self:_get_armor_page()
end)

function BlackMarketGui:populate_armors(data)
	local new_data = {}
	local sort_data = {}
	for i, d in pairs(tweak_data.blackmarket.armors) do
		table.insert(sort_data, {
			i,
			d.name_id
		})
	end
	local armor_level_data = {}
	for level, data in pairs(tweak_data.upgrades.level_tree) do
		if data.upgrades then
			for _, upgrade in ipairs(data.upgrades) do
				local def = tweak_data.upgrades.definitions[upgrade]
				if def.armor_id then
					armor_level_data[def.armor_id] = level
				end
			end
		end
	end
	table.sort(sort_data, function(x, y)
		local x_level = tonumber(string.sub(x[1], 7))-- == "level_1" and 0 or armor_level_data[x[1]] or 100
		local y_level = tonumber(string.sub(y[1], 7))-- == "level_1" and 0 or armor_level_data[y[1]] or 100
		return x_level < y_level
	end
)
	local guis_catalog = "guis/"
	local index = 0
	for i, armor_data in ipairs(sort_data) do
		local armor_id = armor_data[1]
		local name_id = armor_data[2]
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[armor_id] and tweak_data.blackmarket.armors[armor_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		index = index + 1
		new_data = {}
		armor_bitmap = armor_id
		if ArmorOverhaul.spoof[armor_id] then
			armor_bitmap = ArmorOverhaul.spoof[armor_id]
		end

		new_data.name = armor_id
		new_data.name_localized = managers.localization:text(name_id)
		new_data.category = "armors"
		new_data.slot = index
		new_data.unlocked = bm_data.unlocked
		new_data.level = armor_level_data[armor_id] or 0
		new_data.skill_based = new_data.level == 0
		new_data.equipped = bm_data.equipped
		new_data.skill_name = new_data.level == 0 and "bm_menu_skill_locked_" .. new_data.name
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. armor_bitmap
		new_data.comparision_data = {}
		new_data.lock_texture = self:get_lock_icon(new_data)
		if i ~= 1 and managers.blackmarket:got_new_drop("normal", "armors", armor_id) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				right = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {
				"normal",
				"armors",
				armor_id
			}
		end
		if new_data.unlocked and not new_data.equipped then
			table.insert(new_data, "a_equip")
		end

		if i ~= 1 and (game_state_machine and game_state_machine:current_state_name()) ~= "ingame_waiting_for_players" then
			table.insert(new_data, "a_mod")
		end
		data[index] = new_data
	end
	local max_armors = data.override_slots[1] * data.override_slots[2]
	for i = 1, max_armors do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "armors"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end

function BlackMarketGui:_get_armor_page()
	-- It's too big, and all this deflection is just noise anyway
	-- It's still gonna be used, just not shown
	self._armor_stats_shown = {
		{name = "armor"},
		{name = "health"},
		{
			name = "concealment",
			index = true
		},
		{name = "movement", procent = true},
		{
			name = "dodge",
			revert = true,
			procent = true
		},
		--{
		--	name = "damage_shake"
		--},
		{name = "stamina"},
		{name = "ammo_mul", procent = true, revert = true},
		{name = "regen", procent = true, revert = true},
		{name = "regen_delay"},
		--{name = "deflect_min_dmg"},
		--{name = "deflect_min_procent", procent = true, revert = true},
		--{name = "deflect_max_dmg"},
		--{name = "deflect_max_procent", procent = true, revert = true},
		--{name = "hdr_min_dmg"},
		--{name = "hdr_min_procent", procent = true, revert = true},
		--{name = "hdr_max_dmg"},
		--{name = "hdr_max_procent", procent = true, revert = true},
		--{name = "explosion_damage_reduction", procent = true, revert = true},
		--{name = "bleeding_reduction"}
	}
	do
		local x = 0
		local y = 20
		local text_panel
		self._armor_stats_texts = {}
		local text_columns = {
			{name = "name", size = 100},
			{
				name = "equip",
				size = 45,
				align = "right",
				alpha = 0.75,
				blend = "add"
			},
			{
				name = "base",
				size = 60,
				align = "right",
				alpha = 0.75,
				blend = "add"
			},
			{
				name = "skill",
				size = 60,
				align = "right",
				alpha = 0.75,
				blend = "add",
				color = tweak_data.screen_colors.resource
			},
			{
				name = "total",
				size = 45,
				align = "right"
			}
		}
		self._armor_stats_panel = self._stats_panel:panel()
		local panel
		for i, stat in ipairs(self._armor_stats_shown) do
			panel = self._armor_stats_panel:panel({
				layer = 1,
				x = 4,
				y = y,
				w = self._armor_stats_panel:w() + 8,
				h = 20
			})
			if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
				panel:rect({
					name = tostring(i),
					color = Color.black:with_alpha(0.3)
				})
			end
			x = 2
			y = y + 20
			self._armor_stats_texts[stat.name] = {}
			for _, column in ipairs(text_columns) do
				text_panel = panel:panel({
					layer = 0,
					x = x + 4,
					w = column.size + 8,
					h = panel:h()
				})
				local size_mul = 1
				if column.name == "name" then
					if stat.name == "regen" then
						size_mul = 0.8
					elseif stat.name == "deflect_min_dmg" or stat.name == "deflect_min_procent" or stat.name == "deflect_max_dmg" or stat.name == "deflect_max_procent" then
						size_mul = 0.725
					elseif stat.name == "jump_speed_multiplier" then
						size_mul = 0.725
					elseif stat.name == "explosion_damage_reduction" then
						size_mul = 0.5
					elseif stat.name == "hdr_min_dmg" or stat.name == "hdr_min_procent" or stat.name == "hdr_max_dmg" or stat.name == "hdr_max_procent" then
						size_mul = 1
					end
				end
				self._armor_stats_texts[stat.name][column.name] = text_panel:text({
					font_size = small_font_size * size_mul,
					font = small_font,
					align = column.align,
					layer = 1,
					alpha = column.alpha,
					blend_mode = column.blend,
					color = column.color or tweak_data.screen_colors.text
				})
				x = x + column.size + 4
				if column.name == "total" then
					text_panel:set_x(190)
				end
			end
		end
	end
end

function BlackMarketGui:change_armor_page(value)
	ArmorOverhaul.index = ArmorOverhaul.index + value
	if ArmorOverhaul.index > ArmorOverhaul.max_index then
		ArmorOverhaul.index = ArmorOverhaul.max_index
	elseif ArmorOverhaul.index < 0 then
		ArmorOverhaul.index = 0
	end
	self:show_stats()
end

function BlackMarketGui:armor_page_up(data)
	self:change_armor_page(1)
end

function BlackMarketGui:armor_page_down(data)
	self:change_armor_page(-1)
end

function BlackMarketGui:get_weapon_ammo_info(weapon_id, extra_ammo, total_ammo_mod)
	--[[local clip, max, data = ammo_info_orig(self, weapon_id, extra_ammo, total_ammo_mod)
	local ammo_max_multiplier = managers.player:upgrade_value("player", "all_ammo_addend", 0) + 0.05
	return clip, max * ammo_max_multiplier, data]]
	local weapon_tweak_data = tweak_data.weapon[weapon_id]
	local ammo_max_multiplier = managers.player:upgrade_value("player", "extra_ammo_multiplier", 1)
	ammo_max_multiplier = ammo_max_multiplier * managers.player:upgrade_value(weapon_tweak_data.category, "extra_ammo_multiplier", 1)
	if managers.player:has_category_upgrade("player", "add_armor_stat_skill_ammo_mul") then
		ammo_max_multiplier = ammo_max_multiplier * managers.player:body_armor_value("skill_ammo_mul", nil, 1)
	end
	ammo_max_multiplier = ammo_max_multiplier + managers.player:upgrade_value("player", "all_ammo_addend", 0)
	local function get_ammo_max_per_clip(weapon_id)
		local function upgrade_blocked(category, upgrade)
			if not weapon_tweak_data.upgrade_blocks then
				return false
			end
			if not weapon_tweak_data.upgrade_blocks[category] then
				return false
			end
			return table.contains(weapon_tweak_data.upgrade_blocks[category], upgrade)
		end

		local clip_base = weapon_tweak_data.CLIP_AMMO_MAX
		local clip_mod = extra_ammo and tweak_data.weapon.stats.extra_ammo[extra_ammo] or 0
		local clip_skill = managers.player:upgrade_value(weapon_id, "clip_ammo_increase")
		if not upgrade_blocked("weapon", "clip_ammo_increase") then
			clip_skill = clip_skill + managers.player:upgrade_value("weapon", "clip_ammo_increase", 0)
		end
		if not upgrade_blocked(weapon_tweak_data.category, "clip_ammo_increase") then
			clip_skill = clip_skill + managers.player:upgrade_value(weapon_tweak_data.category, "clip_ammo_increase", 0)
		end
		return clip_base + clip_mod + clip_skill
	end

	local ammo_max_per_clip = get_ammo_max_per_clip(weapon_id)
	local ammo_max = tweak_data.weapon[weapon_id].AMMO_MAX
	local ammo_from_mods = math.round(ammo_max * (total_ammo_mod and tweak_data.weapon.stats.total_ammo_mod[total_ammo_mod] or 0))
	ammo_max = math.round((ammo_max + ammo_from_mods + managers.player:upgrade_value(weapon_id, "clip_amount_increase") * ammo_max_per_clip) * ammo_max_multiplier)
	ammo_max_per_clip = math.min(ammo_max_per_clip, ammo_max)
	local ammo_data = {}
	ammo_data.base = tweak_data.weapon[weapon_id].AMMO_MAX
	ammo_data.mod = ammo_from_mods + managers.player:upgrade_value(weapon_id, "clip_amount_increase") * ammo_max_per_clip
	ammo_data.skill = math.round((ammo_data.base + ammo_data.mod) * ammo_max_multiplier) - ammo_data.base - ammo_data.mod
	ammo_data.skill_in_effect = managers.player:has_category_upgrade("player", "extra_ammo_multiplier") or managers.player:has_category_upgrade(weapon_tweak_data.category, "extra_ammo_multiplier") or managers.player:has_category_upgrade("player", "add_armor_stat_skill_ammo_mul")
	return ammo_max_per_clip, ammo_max, ammo_data
end