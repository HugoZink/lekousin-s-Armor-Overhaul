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

function BlackMarketGui:_setup(is_start_page, component_data)
	self.loaded = false
	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end
	self._item_bought = nil
	self._panel = self._ws:panel():panel({})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({layer = 40})
	self:set_layer(45)
	self._disabled_panel = self._fullscreen_panel:panel({layer = 100})
	WalletGuiObject.set_wallet(self._panel)
	self._data = component_data or self:_start_page_data()
	self._node:parameters().menu_component_data = self._data
	if self._data.init_callback_name then
		local clbk_func = callback(self, self, self._data.init_callback_name, self._data.init_callback_params)
		if clbk_func then
			clbk_func()
		end
		if self._data.init_callback_params and self._data.init_callback_params.run_once then
			self._data.init_callback_name = nil
			self._data.init_callback_params = nil
		end
	end
	self._data.blur_fade = self._data.blur_fade or 0
	local blur = self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._fullscreen_ws:panel():w(),
		h = self._fullscreen_ws:panel():h(),
		render_template = "VertexColorTexturedBlur3D",
		layer = -1
	})
	local func = function(o, component_data)
		local start_blur = component_data.blur_fade
		over(0.6 - 0.6 * component_data.blur_fade, function(p)
			component_data.blur_fade = math.lerp(start_blur, 1, p)
			o:set_alpha(component_data.blur_fade)
		end
)
	end

	blur:animate(func, self._data)
	self._panel:text({
		name = "back_button",
		text = utf8.to_upper(managers.localization:text("menu_back")),
		align = "right",
		vertical = "bottom",
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.button_stage_3
	})
	self:make_fine_text(self._panel:child("back_button"))
	self._panel:child("back_button"):set_right(self._panel:w())
	self._panel:child("back_button"):set_bottom(self._panel:h())
	self._panel:child("back_button"):set_visible(managers.menu:is_pc_controller())
	self._pages = #self._data > 1 or self._data.show_tabs
	local grid_panel_w = self._panel:w() * WIDTH_MULTIPLIER
	local grid_panel_h = (self._panel:h() - (medium_font_size + 10) - 60) * GRID_H_MUL
	grid_panel_w = math.round(grid_panel_w / 3) * 3
	grid_panel_h = math.round(grid_panel_h / 3) * 3
	local square_w = grid_panel_w / 3
	local square_h = grid_panel_h / 3
	local padding_w = 0
	local padding_h = 0
	local left_padding = 0
	local top_padding = 60
	local size_data = {}
	size_data.grid_w = math.floor(grid_panel_w)
	size_data.grid_h = math.floor(grid_panel_h)
	size_data.square_w = math.floor(square_w)
	size_data.square_h = math.floor(square_h)
	size_data.padding_w = math.floor(padding_w)
	size_data.padding_h = math.floor(padding_h)
	size_data.left_padding = math.floor(left_padding)
	size_data.top_padding = math.floor(top_padding)
	self._inception_node_name = self._node:parameters().menu_component_next_node_name or "blackmarket_node"
	self._preview_node_name = self._node:parameters().menu_component_preview_node_name or "blackmarket_preview_node"
	self._tabs = {}
	self._btns = {}
	self._title_text = self._panel:text({
		name = "title_text",
		text = utf8.to_upper(managers.localization:text(self._data.topic_id, self._data.topic_params)),
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.text
	})
	self:make_fine_text(self._title_text)
	self._tab_scroll_panel = self._panel:panel({
		w = grid_panel_w,
		y = top_padding + 1
	})
	self._tab_area_panel = self._panel:panel({
		w = grid_panel_w,
		y = top_padding + 1
	})
	self._tab_scroll_table = {
		panel = self._tab_scroll_panel
	}
	for i, data in ipairs(self._data) do
		if data.on_create_func_name then
			data.on_create_func = callback(self, self, data.on_create_func_name)
		end
		local new_tab = BlackMarketGuiTabItem:new(self._panel, data, self._node, size_data, not self._pages, self._tab_scroll_table)
		table.insert(self._tabs, new_tab)
	end
	if self._data.open_callback_name then
		local clbk_func = callback(self, self, self._data.open_callback_name, self._data.open_callback_params)
		if clbk_func then
			clbk_func()
		end
	end
	if 0 < #self._tabs then
		self._tab_area_panel:set_h(self._tabs[#self._tabs]._tab_panel:h())
	end
	self._selected = self._node:parameters().menu_component_selected or 1
	self._select_rect = self._panel:panel({
		name = "select_rect",
		w = square_w,
		h = square_h,
		layer = 8
	})
	if self._tabs[self._selected] then
		self._tabs[self._selected]:select(true)
		local slot_dim_x = self._tabs[self._selected].my_slots_dimensions[1]
		local slot_dim_y = self._tabs[self._selected].my_slots_dimensions[2]
		self._select_rect:set_size(square_w * 3 / slot_dim_x, square_h * 3 / slot_dim_y)
		self._select_rect_box = BoxGuiObject:new(self._select_rect, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
		self._select_rect_box:set_clipping(false)
		self._box_panel = self._panel:panel()
		self._box_panel:set_shape(self._tabs[self._selected]._grid_panel:shape())
		self._box = BoxGuiObject:new(self._box_panel, {
			sides = {
				1,
				1,
				1 + (1 < #self._tabs and 1 or 0),
				1
			}
		})
		local info_box_panel = self._panel:panel({
			name = "info_box_panel"
		})
		info_box_panel:set_size(self._panel:w() * (1 - WIDTH_MULTIPLIER) - BOX_GAP, self._box_panel:h())
		info_box_panel:set_right(self._panel:w())
		info_box_panel:set_top(self._box_panel:top())
		self._selected_slot = self._tabs[self._selected]:select_slot(nil, true)
		self._slot_data = self._selected_slot._data
		local x, y = self._tabs[self._selected]:selected_slot_center()
		self._select_rect:set_world_center(x, y)
		local BTNS = {
			w_move = {
				prio = managers.menu:is_pc_controller() and 5 or 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_move_weapon",
				callback = callback(self, self, "pickup_crafted_item_callback")
			},
			w_place = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_place_weapon",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			w_swap = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_swap_weapon",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			m_move = {
				prio = 5,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_move_mask",
				callback = callback(self, self, "pickup_crafted_item_callback")
			},
			m_place = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_place_mask",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			m_swap = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_swap_mask",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			i_stop_move = {
				prio = 2,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_stop_move",
				callback = callback(self, self, "drop_hold_crafted_item_callback")
			},
			i_rename = {
				prio = 2,
				btn = "BTN_BACK",
				pc_btn = Idstring("toggle_chat"),
				name = "bm_menu_btn_rename_item",
				callback = callback(self, self, "rename_item_with_gamepad_callback")
			},
			w_mod = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_btn_mod",
				callback = callback(self, self, "choose_weapon_mods_callback")
			},
			w_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_weapon",
				callback = callback(self, self, "equip_weapon_callback")
			},
			w_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview",
				callback = callback(self, self, "preview_weapon_callback")
			},
			w_sell = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell",
				callback = callback(self, self, "sell_item_callback")
			},
			ew_unlock = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_weapon_slot",
				callback = callback(self, self, "choose_weapon_slot_unlock_callback")
			},
			ew_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_new_weapon",
				callback = callback(self, self, "choose_weapon_buy_callback")
			},
			bw_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_selected_weapon",
				callback = callback(self, self, "buy_weapon_callback")
			},
			bw_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview",
				callback = callback(self, self, "preview_buy_weapon_callback")
			},
			bw_available_mods = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_available_mods",
				callback = callback(self, self, "show_available_mods_callback")
			},
			bw_buy_dlc = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_buy_dlc",
				callback = callback(self, self, "show_buy_dlc_callback")
			},
			mt_choose = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_choose",
				callback = callback(self, self, "choose_mod_callback")
			},
			wm_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_craft_mod",
				callback = callback(self, self, "buy_mod_callback")
			},
			wm_preview = {
				prio = 3,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_btn_preview",
				callback = callback(self, self, "preview_weapon_callback")
			},
			wm_preview_mod = {
				prio = 4,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_with_mod",
				callback = callback(self, self, "preview_weapon_with_mod_callback")
			},
			wm_remove_buy = {
				prio = 2,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_remove_mod",
				callback = callback(self, self, "remove_mod_callback")
			},
			wm_remove_preview_mod = {
				prio = 4,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_with_mod",
				callback = callback(self, self, "preview_weapon_callback")
			},
			wm_remove_preview = {
				prio = 3,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_btn_preview_no_mod",
				callback = callback(self, self, "preview_weapon_without_mod_callback")
			},
			wm_sell = {
				prio = 2,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell",
				callback = callback(self, self, "sell_weapon_mods_callback")
			},
			wm_reticle_switch_menu = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = Idstring("bm_menu_btn_craft_mod"),
				name = "bm_menu_btn_switch_reticle",
				callback = callback(self, self, "open_reticle_switch_menu")
			},
			a_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_armor",
				callback = callback(self, self, "equip_armor_callback")
			},
			m_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_mask",
				callback = callback(self, self, "equip_mask_callback")
			},
			m_mod = {
				prio = 2,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_btn_mod_mask",
				callback = callback(self, self, "mask_mods_callback")
			},
			m_preview = {
				prio = 3,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_mask_callback")
			},
			m_sell = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell_mask",
				callback = callback(self, self, "sell_mask_callback")
			},
			m_remove = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_remove_mask",
				callback = callback(self, self, "remove_mask_callback")
			},
			em_gv = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_new_mask",
				callback = callback(self, self, "choose_mask_global_value_callback")
			},
			em_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_new_mask",
				callback = callback(self, self, "choose_mask_buy_callback")
			},
			em_unlock = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_mask_slot",
				callback = callback(self, self, "choose_mask_slot_unlock_callback")
			},
			em_available_mods = {
				prio = 3,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_preview_item_alt"),
				name = "bm_menu_buy_mask_title",
				callback = callback(self, self, "show_available_mask_mods_callback")
			},
			mm_choose_textures = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = "",
				name = "bm_menu_choose_pattern",
				callback = callback(self, self, "choose_mask_mod_callback", "textures")
			},
			mm_choose_materials = {
				prio = 2,
				btn = "BTN_A",
				pc_btn = "",
				name = "bm_menu_choose_material",
				callback = callback(self, self, "choose_mask_mod_callback", "materials")
			},
			mm_choose_colors = {
				prio = 3,
				btn = "BTN_A",
				pc_btn = "",
				name = "bm_menu_choose_color",
				callback = callback(self, self, "choose_mask_mod_callback", "colors")
			},
			mm_choose = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_choose_mask_mod",
				callback = callback(self, self, "choose_mask_type_callback")
			},
			mm_buy = {
				prio = 5,
				btn = "BTN_Y",
				pc_btn = Idstring("menu_modify_item"),
				name = "bm_menu_btn_customize_mask",
				callback = callback(self, self, "buy_customized_mask_callback")
			},
			mm_preview = {
				prio = 4,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_choose = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_choose_mask_mod",
				callback = callback(self, self, "choose_mask_part_callback")
			},
			mp_preview = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_preview_mod = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_customized_mask_with_mod_callback")
			},
			bm_buy = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_buy_selected_mask",
				callback = callback(self, self, "buy_mask_callback")
			},
			bm_preview = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_mask",
				callback = callback(self, self, "preview_buy_mask_callback")
			},
			bm_sell = {
				prio = 4,
				btn = "BTN_X",
				pc_btn = Idstring("menu_remove_item"),
				name = "bm_menu_btn_sell_mask",
				callback = callback(self, self, "sell_stashed_mask_callback")
			},
			c_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_set_preferred",
				callback = callback(self, self, "set_preferred_character_callback")
			},
			lo_w_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_weapon",
				callback = callback(self, self, "equip_weapon_callback")
			},
			lo_d_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_deployable",
				callback = callback(self, self, "lo_equip_deployable_callback")
			},
			lo_mw_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_melee_weapon",
				callback = callback(self, self, "lo_equip_melee_weapon_callback")
			},
			lo_mw_preview = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_melee_weapon",
				callback = callback(self, self, "preview_melee_weapon_callback")
			},
			lo_g_equip = {
				prio = 1,
				btn = "BTN_A",
				pc_btn = nil,
				name = "bm_menu_btn_equip_grenade",
				callback = callback(self, self, "lo_equip_grenade_callback")
			},
			lo_g_preview = {
				prio = 2,
				btn = "BTN_STICK_R",
				pc_btn = Idstring("menu_preview_item"),
				name = "bm_menu_btn_preview_grenade",
				callback = callback(self, self, "preview_grenade_callback")
			},
			a_page_up = {
				prio = 1,
				btn = "BTN_BOTTOM_L",
				pc_btn = nil,
				name = "bm_menu_btn_page_up_armor",
				callback = callback(self, self, "armor_page_up")
			},
			a_page_down = {
				prio = 1,
				btn = "BTN_BOTTOM_R",
				pc_btn = nil,
				name = "bm_menu_btn_page_down_armor",
				callback = callback(self, self, "armor_page_down")
			}
		}
		local get_real_font_sizes = false
		local real_small_font_size = small_font_size
		if get_real_font_sizes then
			local test_text = self._panel:text({
				font = small_font,
				font_size = small_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L"),
				visible = false
			})
			local x, y, w, h = test_text:text_rect()
			real_small_font_size = h
			self._panel:remove(test_text)
			test_text = nil
		end
		self._real_small_font_size = real_small_font_size
		local real_medium_font_size = medium_font_size
		if get_real_font_sizes then
			local test_text = self._panel:text({
				font = medium_font,
				font_size = medium_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L"),
				visible = false
			})
			local x, y, w, h = test_text:text_rect()
			real_medium_font_size = h
			Global.test_text = test_text
		end
		self._real_medium_font_size = real_medium_font_size
		self._weapon_info_panel = self._panel:panel({
			x = info_box_panel:x(),
			y = info_box_panel:y(),
			w = info_box_panel:w(),
			h = info_box_panel:h()
		})
		self._detection_panel = self._panel:panel({
			name = "suspicion_panel",
			layer = 1,
			x = info_box_panel:x(),
			y = info_box_panel:y() + 250,
			w = info_box_panel:w(),
			h = 64
		})
		self._btn_panel = self._panel:panel({
			name = "btn_panel",
			x = info_box_panel:x(),
			w = info_box_panel:w(),
			h = 136
		})
		self._weapon_info_panel:set_h(info_box_panel:h() - self._btn_panel:h() - 8 - self._detection_panel:h() - 8) 
		self._detection_panel:set_y(self._weapon_info_panel:bottom() + 8)
		self._btn_panel:set_top(self._detection_panel:bottom() + 8)
		self._weapon_info_border = BoxGuiObject:new(self._weapon_info_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._detection_border = BoxGuiObject:new(self._detection_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._button_border = BoxGuiObject:new(self._btn_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		local scale = 0.75
		local detection_ring_left_bg = self._detection_panel:bitmap({
			name = "detection_left_bg",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			alpha = 0.2,
			blend_mode = "add",
			layer = 1,
			x = 8,
			w = 64,
			h = 64
		})
		local detection_ring_right_bg = self._detection_panel:bitmap({
			name = "detection_right_bg",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			alpha = 0.2,
			blend_mode = "add",
			layer = 1,
			x = 8,
			w = 64,
			h = 64
		})
		detection_ring_left_bg:set_size(detection_ring_left_bg:w() * scale, detection_ring_left_bg:h() * scale)
		detection_ring_right_bg:set_size(detection_ring_right_bg:w() * scale, detection_ring_right_bg:h() * scale)
		detection_ring_right_bg:set_texture_rect(64, 0, -64, 64)
		detection_ring_left_bg:set_center_y(self._detection_panel:h() / 2)
		detection_ring_right_bg:set_center_y(self._detection_panel:h() / 2)
		local detection_ring_left = self._detection_panel:bitmap({
			name = "detection_left",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			layer = 1,
			x = 8,
			w = 64,
			h = 64
		})
		local detection_ring_right = self._detection_panel:bitmap({
			name = "detection_right",
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			render_template = "VertexColorTexturedRadial",
			blend_mode = "add",
			layer = 1,
			x = 8,
			w = 64,
			h = 64
		})
		detection_ring_left:set_size(detection_ring_left:w() * scale, detection_ring_left:h() * scale)
		detection_ring_right:set_size(detection_ring_right:w() * scale, detection_ring_right:h() * scale)
		detection_ring_right:set_texture_rect(64, 0, -64, 64)
		detection_ring_left:set_center_y(self._detection_panel:h() / 2)
		detection_ring_right:set_center_y(self._detection_panel:h() / 2)
		local detection_value = self._detection_panel:text({
			name = "detection_value",
			font_size = medium_font_size,
			font = medium_font,
			layer = 1,
			blend_mode = "add",
			color = tweak_data.screen_colors.text
		})
		detection_value:set_x(detection_ring_left_bg:x() + detection_ring_left_bg:w() / 2 - medium_font_size / 2 + 2)
		detection_value:set_y(detection_ring_left_bg:y() + detection_ring_left_bg:h() / 2 - medium_font_size / 2 + 2)
		local detection_text = self._detection_panel:text({
			name = "detection_text",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			blend_mode = "add",
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_detection"))
		})
		detection_text:set_left(detection_ring_left:right() + 8)
		detection_text:set_y(detection_ring_left:y() + detection_ring_left_bg:h() / 2 - medium_font_size / 2 + 2)
		self._buttons = self._btn_panel:panel({y = 8})
		local btn_x = 10
		for btn, btn_data in pairs(BTNS) do
			local new_btn = BlackMarketGuiButtonItem:new(self._buttons, btn_data, btn_x)
			self._btns[btn] = new_btn
		end
		self._info_texts = {}
		self._info_texts_panel = self._panel:panel({
			x = info_box_panel:x() + 10,
			y = info_box_panel:y() + 10,
			w = info_box_panel:w() - 20,
			h = info_box_panel:h() - 20 - real_small_font_size * 3
		})
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_1",
			font_size = medium_font_size,
			font = medium_font,
			layer = 1,
			color = tweak_data.screen_colors.text,
			text = ""
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_2",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.text,
			text = "",
			wrap = true,
			word_wrap = true
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_3",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.important_1,
			text = "",
			wrap = true,
			word_wrap = true,
			blend_mode = "add"
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_4",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.text,
			text = "",
			wrap = true,
			word_wrap = true
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_5",
			font_size = small_font_size,
			font = small_font,
			layer = 1,
			color = tweak_data.screen_colors.important_1,
			text = "",
			wrap = true,
			word_wrap = true
		}))
		self._info_texts_color = {}
		self._info_texts_bg = {}
		for i, info_text in ipairs(self._info_texts) do
			self._info_texts_color[i] = info_text:color()
			self._info_texts_bg[i] = self._info_texts_panel:rect({
				layer = 0,
				color = Color.black,
				alpha = 0.2,
				visible = false
			})
			self._info_texts_bg[i]:set_shape(info_text:shape())
		end
		local h = real_small_font_size
		local longest_text_w = 0
		if self._data.info_callback then
			self._info_panel = self._panel:panel({
				name = "info_panel",
				layer = 1,
				w = self._btn_panel:w()
			})
			local info_table = self._data.info_callback()
			for i, info in ipairs(info_table) do
				local info_name = info.name or ""
				local info_string = info.text or ""
				local info_color = info.color or tweak_data.screen_colors.text
				local category_text = self._info_panel:text({
					name = "category_" .. tostring(i),
					y = (i - 1) * h,
					w = 0,
					h = h,
					font_size = h,
					font = small_font,
					layer = 1,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_" .. tostring(info_name)))
				})
				local status_text = self._info_panel:text({
					name = "status_" .. tostring(i),
					y = (i - 1) * h,
					w = 0,
					h = h,
					font_size = h,
					font = small_font,
					layer = 1,
					color = info_color,
					text = utf8.to_upper(managers.localization:text(info_string))
				})
				if info_string == "" then
					category_text:set_color(info_color)
				end
				local _, _, w, _ = category_text:text_rect()
				if longest_text_w < w then
					longest_text_w = w + 10
				end
			end
			for name, text in ipairs(self._info_panel:children()) do
				if string.split(text:name(), "_")[1] == "category" then
					text:set_w(longest_text_w)
					text:set_x(0)
				else
					local _, _, w, _ = text:text_rect()
					text:set_w(w)
					text:set_x(math.round(longest_text_w + 5))
				end
			end
		else
			self._stats_shown = {
				{name = "magazine", stat_name = "extra_ammo"},
				{
					name = "totalammo",
					stat_name = "total_ammo_mod"
				},
				{name = "fire_rate"},
				{name = "damage"},
				{
					name = "spread",
					offset = true,
					revert = true
				},
				{
					name = "recoil",
					offset = true,
					revert = true
				},
				{
					name = "concealment",
					index = true
				},
				{
					name = "suppression",
					offset = true
				}
			}
			self._stats_panel = self._panel:panel({
				layer = 1,
				x = info_box_panel:x() + 10,
				y = info_box_panel:y() + 58,
				w = info_box_panel:w() - 20,
				h = info_box_panel:h() - 84
			})
			local panel = self._stats_panel:panel({
				layer = 1,
				w = self._stats_panel:w(),
				h = 20
			})
			panel:rect({
				color = Color.black:with_alpha(0.5)
			})
			self._stats_titles = {}
			self._stats_titles.equip = self._stats_panel:text({
				x = 120,
				font_size = small_font_size,
				font = small_font,
				layer = 2,
				color = tweak_data.screen_colors.text
			})
			self._stats_titles.base = self._stats_panel:text({
				x = 170,
				font_size = small_font_size,
				font = small_font,
				layer = 2,
				alpha = 0.75,
				color = tweak_data.screen_colors.text,
				text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))
			})
			self._stats_titles.mod = self._stats_panel:text({
				x = 215,
				font_size = small_font_size,
				font = small_font,
				layer = 2,
				alpha = 0.75,
				color = tweak_data.screen_colors.stats_mods,
				text = utf8.to_upper(managers.localization:text("bm_menu_stats_mod"))
			})
			self._stats_titles.skill = self._stats_panel:text({
				x = 255,
				font_size = small_font_size,
				font = small_font,
				alpha = 0.75,
				layer = 2,
				color = tweak_data.screen_colors.resource,
				text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))
			})
			self._stats_titles.total = self._stats_panel:text({
				x = 200,
				font_size = small_font_size,
				font = small_font,
				layer = 2,
				color = tweak_data.screen_colors.text,
				text = utf8.to_upper(managers.localization:text("bm_menu_chosen"))
			})
			local x = 0
			local y = 20
			local text_panel
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
					size = 45,
					align = "right",
					alpha = 0.75,
					blend = "add"
				},
				{
					name = "mods",
					size = 45,
					align = "right",
					alpha = 0.75,
					blend = "add",
					color = tweak_data.screen_colors.stats_mods
				},
				{
					name = "skill",
					size = 45,
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
			self._stats_texts = {}
			self._rweapon_stats_panel = self._stats_panel:panel()
			for i, stat in ipairs(self._stats_shown) do
				panel = self._rweapon_stats_panel:panel({
					name = "weapon_stats",
					layer = 1,
					x = 0,
					y = y,
					w = self._rweapon_stats_panel:w(),
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
				self._stats_texts[stat.name] = {}
				for _, column in ipairs(text_columns) do
					text_panel = panel:panel({
						layer = 0,
						x = x,
						w = column.size,
						h = panel:h()
					})
					self._stats_texts[stat.name][column.name] = text_panel:text({
						font_size = small_font_size,
						font = small_font,
						align = column.align,
						layer = 1,
						alpha = column.alpha,
						blend_mode = column.blend,
						color = column.color or tweak_data.screen_colors.text
					})
					x = x + column.size
					if column.name == "total" then
						text_panel:set_x(190)
					end
				end
			end
			self:_get_armor_page()
			self._mweapon_stats_shown = {
				{name = "damage", range = true},
				{
					name = "damage_effect",
					range = true,
					multiple_of = "damage"
				},
				{
					name = "charge_time",
					num_decimals = 1,
					inverse = true,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{name = "range", range = true},
				{
					name = "concealment",
					index = true
				}
			}
			do
				local x = 0
				local y = 20
				local text_panel
				self._mweapon_stats_texts = {}
				local text_columns = {
					{name = "name", size = 100},
					{
						name = "equip",
						size = 55,
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
						size = 65,
						align = "right",
						alpha = 0.75,
						blend = "add",
						color = tweak_data.screen_colors.resource
					},
					{
						name = "total",
						size = 55,
						align = "right"
					}
				}
				self._mweapon_stats_panel = self._stats_panel:panel()
				for i, stat in ipairs(self._mweapon_stats_shown) do
					panel = self._mweapon_stats_panel:panel({
						layer = 1,
						x = 0,
						y = y,
						w = self._mweapon_stats_panel:w(),
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
					self._mweapon_stats_texts[stat.name] = {}
					for _, column in ipairs(text_columns) do
						text_panel = panel:panel({
							layer = 0,
							x = x,
							w = column.size,
							h = panel:h()
						})
						self._mweapon_stats_texts[stat.name][column.name] = text_panel:text({
							font_size = small_font_size,
							font = small_font,
							align = column.align,
							layer = 1,
							alpha = column.alpha,
							blend_mode = column.blend,
							color = column.color or tweak_data.screen_colors.text
						})
						x = x + column.size
						if column.name == "total" then
							text_panel:set_x(190)
						end
					end
				end
			end
			panel = self._stats_panel:panel({
				name = "modslist_panel",
				layer = 0,
				y = y + 20,
				w = self._stats_panel:w(),
				h = self._stats_panel:h()
			})
			self._stats_text_modslist = panel:text({
				font_size = small_font_size,
				font = small_font,
				layer = 1,
				color = tweak_data.screen_colors.text,
				wrap = true,
				word_wrap = true
			})
		end
		if self._info_panel then
			self._info_panel:set_size(info_box_panel:w() - 20, self._info_panel:num_children() / 2 * h)
			self._info_panel:set_rightbottom(self._panel:w() - 10, self._btn_panel:top() - 10)
		end
		local tab_x = 0
		if not managers.menu:is_pc_controller() and #self._tabs > 1 then
			local prev_page = self._panel:text({
				name = "prev_page",
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.text,
				text = managers.localization:get_default_macro("BTN_BOTTOM_L")
			})
			local _, _, w, h = prev_page:text_rect()
			prev_page:set_w(w)
			prev_page:set_top(top_padding)
			prev_page:set_left(tab_x)
			prev_page:set_visible(self._selected > 1)
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
		for _, tab in ipairs(self._tabs) do
			tab_x = tab:set_tab_position(tab_x)
		end
		if not managers.menu:is_pc_controller() and #self._tabs > 1 then
			local next_page = self._panel:text({
				name = "next_page",
				y = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.text,
				text = managers.localization:get_default_macro("BTN_BOTTOM_R")
			})
			local _, _, w, h = next_page:text_rect()
			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)
			next_page:set_visible(self._selected < #self._tabs)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
		if managers.menu:is_pc_controller() and self._tab_scroll_table[#self._tab_scroll_table]:right() > self._tab_scroll_table.panel:w() then
			local prev_page = self._panel:text({
				name = "prev_page",
				y = 0,
				w = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.button_stage_3,
				text = "<",
				align = "center"
			})
			local _, _, w, h = prev_page:text_rect()
			prev_page:set_size(w, h)
			prev_page:set_top(top_padding)
			prev_page:set_left(0)
			prev_page:set_text(" ")
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)
			local next_page = self._panel:text({
				name = "next_page",
				y = 0,
				w = 0,
				font_size = medium_font_size,
				font = medium_font,
				layer = 2,
				color = tweak_data.screen_colors.button_stage_3,
				text = ">",
				align = "center"
			})
			local _, _, w, h = next_page:text_rect()
			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)
			self._tab_scroll_table.left = prev_page
			self._tab_scroll_table.right = next_page
			self._tab_scroll_table.left_klick = false
			self._tab_scroll_table.right_klick = true
			if self._selected > 1 then
				self._tab_scroll_table.left_klick = true
				self._tab_scroll_table.left:set_text("<")
			else
				self._tab_scroll_table.left_klick = false
				self._tab_scroll_table.left:set_text(" ")
			end
			if self._selected < #self._tab_scroll_table then
				self._tab_scroll_table.right_klick = true
				self._tab_scroll_table.right:set_text(">")
			else
				self._tab_scroll_table.right_klick = false
				self._tab_scroll_table.right:set_text(" ")
			end
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
	else
		self._select_rect:hide()
	end
	if MenuBackdropGUI then
		local bg_text = self._fullscreen_panel:text({
			text = self._title_text:text(),
			h = 90,
			align = "left",
			vertical = "top",
			font_size = massive_font_size,
			font = massive_font,
			color = tweak_data.screen_colors.button_stage_3,
			alpha = 0.4
		})
		local x, y = managers.gui_data:safe_to_full_16_9(self._title_text:world_x(), self._title_text:world_center_y())
		bg_text:set_world_left(x)
		bg_text:set_world_center_y(y)
		bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, bg_text)
		if managers.menu:is_pc_controller() then
			local bg_back = self._fullscreen_panel:text({
				name = "back_button",
				text = utf8.to_upper(managers.localization:text("menu_back")),
				h = 90,
				align = "right",
				vertical = "bottom",
				font_size = massive_font_size,
				font = massive_font,
				color = tweak_data.screen_colors.button_stage_3,
				alpha = 0.4,
				layer = 0
			})
			local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back_button"):world_right(), self._panel:child("back_button"):world_center_y())
			bg_back:set_world_right(x)
			bg_back:set_world_center_y(y)
			bg_back:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_back)
		end
	end
	if self._selected_slot then
		self:on_slot_selected(self._selected_slot)
	end
	local black_rect = self._fullscreen_panel:rect({
		color = Color(0.4, 0, 0, 0),
		layer = 1
	})
	if is_start_page then
		if managers.menu:is_pc_controller() then
			managers.features:announce_feature("blackmarket_rename")
		end
		if managers.dlc:is_dlc_unlocked("ach_bulldog_1") then
			managers.features:announce_feature("freed_old_hoxton")
		end
		local new_givens = managers.blackmarket:fetch_new_items_unlocked()
		local params = {}
		params.sound_event = "stinger_new_weapon"
		for _, unlocked_item in ipairs(new_givens) do
			params.category = unlocked_item[1]
			if params.category == "primaries" or params.category == "secondaries" then
				params.value = managers.weapon_factory:get_weapon_name_by_factory_id(unlocked_item[2])
			else
				params.value = unlocked_item[2]
			end
			params.data = unlocked_item
			if type(params.value) == "table" then
				for _, item in ipairs(params.value) do
					params.category = item[1]
					params.value = item[2]
					params.data = item
					managers.menu:show_new_item_gained(params)
				end
			else
				managers.menu:show_new_item_gained(params)
			end
		end
	end
	self:set_tab_positions()
	self:_round_everything()
	self.loaded = true
end

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
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = skill
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
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = skill
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
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
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
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * skill
			}
		elseif stat.name == "explosion_damage_reduction" then
			local base = managers.player:body_armor_value("explosion_damage_reduction", upgrade_level) * 100
			local skill = managers.player:upgrade_value("player", name .. "_edr_addend", 0) * 100
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = skill
			}
		elseif stat.name == "ammo_mul" then
			local base = managers.player:body_armor_value("skill_ammo_mul", upgrade_level) * 100 - 100
			local skill = 1
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * (skill - 1)
			}
		elseif stat.name == "jump_speed_multiplier" then
			local base = managers.player:body_armor_value("jump_speed_multiplier", upgrade_level) * 100 - 100
			local skill = 1
			base_stats[stat.name] = {
				value = base
			}
			skill_stats[stat.name] = {
				value = base * (skill - 1)
			}
		elseif stat.name == "bleeding_reduction" then
			local base = managers.player:body_armor_value("bleeding_reduction", upgrade_level)
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
	if tweak_data.weapon[self._slot_data.name] then
		local equipped_item = managers.blackmarket:equipped_item(category)
		local equipped_slot = managers.blackmarket:equipped_weapon_slot(category)
		local equip_base_stats, equip_mods_stats, equip_skill_stats = self:_get_stats(equipped_item.weapon_id, category, equipped_slot)
		local base_stats, mods_stats, skill_stats = self:_get_stats(name, category, slot)
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
			value = base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value--math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			if slot == equipped_slot then
				local base = base_stats[stat.name].value
				self._stats_texts[stat.name].equip:set_alpha(1)
				self._stats_texts[stat.name].equip:set_text(value)
				self._stats_texts[stat.name].base:set_text(base)
				if mods_stats[stat.name].value ~= 0 or not "" then
				end
				self._stats_texts[stat.name].mods:set_text((0 < mods_stats[stat.name].value and "+" or "") .. (mods_stats[stat.name].value ~= 0 and mods_stats[stat.name].value or ""))
				if skill_stats[stat.name].skill_in_effect then
				else
				end
				self._stats_texts[stat.name].skill:set_text((0 < skill_stats[stat.name].value and "+" or "") .. (skill_stats[stat.name].value ~= 0 and skill_stats[stat.name].value or ""))
				self._stats_texts[stat.name].total:set_text("")
				if value > base then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
				elseif value < base then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip = equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value--math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				self._stats_texts[stat.name].equip:set_alpha(0.75)
				self._stats_texts[stat.name].equip:set_text(equip)
				self._stats_texts[stat.name].base:set_text("")
				self._stats_texts[stat.name].mods:set_text("")
				self._stats_texts[stat.name].skill:set_text("")
				self._stats_texts[stat.name].total:set_text(value)
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
			explosion_damage_reduction = true
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
				value_min = base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value--math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
				value_max = base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value--math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
			end
			value = base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value--math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
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
				local equip_text = value and string.format(format_string, value)
				local base_text = base and string.format(format_string, base)
				local skill_text = skill_stats[stat.name].value and string.format(format_string, skill_stats[stat.name].value)
				local base_min_text = base_min and string.format(format_string, base_min)
				local base_max_text = base_max and string.format(format_string, base_max)
				local value_min_text = value_min and string.format(format_string, value_min)
				local value_max_text = value_max and string.format(format_string, value_max)
				local skill_min_text = skill_min and string.format(format_string, skill_min)
				local skill_max_text = skill_max and string.format(format_string, skill_max)

				skill_text = string.sub(skill_text, 1, 1) ~= "0" and skill_text or ""
				skill_min_text = skill_min_text ~= "0" and skill_min_text or ""
				skill_max_text = skill_max_text ~= "0" and skill_max_text or ""

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
					equip_min = equip_base_stats[stat.name].min_value + equip_mods_stats[stat.name].min_value + equip_skill_stats[stat.name].min_value--math.max(equip_base_stats[stat.name].min_value + equip_mods_stats[stat.name].min_value + equip_skill_stats[stat.name].min_value, 0)
					equip_max = equip_base_stats[stat.name].max_value + equip_mods_stats[stat.name].max_value + equip_skill_stats[stat.name].max_value--math.max(equip_base_stats[stat.name].max_value + equip_mods_stats[stat.name].max_value + equip_skill_stats[stat.name].max_value, 0)
				end
				equip = equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value--math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = equip and string.format(format_string, equip)
				local total_text = value and string.format(format_string, value)
				local equip_min_text = equip_min and string.format(format_string, equip_min)
				local equip_max_text = equip_max and string.format(format_string, equip_max)
				local total_min_text = value_min and string.format(format_string, value_min)
				local total_max_text = value_max and string.format(format_string, value_max)
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
						stop = utf8.len(equip_text),
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
		--[[local equip, stat_changed
		local tweak_parts = tweak_data.weapon.factory.parts[self._slot_data.name]
		local mod_stats = self:_get_stats_for_mod(self._slot_data.name, name, category, slot)
		local hide_equip = mod_stats.equip.name == mod_stats.chosen.name
		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		for _, title in pairs(self._stats_titles) do
			title:hide()
		end
		if not mod_stats.equip.name then
			self._stats_titles.equip:hide()
		else
			self._stats_titles.equip:show()
			self._stats_titles.equip:set_text(utf8.to_upper(managers.localization:text("bm_menu_equipped")))
			self._stats_titles.equip:set_alpha(0.75)
			self._stats_titles.equip:set_x(105)
		end
		if not hide_equip then
			self._stats_titles.total:show()
		end
		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			value = mod_stats.chosen[stat.name]
			equip = mod_stats.equip[stat.name]
			if tweak_parts then
			else
				stat_changed = tweak_parts.stats[stat.stat_name or stat.name] and value ~= 0 and 1 or 0.5
			end
			for stat_name, stat_text in pairs(self._stats_texts[stat.name]) do
				if stat_name ~= "name" then
					stat_text:set_text("")
				end
			end
			for name, column in pairs(self._stats_texts[stat.name]) do
				column:set_alpha(stat_changed)
			end
			if not hide_equip and stat_changed == 1 then
			else
			end
			self._stats_texts[stat.name].total:set_text((value > 0 and "+" or "") .. value or "")
			if equip ~= 0 or not "" then
			end
			self._stats_texts[stat.name].equip:set_text((equip > 0 and "+" or "") .. equip)
			self._stats_texts[stat.name].equip:set_alpha(0.75)
			if value > equip then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
			elseif value < equip then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			end
			self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
		end]]
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
			
			local decimals = (stat.name == "magazine" or stat.name == "totalammo" or stat.name == "concealment") and "%0.0f" or "%0.2f"
			local value2, equip2
			value2 = value
			equip2 = equip
			self._stats_texts[stat.name].total:set_text(not hide_equip and stat_changed == 1 and (( value > 0 and "+" or "") .. string.format(decimals, value2) or ""))
			self._stats_texts[stat.name].equip:set_text((equip == 0 and "") or (equip > 0 and "+" or "") .. string.format(decimals, equip2))
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