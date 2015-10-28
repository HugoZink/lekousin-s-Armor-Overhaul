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

--if not HUDTeammate then return end
--local init_orig = HUDTeammate.init
if not ArmorOverhaul or not ArmorOverhaul.options.gui_enabled then return end
--[[HUDTeammate = HUDTeammate or class()
function HUDTeammate:init(i, teammates_panel, is_player, width)
	self._id = i
	local small_gap = 8
	local gap = 0
	local pad = 4
	local main_player = i == HUDManager.PLAYER_PANEL
	self._main_player = main_player
	if not main_player then
		init_orig(self, i, teammates_panel, is_player, width)
	else
		local names = {
			"WWWWWWWWWWWWQWWW",
			"AI Teammate",
			"FutureCatCar",
			"WWWWWWWWWWWWQWWW"
		}
		local teammate_panel = teammates_panel:panel({
			visible = false,
			name = "" .. i,
			w = math.round(width),
			x = 0,
			halign = "right"
		})
		if not main_player then
			teammate_panel:set_h(84)
			teammate_panel:set_bottom(teammates_panel:h())
			teammate_panel:set_halign("left")
		end
		self._player_panel = teammate_panel:panel({name = "player"})
		local name = teammate_panel:text({
			name = "name",
			text = " " .. utf8.to_upper(names[i]),
			layer = 1,
			color = Color.white,
			y = 0,
			vertical = "bottom",
			font_size = tweak_data.hud_players.name_size,
			font = tweak_data.hud_players.name_font
		})
		local _, _, name_w, _ = name:text_rect()
		managers.hud:make_fine_text(name)
		name:set_leftbottom(name:h(), teammate_panel:h() - 70)
		if not main_player then
			name:set_x(48 + name:h() + 4)
			name:set_bottom(teammate_panel:h() - 30)
		end
		local tabs_texture = "guis/textures/pd2/hud_tabs"
		local bg_rect = {
			84,
			0,
			44,
			32
		}
		local cs_rect = {
			84,
			34,
			19,
			19
		}
		local csbg_rect = {
			105,
			34,
			19,
			19
		}
		local bg_color = Color.white / 3
		teammate_panel:bitmap({
			name = "name_bg",
			texture = tabs_texture,
			texture_rect = bg_rect,
			visible = true,
			layer = 0,
			color = bg_color,
			x = name:x(),
			y = name:y() - 1,
			w = name_w + 4,
			h = name:h()
		})
		teammate_panel:bitmap({
			name = "callsign_bg",
			texture = tabs_texture,
			texture_rect = csbg_rect,
			layer = 0,
			color = bg_color,
			blend_mode = "normal",
			x = name:x() - name:h(),
			y = name:y() + 1,
			w = name:h() - 2,
			h = name:h() - 2
		})
		teammate_panel:bitmap({
			name = "callsign",
			texture = tabs_texture,
			texture_rect = cs_rect,
			layer = 1,
			color = tweak_data.chat_colors[i]:with_alpha(1),
			blend_mode = "normal",
			x = name:x() - name:h(),
			y = name:y() + 1,
			w = name:h() - 2,
			h = name:h() - 2
		})
		local box_ai_bg = teammate_panel:bitmap({
			visible = false,
			name = "box_ai_bg",
			texture = "guis/textures/pd2/box_ai_bg",
			color = Color.white,
			alpha = 0,
			y = 0,
			w = teammate_panel:w()
		})
		box_ai_bg:set_bottom(name:top())
		local box_bg = teammate_panel:bitmap({
			visible = false,
			name = "box_bg",
			texture = "guis/textures/pd2/box_bg",
			color = Color.white,
			y = 0,
			w = teammate_panel:w()
		})
		box_bg:set_bottom(name:top())
		local texture, rect = tweak_data.hud_icons:get_icon_data("pd2_mask_" .. i)
		local size = 64
		local mask_pad = 2
		local mask_pad_x = 3
		local y = teammate_panel:h() - name:h() - size + mask_pad
		local mask = teammate_panel:bitmap({
			visible = false,
			name = "mask",
			layer = 1,
			color = Color.white,
			texture = texture,
			texture_rect = rect,
			x = -mask_pad_x,
			w = size,
			h = size,
			y = y
		})
		local radial_size = main_player and 64 or 48
		local radial_health_panel = self._player_panel:panel({
			name = "radial_health_panel",
			layer = 1,
			w = radial_size + 4,
			h = (radial_size + 4) * 2,
			x = 0,
			y = mask:y()
		})
		radial_health_panel:set_bottom(self._player_panel:h())
		local radial_bg = radial_health_panel:bitmap({
			name = "radial_bg",
			texture = "guis/textures/pd2/hud_radialbg",
			alpha = 1,
			w = radial_health_panel:w(),
			h = radial_health_panel:h() / 2,
			y = radial_health_panel:y() + radial_health_panel:h() / 2 + 16,
			layer = 0
		})
		local radial_health = radial_health_panel:bitmap({
			name = "radial_health",
			texture = "guis/textures/pd2/hud_health",
			texture_rect = {
				64,
				0,
				-64,
				64
			},
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			alpha = 1,
			w = radial_health_panel:w(),
			y = radial_health_panel:y() + radial_health_panel:h() / 2 + 16,
			h = radial_health_panel:h() / 2,
			layer = 2
		})
		radial_health:set_color(Color(1, 1, 0, 0))
		local radial_shield = radial_health_panel:bitmap({
			name = "radial_shield",
			texture = "guis/textures/pd2/hud_shield",
			texture_rect = {
				64,
				0,
				-64,
				64
			},
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			alpha = 1,
			w = radial_health_panel:w(),
			y = radial_health_panel:y() + radial_health_panel:h() / 2 + 16,
			h = radial_health_panel:h() / 2,
			layer = 1
		})
		radial_shield:set_color(Color(1, 1, 0, 0))
		local damage_indicator = radial_health_panel:bitmap({
			name = "damage_indicator",
			texture = "guis/textures/pd2/hud_radial_rim",
			blend_mode = "add",
			alpha = 0,
			w = radial_health_panel:w(),
			y = radial_health_panel:y() + radial_health_panel:h() / 2 + 16,
			h = radial_health_panel:h() / 2,
			layer = 1
		})
		damage_indicator:set_color(Color(1, 1, 1, 1))
		local radial_custom = radial_health_panel:bitmap({
			name = "radial_custom",
			texture = "guis/textures/pd2/hud_swansong",
			texture_rect = {
				0,
				0,
				64,
				64
			},
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			alpha = 1,
			w = radial_health_panel:w(),
			y = radial_health_panel:y() + radial_health_panel:h() / 2 + 16,
			h = radial_health_panel:h() / 2,
			layer = 2
		})
		radial_custom:set_color(Color(1, 0, 0, 0))
		radial_custom:hide()



		local radial_bleeding = radial_health_panel:bitmap({
			name = "bleeding_bg",
			texture = "guis/textures/pd2/hud_stealth_exclam",
			visible = true,
			texture_rect = {
				0,
				0,
				64,
				64
			},
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			alpha = 1,
			x = radial_health_panel:x() + radial_health_panel:w() / 4,
			w = radial_health_panel:w(),
			y = radial_health_panel:y() + radial_health_panel:h() / 2 + 32,
			h = radial_health_panel:h() / 2,
			layer = 3
		})
		radial_bleeding:set_color(Color(1, 0.5, 1, 1))
		radial_bleeding:set_visible(true)



		local x, y, w, h = radial_health_panel:shape()
		teammate_panel:bitmap({
			name = "condition_icon",
			layer = 4,
			visible = false,
			color = Color.white,
			x = x,
			y = y,
			w = w,
			h = h
		})
		local condition_timer = teammate_panel:text({
			name = "condition_timer",
			visible = false,
			text = "000",
			layer = 5,
			color = Color.white,
			y = 0,
			align = "center",
			vertical = "center",
			font_size = tweak_data.hud_players.timer_size,
			font = tweak_data.hud_players.timer_font
		})
		condition_timer:set_shape(radial_health_panel:shape())

		local numbers_panel = self._player_panel:panel({
			name = "numbers_panel",
			layer = 1,
			w = radial_size + 4,
			h = radial_size + 4,
			x = 0,
			y = mask:y() - radial_size - 4
		})
		if ArmorOverhaul.options.gui_health then
			local hp_text = numbers_panel:text({
				name = "hp_text",
				visible = true,
				text = "",
				layer = 5,
				color = Color.green,
				y = 16,
				align = "right",
				vertical = "top",
				font_size = 16,
				font = tweak_data.hud_players.timer_font
			})
		end

		if ArmorOverhaul.options.gui_armor then
			local armor_text = numbers_panel:text({
				name = "armor_text",
				visible = true,
				text = "",
				layer = 5,
				color = Color.blue,
				y = 32,
				align = "right",
				vertical = "top",
				font_size = 16,
				font = tweak_data.hud_players.timer_font
			})
		end
			local doom_armor_text = numbers_panel:text({
				name = "doom_armor_text",
				visible = true,
				text = "doom",
				layer = 5,
				color = Color.red,
				y = 48,
				align = "right",
				vertical = "top",
				font_size = 16,
				font = tweak_data.hud_players.timer_font
			})

		local w_selection_w = 12
		local weapon_panel_w = 80
		local extra_clip_w = 4
		local ammo_text_w = (weapon_panel_w - w_selection_w) / 2
		local font_bottom_align_correction = 3
		local tabs_texture = "guis/textures/pd2/hud_tabs"
		local bg_rect = {
			0,
			0,
			67,
			32
		}
		local weapon_selection_rect1 = {
			68,
			0,
			12,
			32
		}
		local weapon_selection_rect2 = {
			68,
			32,
			12,
			32
		}
		local weapons_panel = self._player_panel:panel({
			name = "weapons_panel",
			visible = true,
			layer = 0,
			w = weapon_panel_w,
			h = radial_health_panel:h() / 2,
			x = radial_health_panel:right() + 4,
			y = radial_health_panel:y() + radial_health_panel:h() / 2
		})
		local primary_weapon_panel = weapons_panel:panel({
			name = "primary_weapon_panel",
			visible = false,
			layer = 1,
			w = weapon_panel_w,
			h = 32,
			x = 0,
			y = 0
		})
		primary_weapon_panel:bitmap({
			name = "bg",
			texture = tabs_texture,
			texture_rect = bg_rect,
			visible = true,
			layer = 0,
			color = bg_color,
			w = weapon_panel_w,
			x = 0
		})
		primary_weapon_panel:text({
			name = "ammo_clip",
			visible = main_player and true,
			text = "0" .. math.random(40),
			color = Color.white,
			blend_mode = "normal",
			layer = 1,
			w = ammo_text_w + extra_clip_w,
			h = primary_weapon_panel:h(),
			x = 0,
			y = 0 + font_bottom_align_correction,
			vertical = "bottom",
			align = "center",
			font_size = 32,
			font = tweak_data.hud_players.ammo_font
		})
		primary_weapon_panel:text({
			name = "ammo_total",
			visible = true,
			text = "000",
			color = Color.white,
			blend_mode = "normal",
			layer = 1,
			w = ammo_text_w - extra_clip_w,
			h = primary_weapon_panel:h(),
			x = ammo_text_w + extra_clip_w,
			y = 0 + font_bottom_align_correction,
			vertical = "bottom",
			align = "center",
			font_size = 24,
			font = tweak_data.hud_players.ammo_font
		})
		local weapon_selection_panel = primary_weapon_panel:panel({
			name = "weapon_selection",
			layer = 1,
			visible = main_player and true,
			w = w_selection_w,
			x = weapon_panel_w - w_selection_w
		})
		weapon_selection_panel:bitmap({
			name = "weapon_selection",
			texture = tabs_texture,
			texture_rect = weapon_selection_rect1,
			color = Color.white,
			w = w_selection_w
		})
		self:_create_primary_weapon_firemode()
		if not main_player then
			local ammo_total = primary_weapon_panel:child("ammo_total")
			local _x, _y, _w, _h = ammo_total:text_rect()
			primary_weapon_panel:set_size(_w + 8, _h)
			ammo_total:set_shape(0, 0, primary_weapon_panel:size())
			ammo_total:move(0, font_bottom_align_correction)
			primary_weapon_panel:set_x(0)
			primary_weapon_panel:set_bottom(weapons_panel:h())
			local eq_rect = {
				84,
				0,
				44,
				32
			}
			primary_weapon_panel:child("bg"):set_image(tabs_texture, eq_rect[1], eq_rect[2], eq_rect[3], eq_rect[4])
			primary_weapon_panel:child("bg"):set_size(primary_weapon_panel:size())
		end
		local secondary_weapon_panel = weapons_panel:panel({
			name = "secondary_weapon_panel",
			visible = false,
			layer = 1,
			w = weapon_panel_w,
			h = 32,
			x = 0,
			y = primary_weapon_panel:bottom()
		})
		secondary_weapon_panel:bitmap({
			name = "bg",
			texture = tabs_texture,
			texture_rect = bg_rect,
			visible = true,
			layer = 0,
			color = bg_color,
			w = weapon_panel_w,
			x = 0
		})
		secondary_weapon_panel:text({
			name = "ammo_clip",
			visible = main_player and true,
			text = "" .. math.random(40),
			color = Color.white,
			blend_mode = "normal",
			layer = 1,
			w = ammo_text_w + extra_clip_w,
			h = secondary_weapon_panel:h(),
			x = 0,
			y = 0 + font_bottom_align_correction,
			vertical = "bottom",
			align = "center",
			font_size = 32,
			font = tweak_data.hud_players.ammo_font
		})
		secondary_weapon_panel:text({
			name = "ammo_total",
			visible = true,
			text = "000",
			color = Color.white,
			blend_mode = "normal",
			layer = 1,
			w = ammo_text_w - extra_clip_w,
			h = secondary_weapon_panel:h(),
			x = ammo_text_w + extra_clip_w,
			y = 0 + font_bottom_align_correction,
			vertical = "bottom",
			align = "center",
			font_size = 24,
			font = tweak_data.hud_players.ammo_font
		})
		local weapon_selection_panel = secondary_weapon_panel:panel({
			name = "weapon_selection",
			layer = 1,
			visible = main_player and true,
			w = w_selection_w,
			x = weapon_panel_w - w_selection_w
		})
		weapon_selection_panel:bitmap({
			name = "weapon_selection",
			texture = tabs_texture,
			texture_rect = weapon_selection_rect2,
			color = Color.white,
			w = w_selection_w
		})
		secondary_weapon_panel:set_bottom(weapons_panel:h())
		self:_create_secondary_weapon_firemode()
		if not main_player then
			local ammo_total = secondary_weapon_panel:child("ammo_total")
			local _x, _y, _w, _h = ammo_total:text_rect()
			secondary_weapon_panel:set_size(_w + 8, _h)
			ammo_total:set_shape(0, 0, secondary_weapon_panel:size())
			ammo_total:move(0, font_bottom_align_correction)
			secondary_weapon_panel:set_x(primary_weapon_panel:right())
			secondary_weapon_panel:set_bottom(weapons_panel:h())
			local eq_rect = {
				84,
				0,
				44,
				32
			}
			secondary_weapon_panel:child("bg"):set_image(tabs_texture, eq_rect[1], eq_rect[2], eq_rect[3], eq_rect[4])
			secondary_weapon_panel:child("bg"):set_size(secondary_weapon_panel:size())
		end
		local eq_rect = {
			84,
			0,
			44,
			32
		}
		local temp_scale = 1
		local eq_h = 64 / (PlayerBase.USE_GRENADES and 3 or 2)
		local eq_w = 48
		local eq_tm_scale = PlayerBase.USE_GRENADES and 1 or 0.75
		local deployable_equipment_panel = self._player_panel:panel({
			name = "deployable_equipment_panel",
			layer = 1,
			w = eq_w,
			h = eq_h,
			x = weapons_panel:right() + 4,
			y = weapons_panel:y()
		})
		deployable_equipment_panel:bitmap({
			name = "bg",
			texture = tabs_texture,
			texture_rect = eq_rect,
			visible = true,
			layer = 0,
			color = bg_color,
			w = deployable_equipment_panel:w(),
			x = 0
		})
		local equipment = deployable_equipment_panel:bitmap({
			name = "equipment",
			visible = false,
			layer = 1,
			color = Color.white,
			w = deployable_equipment_panel:h() * temp_scale,
			h = deployable_equipment_panel:h() * temp_scale,
			x = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2,
			y = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2
		})
		local amount = deployable_equipment_panel:text({
			name = "amount",
			visible = false,
			text = tostring(12),
			font = "fonts/font_medium_mf",
			font_size = 22,
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2,
			x = -2,
			y = 2,
			w = deployable_equipment_panel:w(),
			h = deployable_equipment_panel:h()
		})
		if not main_player then
			local scale = eq_tm_scale
			deployable_equipment_panel:set_size(deployable_equipment_panel:w() * 0.9, deployable_equipment_panel:h() * scale)
			equipment:set_size(equipment:w() * scale, equipment:h() * scale)
			equipment:set_center_y(deployable_equipment_panel:h() / 2)
			equipment:set_x(equipment:x() + 4)
			amount:set_center_y(deployable_equipment_panel:h() / 2)
			amount:set_right(deployable_equipment_panel:w() - 4)
			deployable_equipment_panel:set_x(weapons_panel:right() - 8)
			deployable_equipment_panel:set_bottom(weapons_panel:bottom())
			local bg = deployable_equipment_panel:child("bg")
			bg:set_size(deployable_equipment_panel:size())
		end
		local texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.equipments.specials.cable_tie.icon)
		local cable_ties_panel = self._player_panel:panel({
			name = "cable_ties_panel",
			visible = true,
			layer = 1,
			w = eq_w,
			h = eq_h,
			x = weapons_panel:right() + 4,
			y = weapons_panel:y()
		})
		cable_ties_panel:bitmap({
			name = "bg",
			texture = tabs_texture,
			texture_rect = eq_rect,
			visible = true,
			layer = 0,
			color = bg_color,
			w = deployable_equipment_panel:w(),
			x = 0
		})
		local cable_ties = cable_ties_panel:bitmap({
			name = "cable_ties",
			visible = false,
			texture = texture,
			texture_rect = rect,
			layer = 1,
			color = Color.white,
			w = deployable_equipment_panel:h() * temp_scale,
			h = deployable_equipment_panel:h() * temp_scale,
			x = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2,
			y = -(deployable_equipment_panel:h() * temp_scale - deployable_equipment_panel:h()) / 2
		})
		local amount = cable_ties_panel:text({
			name = "amount",
			visible = false,
			text = tostring(12),
			font = "fonts/font_medium_mf",
			font_size = 22,
			color = Color.white,
			align = "right",
			vertical = "center",
			layer = 2,
			x = -2,
			y = 2,
			w = deployable_equipment_panel:w(),
			h = deployable_equipment_panel:h()
		})
		if PlayerBase.USE_GRENADES then
			cable_ties_panel:set_center_y(weapons_panel:center_y())
		else
			cable_ties_panel:set_bottom(weapons_panel:bottom())
		end
		if not main_player then
			local scale = eq_tm_scale
			cable_ties_panel:set_size(cable_ties_panel:w() * 0.9, cable_ties_panel:h() * scale)
			cable_ties:set_size(cable_ties:w() * scale, cable_ties:h() * scale)
			cable_ties:set_center_y(cable_ties_panel:h() / 2)
			cable_ties:set_x(cable_ties:x() + 4)
			amount:set_center_y(cable_ties_panel:h() / 2)
			amount:set_right(cable_ties_panel:w() - 4)
			cable_ties_panel:set_x(deployable_equipment_panel:right())
			cable_ties_panel:set_bottom(deployable_equipment_panel:bottom())
			local bg = cable_ties_panel:child("bg")
			bg:set_size(cable_ties_panel:size())
		end
		if PlayerBase.USE_GRENADES then
			local texture, rect = tweak_data.hud_icons:get_icon_data("frag_grenade")
			local grenades_panel = self._player_panel:panel({
				name = "grenades_panel",
				visible = true,
				layer = 1,
				w = eq_w,
				h = eq_h,
				x = weapons_panel:right() + 4,
				y = weapons_panel:y()
			})
			grenades_panel:bitmap({
				name = "bg",
				texture = tabs_texture,
				texture_rect = eq_rect,
				visible = true,
				layer = 0,
				color = bg_color,
				w = cable_ties_panel:w(),
				x = 0
			})
			local grenades = grenades_panel:bitmap({
				name = "grenades",
				visible = true,
				texture = texture,
				texture_rect = rect,
				layer = 1,
				color = Color.white,
				w = cable_ties_panel:h() * temp_scale,
				h = cable_ties_panel:h() * temp_scale,
				x = -(cable_ties_panel:h() * temp_scale - cable_ties_panel:h()) / 2,
				y = -(cable_ties_panel:h() * temp_scale - cable_ties_panel:h()) / 2
			})
			local amount = grenades_panel:text({
				name = "amount",
				visible = true,
				text = tostring("03"),
				font = "fonts/font_medium_mf",
				font_size = 22,
				color = Color.white,
				align = "right",
				vertical = "center",
				layer = 2,
				x = -2,
				y = 2,
				w = grenades_panel:w(),
				h = grenades_panel:h()
			})
			grenades_panel:set_bottom(weapons_panel:bottom())
			if not main_player then
				local scale = eq_tm_scale
				grenades_panel:set_size(grenades_panel:w() * 0.9, grenades_panel:h() * scale)
				grenades:set_size(grenades:w() * scale, grenades:h() * scale)
				grenades:set_center_y(grenades_panel:h() / 2)
				grenades:set_x(grenades:x() + 4)
				amount:set_center_y(grenades_panel:h() / 2)
				amount:set_right(grenades_panel:w() - 4)
				grenades_panel:set_x(cable_ties_panel:right())
				grenades_panel:set_bottom(cable_ties_panel:bottom())
				local bg = grenades_panel:child("bg")
				bg:set_size(grenades_panel:size())
			end
		end
		local bag_rect = {
			32,
			33,
			32,
			31
		}
		local bg_rect = {
			84,
			0,
			44,
			32
		}
		local bag_w = bag_rect[3]
		local bag_h = bag_rect[4]
		local carry_panel = self._player_panel:panel({
			name = "carry_panel",
			visible = false,
			layer = 1,
			w = bag_w,
			h = bag_h + 2,
			x = 0,
			y = radial_health_panel:top() - bag_h
		})
		carry_panel:set_x(24 - bag_w / 2)
		carry_panel:set_center_x(radial_health_panel:center_x())
		carry_panel:bitmap({
			name = "bg",
			texture = tabs_texture,
			texture_rect = bg_rect,
			visible = false,
			layer = 0,
			color = bg_color,
			x = 0,
			y = 0,
			w = 100,
			h = carry_panel:h()
		})
		carry_panel:bitmap({
			name = "bag",
			texture = tabs_texture,
			w = bag_w,
			h = bag_h,
			texture_rect = bag_rect,
			visible = true,
			layer = 0,
			color = Color.white,
			x = 1,
			y = 1
		})
		carry_panel:text({
			name = "value",
			visible = false,
			text = "",
			layer = 0,
			color = Color.white,
			x = bag_rect[3] + 4,
			y = 0,
			vertical = "center",
			font_size = tweak_data.hud.small_font_size,
			font = "fonts/font_small_mf"
		})
		local interact_panel = self._player_panel:panel({
			name = "interact_panel",
			visible = false,
			layer = 3
		})
		interact_panel:set_shape(weapons_panel:shape())
		interact_panel:set_shape(radial_health_panel:shape())
		interact_panel:set_size(radial_size * 1.25, radial_size * 1.25)
		interact_panel:set_center(radial_health_panel:center())
		local radius = interact_panel:h() / 2 - 4
		self._interact = CircleBitmapGuiObject:new(interact_panel, {
			use_bg = true,
			rotation = 360,
			radius = radius,
			blend_mode = "add",
			color = Color.white,
			layer = 0
		})
		self._interact:set_position(4, 4)
		self._special_equipment = {}
		
		ocal bar_health_panel = self._player_panel:panel({
			name = "bar_health_panel",
			layer = 1,
			w = radial_size + 4,
			h = radial_size + 4,
			x = 0,
			y = mask:y() - 256
		})
		bar_health_panel:set_bottom(self._player_panel:h() - radial_health_panel.h - 4)
		local hp_text = bar_health_panel:text({
			name = "hp_text",
			visible = true,
			text = "230",
			layer = 5,
			color = Color.green,
			y = -9,
			align = "center",
			vertical = "center",
			font_size = 16,
			font = tweak_data.hud_players.timer_font
		})
		local armor_text = bar_health_panel:text({
			name = "armor_text",
			visible = true,
			text = "20",
			layer = 5,
			color = Color.blue,
			y = 9,
			align = "center",
			vertical = "center",
			font_size = 16,
			font = tweak_data.hud_players.timer_font
		})]]--[[

		self._panel = teammate_panel
	end
end]]

