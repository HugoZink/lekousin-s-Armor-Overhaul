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

function BlackMarketGui:show_stats()
	if not self._stats_panel or not self._rweapon_stats_panel or not self._armor_stats_panel or not self._mweapon_stats_panel then
		return
	end
	self._stats_panel:hide()
	self._rweapon_stats_panel:hide()
	self._armor_stats_panel:hide()
	self._mweapon_stats_panel:hide()
	if not self._slot_data then
		return
	end
	if not self._slot_data.comparision_data then
		return
	end
	local weapon = managers.blackmarket:get_crafted_category_slot(self._slot_data.category, self._slot_data.slot)
	local name = weapon and weapon.weapon_id or self._slot_data.name
	local category = self._slot_data.category
	local slot = self._slot_data.slot
	local value = 0
	self:_get_armor_page()
	local format_round = function(num, round_value)
		if not round_value or not tostring(math.round(num)) then
		end
		return (string.format("%.1f", num):gsub("%.?0+$", ""))
	end
	if self._slot_data.dont_compare_stats then
		local selection_index = tweak_data:get_raw_value("weapon", self._slot_data.weapon_id, "use_data", "selection_index") or 1
		local category = selection_index == 1 and "secondaries" or "primaries"
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(self._slot_data.weapon_id, nil, nil, self._slot_data.default_blueprint)
		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		self:set_stats_titles({name = "base", x = 170}, {
			name = "mod",
			text_id = "bm_menu_stats_mod",
			color = tweak_data.screen_colors.stats_mods,
			x = 215
		}, {name = "skill", alpha = 0.75})
		for _, title in pairs(self._stats_titles) do
			title:show()
		end
		self:set_stats_titles({name = "total", hide = true}, {
			name = "equip",
			text_id = "bm_menu_stats_total",
			alpha = 1,
			x = 120
		})
		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			local base = base_stats[stat.name].value
			self._stats_texts[stat.name].equip:set_alpha(1)
			self._stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value))
			self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
			if mods_stats[stat.name].value ~= 0 or not "" then
			end
			self._stats_texts[stat.name].mods:set_text((0 < mods_stats[stat.name].value and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
			if skill_stats[stat.name].skill_in_effect then
			else
			end
			self._stats_texts[stat.name].skill:set_text((0 < skill_stats[stat.name].value and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
			self._stats_texts[stat.name].total:set_text("")
			self._stats_texts[stat.name].base:set_alpha(0.75)
			self._stats_texts[stat.name].mods:set_alpha(0.75)
			self._stats_texts[stat.name].skill:set_alpha(0.75)
			if value > base then
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
			elseif value < base then
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
			end
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end
	elseif tweak_data.weapon[self._slot_data.name] or self._slot_data.default_blueprint then
		local equipped_item = managers.blackmarket:equipped_item(category)
		local equipped_slot = managers.blackmarket:equipped_weapon_slot(category)
		local equip_base_stats, equip_mods_stats, equip_skill_stats = WeaponDescription._get_stats(equipped_item.weapon_id, category, equipped_slot)
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(name, category, slot, self._slot_data.default_blueprint)
		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		self:set_stats_titles({name = "base", x = 170}, {
			name = "mod",
			text_id = "bm_menu_stats_mod",
			color = tweak_data.screen_colors.stats_mods,
			x = 215
		}, {name = "skill", alpha = 0.75})
		if slot ~= equipped_slot then
			for _, title in pairs(self._stats_titles) do
				title:hide()
			end
			self:set_stats_titles({name = "total", show = true}, {
				name = "equip",
				show = true,
				text_id = "bm_menu_equipped",
				alpha = 0.75,
				x = 105
			})
		else
			for _, title in pairs(self._stats_titles) do
				title:show()
			end
			self:set_stats_titles({name = "total", hide = true}, {
				name = "equip",
				text_id = "bm_menu_stats_total",
				alpha = 1,
				x = 120
			})
		end
		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			if slot == equipped_slot then
				local base = base_stats[stat.name].value
				self._stats_texts[stat.name].equip:set_alpha(1)
				self._stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value))
				self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
				if mods_stats[stat.name].value ~= 0 or not "" then
				end
				self._stats_texts[stat.name].mods:set_text((0 < mods_stats[stat.name].value and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
				if skill_stats[stat.name].skill_in_effect then
				else
				end
				self._stats_texts[stat.name].skill:set_text((0 < skill_stats[stat.name].value and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
				self._stats_texts[stat.name].total:set_text("")
				self._stats_texts[stat.name].base:set_alpha(0.75)
				self._stats_texts[stat.name].mods:set_alpha(0.75)
				self._stats_texts[stat.name].skill:set_alpha(0.75)
				if value > base then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
				elseif value < base then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				self._stats_texts[stat.name].equip:set_alpha(0.75)
				self._stats_texts[stat.name].equip:set_text(format_round(equip, stat.round_value))
				self._stats_texts[stat.name].base:set_text("")
				self._stats_texts[stat.name].mods:set_text("")
				self._stats_texts[stat.name].skill:set_text("")
				self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
				if value > equip then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
				elseif value < equip then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				end
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
			end
		end
	elseif tweak_data.blackmarket.armors[self._slot_data.name] then
		local percent_stats = {
			dodge = true,
			hdr_min_procent = true,
			hdr_max_procent = true,
			deflect_min_procent = true,
			deflect_max_procent = true,
			ammo_mul = true,
			jump_speed_multiplier = true,
			explosion_damage_reduction = true,
		}

		--self:_get_armor_page()

		local equipped_item = managers.blackmarket:equipped_item(category)
		local equipped_slot = managers.blackmarket:equipped_armor_slot()
		local equip_base_stats, equip_mods_stats, equip_skill_stats = self:_get_armor_stats(equipped_item)
		local base_stats, mods_stats, skill_stats = self:_get_armor_stats(self._slot_data.name)
		self._armor_stats_panel:show()
		self:hide_weapon_stats()
		self:hide_melee_weapon_stats()
		self:set_stats_titles({name = "base", x = 185}, {
			name = "mod",
			text_id = "bm_menu_stats_skill",
			color = tweak_data.screen_colors.resource,
			x = 245
		}, {name = "skill", alpha = 0})
		if self._slot_data.name ~= equipped_slot then
			for _, title in pairs(self._stats_titles) do
				title:hide()
			end
			self:set_stats_titles({name = "total", show = true}, {
				name = "equip",
				show = true,
				text_id = "bm_menu_equipped",
				alpha = 0.75,
				x = 105
			})
		else
			for title_name, title in pairs(self._stats_titles) do
				title:show()
			end
			self:set_stats_titles({name = "total", hide = true}, {
				name = "equip",
				text_id = "bm_menu_stats_total",
				alpha = 1,
				x = 120
			})
		end
		for _, stat in ipairs(self._armor_stats_shown) do



			local base_format = "%0.3f"



			self._armor_stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			value = base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value--math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			local real = value
			if stat.name == "dodge" then
				value = math.min(value, 95)
			end
			local string_value = string.remove_zeros(base_format, value)
			if self._slot_data.name == equipped_slot then
				local base = base_stats[stat.name].value
				local string_base = string.remove_zeros(base_format, base)
				self._armor_stats_texts[stat.name].equip:set_alpha(1)
				self._armor_stats_texts[stat.name].equip:set_text(string_value .. (percent_stats[stat.name] and "%" or "") .. ((stat.name == "dodge" and value == 95) and "(max)" or ""))
				self._armor_stats_texts[stat.name].base:set_text((stat.name == "dodge" and string.remove_zeros(base_format, math.min(base, 95)) or string_base) .. (percent_stats[stat.name] and "%" or ""))
				if skill_stats[stat.name].skill_in_effect then
				else
				end
				local v = string.remove_zeros(base_format, (skill_stats[stat.name].value ~= 0 and skill_stats[stat.name].value or 0) - (real - value))
				self._armor_stats_texts[stat.name].skill:set_text((0 < skill_stats[stat.name].value and "+" or "") .. (v ~= "0" and v or "") .. (percent_stats[stat.name] and 0 < skill_stats[stat.name].value and "%" or ""))
				self._armor_stats_texts[stat.name].total:set_text("")
				self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				if value ~= 0 and value > base then
					self._armor_stats_texts[stat.name].equip:set_color((stat.name == "hdr_max_dmg") and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				elseif value ~= 0 and value < base then
					self._armor_stats_texts[stat.name].equip:set_color((stat.name == "hdr_max_dmg") and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
				else
					self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end
				self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip = equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value--math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				if stat.name == "dodge" then
					equip = math.min(equip, 95)
				end
				local string_equip = string.remove_zeros(base_format, equip)
				self._armor_stats_texts[stat.name].equip:set_alpha(0.75)
				self._armor_stats_texts[stat.name].equip:set_text(string_equip .. (percent_stats[stat.name] and "%" or ""))
				self._armor_stats_texts[stat.name].base:set_text("")
				self._armor_stats_texts[stat.name].skill:set_text("")
				self._armor_stats_texts[stat.name].total:set_text(string_value .. (percent_stats[stat.name] and "%" or ""))
				if value > equip then
					self._armor_stats_texts[stat.name].total:set_color((stat.name == "hdr_max_dmg") and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				elseif value < equip then
					self._armor_stats_texts[stat.name].total:set_color((stat.name == "hdr_max_dmg") and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
				else
					self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				end
				self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
			end
		end
	elseif tweak_data.blackmarket.melee_weapons[self._slot_data.name] then
		self:hide_armor_stats()
		self:hide_weapon_stats()
		self._mweapon_stats_panel:show()
		self:set_stats_titles({name = "base", x = 185}, {
			name = "mod",
			text_id = "bm_menu_stats_skill",
			color = tweak_data.screen_colors.resource,
			x = 245
		}, {name = "skill", alpha = 0})
		local equipped_item = managers.blackmarket:equipped_item(category)
		local equip_base_stats, equip_mods_stats, equip_skill_stats = self:_get_melee_weapon_stats(equipped_item)
		local base_stats, mods_stats, skill_stats = self:_get_melee_weapon_stats(self._slot_data.name)
		if self._slot_data.name ~= equipped_item then
			for _, title in pairs(self._stats_titles) do
				title:hide()
			end
			self:set_stats_titles({name = "total", show = true}, {
				name = "equip",
				show = true,
				text_id = "bm_menu_equipped",
				alpha = 0.75,
				x = 105
			})
		else
			for title_name, title in pairs(self._stats_titles) do
				title:show()
			end
			self:set_stats_titles({name = "total", hide = true}, {
				name = "equip",
				text_id = "bm_menu_stats_total",
				alpha = 1,
				x = 120
			})
		end
		local value_min, value_max, skill_value_min, skill_value_max, skill_value
		for _, stat in ipairs(self._mweapon_stats_shown) do
			self._mweapon_stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			if stat.range then
				value_min = math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
				value_max = math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
			end
			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			if self._slot_data.name == equipped_item then
				local base, base_min, base_max, skill, skill_min, skill_max
				if stat.range then
					base_min = base_stats[stat.name].min_value
					base_max = base_stats[stat.name].max_value
					skill_min = skill_stats[stat.name].min_value
					skill_max = skill_stats[stat.name].max_value
				end
				base = base_stats[stat.name].value
				skill = skill_stats[stat.name].value
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = value and format_round(value, stat.round_value)
				local base_text = base and format_round(base, stat.round_value)
				local skill_text = skill_stats[stat.name].value and format_round(skill_stats[stat.name].value, stat.round_value)
				local base_min_text = base_min and format_round(base_min, true)
				local base_max_text = base_max and format_round(base_max, true)
				local value_min_text = value_min and format_round(value_min, true)
				local value_max_text = value_max and format_round(value_max, true)
				local skill_min_text = skill_min and format_round(skill_min, true)
				local skill_max_text = skill_max and format_round(skill_max, true)
				if stat.range then
					if base_min ~= base_max then
						base_text = base_min_text .. " (" .. base_max_text .. ")"
					end
					if value_min ~= value_max then
						equip_text = value_min_text .. " (" .. value_max_text .. ")"
					end
					if skill_min ~= skill_max then
						skill_text = skill_min_text .. " (" .. skill_max_text .. ")"
					end
				end
				if stat.suffix then
					base_text = base_text .. tostring(stat.suffix)
					equip_text = equip_text .. tostring(stat.suffix)
					skill_text = skill_text .. tostring(stat.suffix)
				end
				if stat.prefix then
					base_text = tostring(stat.prefix) .. base_text
					equip_text = tostring(stat.prefix) .. equip_text
					skill_text = tostring(stat.prefix) .. skill_text
				end
				self._mweapon_stats_texts[stat.name].equip:set_alpha(1)
				self._mweapon_stats_texts[stat.name].equip:set_text(equip_text)
				self._mweapon_stats_texts[stat.name].base:set_text(base_text)
				if skill_stats[stat.name].skill_in_effect then
				else
				end
				self._mweapon_stats_texts[stat.name].skill:set_text((0 < skill_stats[stat.name].value and "+" or "") .. skill_text or "")
				self._mweapon_stats_texts[stat.name].total:set_text("")
				self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				local positive = value ~= 0 and value > base
				local negative = value ~= 0 and value < base
				if stat.inverse then
					local temp = positive
					positive = negative
					negative = temp
				end
				if stat.range then
					if positive then
						self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
					elseif negative then
						self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
					end
				elseif positive then
					self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
				elseif negative then
					self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end
				self._mweapon_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip, equip_min, equip_max
				if stat.range then
					equip_min = math.max(equip_base_stats[stat.name].min_value + equip_mods_stats[stat.name].min_value + equip_skill_stats[stat.name].min_value, 0)
					equip_max = math.max(equip_base_stats[stat.name].max_value + equip_mods_stats[stat.name].max_value + equip_skill_stats[stat.name].max_value, 0)
				end
				equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = equip and format_round(equip, stat.round_value)
				local total_text = value and format_round(value, stat.round_value)
				local equip_min_text = equip_min and format_round(equip_min, true)
				local equip_max_text = equip_max and format_round(equip_max, true)
				local total_min_text = value_min and format_round(value_min, true)
				local total_max_text = value_max and format_round(value_max, true)
				local color_ranges = {}
				if stat.range then
					if equip_min ~= equip_max then
						equip_text = equip_min_text .. " (" .. equip_max_text .. ")"
					end
					if value_min ~= value_max then
						total_text = total_min_text .. " (" .. total_max_text .. ")"
					end
				end
				if stat.suffix then
					equip_text = equip_text .. tostring(stat.suffix)
					total_text = total_text .. tostring(stat.suffix)
				end
				if stat.prefix then
					equip_text = tostring(stat.prefix) .. equip_text
					total_text = tostring(stat.prefix) .. total_text
				end
				self._mweapon_stats_texts[stat.name].equip:set_alpha(0.75)
				self._mweapon_stats_texts[stat.name].equip:set_text(equip_text)
				self._mweapon_stats_texts[stat.name].base:set_text("")
				self._mweapon_stats_texts[stat.name].skill:set_text("")
				self._mweapon_stats_texts[stat.name].total:set_text(total_text)
				if stat.range then
					local positive = value_min > equip_min
					local negative = value_min < equip_min
					if stat.inverse then
						local temp = positive
						positive = negative
						negative = temp
					end
					local color_range_min = {
						start = 0,
						stop = utf8.len(total_min_text),
						color = nil
					}
					if positive then
						color_range_min.color = tweak_data.screen_colors.stats_positive
					elseif negative then
						color_range_min.color = tweak_data.screen_colors.stats_negative
					else
						color_range_min.color = tweak_data.screen_colors.text
					end
					table.insert(color_ranges, color_range_min)
					positive = value_max > equip_max
					negative = value_max < equip_max
					if stat.inverse then
						local temp = positive
						positive = negative
						negative = temp
					end
					local color_range_max = {
						start = color_range_min.stop + 1,
						stop = nil,
						color = nil
					}
					color_range_max.stop = color_range_max.start + 3 + utf8.len(total_max_text)
					if positive then
						color_range_max.color = tweak_data.screen_colors.stats_positive
					elseif negative then
						color_range_max.color = tweak_data.screen_colors.stats_negative
					else
						color_range_max.color = tweak_data.screen_colors.text
					end
					table.insert(color_ranges, color_range_max)
				else
					local positive = value > equip
					local negative = value < equip
					if stat.inverse then
						local temp = positive
						positive = negative
						negative = temp
					end
					local color_range = {
						start = 0,
						stop = utf8.len(total_text),
						color = nil
					}
					if positive then
						color_range.color = tweak_data.screen_colors.stats_positive
					elseif negative then
						color_range.color = tweak_data.screen_colors.stats_negative
					else
						color_range.color = tweak_data.screen_colors.text
					end
					table.insert(color_ranges, color_range)
				end
				self._mweapon_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				for _, color_range in ipairs(color_ranges) do
					self._mweapon_stats_texts[stat.name].total:set_range_color(color_range.start, color_range.stop, color_range.color)
				end
			end
		end
	else
		
		local equip, stat_changed
		local tweak_parts = tweak_data.weapon.factory.parts[self._slot_data.name]
		local mod_stats = self:_get_stats_for_mod(self._slot_data.name, name, category, slot)
		local hide_equip = mod_stats.equip.name == mod_stats.chosen.name
		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		for _, title in pairs(self._stats_titles) do title:hide() end
		if not mod_stats.equip.name then
			self._stats_titles.equip:hide()
		else
			self._stats_titles.equip:show()
			self._stats_titles.equip:set_text(utf8.to_upper(managers.localization:text("bm_menu_equipped")))
			self._stats_titles.equip:set_alpha(0.75)
			self._stats_titles.equip:set_x(105)
		end

		if not hide_equip then self._stats_titles.total:show() end
		for i, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			value = mod_stats.chosen[stat.name]
			equip = mod_stats.equip[stat.name]
			stat_changed = tweak_parts and tweak_parts.stats[stat.stat_name or stat.name] and value ~= 0 and 1 or 0.5

			for stat_name, stat_text in pairs(self._stats_texts[stat.name]) do if stat_name ~= "name" then stat_text:set_text("") end end
			for name, column in pairs(self._stats_texts[stat.name]) do column:set_alpha(stat_changed) end
			
			local decimals = "%0.0f"
			if stat.name == "damage" then
				decimals = "%0.2f"
			elseif stat.name == "fire_rate" then
				decimals = "%0.1f"
			end
			local value2, equip2
			value2 = value
			equip2 = equip
			self._stats_texts[stat.name].total:set_text(not hide_equip and stat_changed == 1 and (( value > 0 and "+" or "") .. string.remove_zeros(decimals, value2) or ""))
			self._stats_texts[stat.name].equip:set_text((equip == 0 and "") or (equip > 0 and "+" or "") .. string.remove_zeros(decimals, equip2))
			self._stats_texts[stat.name].equip:set_alpha(0.75)
			if value > equip then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
			elseif value < equip then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			end
			self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
		end
	end
	local modslist_panel = self._stats_panel:child("modslist_panel")
	local y = 0
	if self._rweapon_stats_panel:visible() then
		for i, child in ipairs(self._rweapon_stats_panel:children()) do
			y = math.max(y, child:bottom())
		end
	elseif self._armor_stats_panel:visible() then
		for i, child in ipairs(self._armor_stats_panel:children()) do
			y = math.max(y - 10, child:bottom() - 10)
		end
	elseif self._mweapon_stats_panel:visible() then
		for i, child in ipairs(self._mweapon_stats_panel:children()) do
			y = math.max(y, child:bottom())
		end
	end
	modslist_panel:set_top(y + 10)
	self._stats_panel:show()
end

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
		local changed = false
		local armor_bitmap
		for i, armor in ipairs(Global.real_armor) do
			if armor_id == armor then
				armor_bitmap = Global.spoof_armor[i]
				changed = true
				break
			end
		end
		if not changed then
			armor_bitmap = armor_id
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
	if ArmorOverhaul.index == 0 then
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
			{
				name = "damage_shake"
			},
			{name = "stamina"},
			{name = "ammo_mul", procent = true, revert = true},
		}
	elseif ArmorOverhaul.index == 1 then
		self._armor_stats_shown = {
			{name = "regen", procent = true, revert = true},
			{name = "deflect_min_dmg"},
			{name = "deflect_min_procent", procent = true, revert = true},
			{name = "deflect_max_dmg"},
			{name = "deflect_max_procent", procent = true, revert = true},
			{name = "hdr_min_dmg"},
			{name = "hdr_min_procent", procent = true, revert = true},
			{name = "hdr_max_dmg"},
			{name = "hdr_max_procent", procent = true, revert = true},
		}
	else
		self._armor_stats_shown = {
			{name = "explosion_damage_reduction", procent = true, revert = true},
			{name = "jump_speed_multiplier"},
			{name = "bleeding_reduction"}
		}
	end
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