--[[function HUDTeammate:set_health(data)
	local teammate_panel = self._panel:child("player")
	local radial_health_panel = teammate_panel:child("radial_health_panel")
	local radial_health = radial_health_panel:child("radial_health")
	local red = data.current / data.total
	if not ArmorOverhaul then
		if red < radial_health:color().red then
			self:_damage_taken()
		end
	end
	radial_health:set_color(Color(1, red, 1, 1))

	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
	if ArmorOverhaul.options.gui_health then

		local cur_health = string.remove_zeros("%0.2f", data.current*10)
		local max_health = string.remove_zeros("%0.2f", data.total*10)
		if hud.panel:child("ArmorOverhaul"):child("hp_text") then
			hud.panel:child("ArmorOverhaul"):child("hp_text"):set_text(cur_health .. " / " .. max_health)
		end
	end

	local bleeding_panel = hud.panel:child("bleeding_text")
	if bleeding_panel then bleeding_panel:set_text(data.bleeding and "Bleeding !" or "") end
end

function HUDTeammate:set_armor(data)
	local teammate_panel = self._panel:child("player")
	local radial_health_panel = teammate_panel:child("radial_health_panel")
	local radial_shield = radial_health_panel:child("radial_shield")
	local red = data.current / data.total
	if not ArmorOverhaul then
		if red < radial_shield:color().red then
			self:_damage_taken()
		end
	end
	radial_shield:set_color(Color(1, red, 1, 1))

	if ArmorOverhaul.options.gui_armor then
	local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)

		local cur_armor = string.remove_zeros("%0.2f", data.current*10)
		local max_armor = string.remove_zeros("%0.2f", data.total*10)
		if hud.panel:child("ArmorOverhaul"):child("armor_text") then
			hud.panel:child("ArmorOverhaul"):child("armor_text"):set_text(cur_armor .. " / " .. max_armor)
		end
	end
end]]