--[[
function LoadoutItem:populate_armors(data)
	local new_data = {}
	local index = 0
	local guis_catalog = "guis/"
	for armor_id, armor_data in pairs(tweak_data.blackmarket.armors) do
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
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[armor_id] and tweak_data.blackmarket.armors[armor_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		if bm_data.owned then
			index = index + 1
			new_data = {}
			new_data.name = tweak_data.blackmarket.armors[armor_id].name_id
			new_data.category = "armors"
			new_data.slot = index
			new_data.unlocked = bm_data.unlocked
			new_data.lock_texture = not new_data.unlocked and "guis/textures/pd2/lock_level"
			new_data.equipped = bm_data.equipped
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. armor_bitmap--armor_id
			if not new_data.equipped then
				table.insert(new_data, "a_equip")
			end
			data[index] = new_data
		end
	end
	for i = 1, 9 do
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

function TeamLoadoutItem:set_slot_outfit(slot, criminal_name, outfit)
	local player_slot = self._player_slots[slot]
	if not player_slot then
		return
	end
	player_slot.panel:clear()
	if not outfit then
		return
	end
	local slot_h = player_slot.panel:h()
	local aspect
	local x = player_slot.panel:w() / 2
	local y = player_slot.panel:h() / 18
	local w = slot_h / 5 * 0.95
	local h = w
	local slot_color = tweak_data.chat_colors[slot]
	local criminal_text = player_slot.panel:text({
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = slot_color,
		x = 5,
		y = 5,
		text = managers.localization:to_upper_text("menu_" .. tostring(criminal_name))
	})
	if SystemInfo:platform() == Idstring("WIN32") then
		criminal_text:move(5, 5)
	end
	local primary_texture, secondary_texture
	if outfit.primary.factory_id then
		local primary_id = managers.weapon_factory:get_weapon_id_by_factory_id(outfit.primary.factory_id)
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.weapon[primary_id] and tweak_data.weapon[primary_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local texture_name = tweak_data.weapon[primary_id].texture_name or tostring(primary_id)
		local texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		local primary_bitmap = player_slot.panel:bitmap({
			texture = texture,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = primary_bitmap:texture_width() / math.max(1, primary_bitmap:texture_height())
		primary_bitmap:set_w(primary_bitmap:h() * aspect)
		primary_bitmap:set_center_x(x)
		primary_bitmap:set_center_y(y * 3)
		primary_texture = texture
		local perks = managers.blackmarket:get_perks_from_weapon_blueprint(outfit.primary.factory_id, outfit.primary.blueprint)
		if table.size(perks) > 0 then
			local perk_index = 0
			for perk in pairs(perks) do
				local texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk
				if DB:has(Idstring("texture"), texture) then
					local perk_object = player_slot.panel:bitmap({
						texture = texture,
						w = 16,
						h = 16,
						rotation = math.random(2) - 1.5,
						alpha = 0.8
					})
					perk_object:set_rightbottom(math.round(primary_bitmap:right() - perk_index * 16), math.round(primary_bitmap:bottom() - 5))
					perk_index = perk_index + 1
				end
			end
		end
	end
	if outfit.secondary.factory_id then
		local secondary_id = managers.weapon_factory:get_weapon_id_by_factory_id(outfit.secondary.factory_id)
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.weapon[secondary_id] and tweak_data.weapon[secondary_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local texture_name = tweak_data.weapon[secondary_id].texture_name or tostring(secondary_id)
		local texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		local secondary_bitmap = player_slot.panel:bitmap({
			texture = texture,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = secondary_bitmap:texture_width() / math.max(1, secondary_bitmap:texture_height())
		secondary_bitmap:set_w(secondary_bitmap:h() * aspect)
		secondary_bitmap:set_center_x(x)
		secondary_bitmap:set_center_y(y * 6)
		secondary_texture = texture
		local perks = managers.blackmarket:get_perks_from_weapon_blueprint(outfit.secondary.factory_id, outfit.secondary.blueprint)
		if table.size(perks) > 0 then
			local perk_index = 0
			for perk in pairs(perks) do
				local texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk
				if DB:has(Idstring("texture"), texture) then
					local perk_object = player_slot.panel:bitmap({
						texture = texture,
						w = 16,
						h = 16,
						rotation = math.random(2) - 1.5,
						alpha = 0.8
					})
					perk_object:set_rightbottom(secondary_bitmap:right() - perk_index * 16, secondary_bitmap:bottom() - 5)
					perk_index = perk_index + 1
				end
			end
		end
	end
	if outfit.melee_weapon then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.melee_weapons[outfit.melee_weapon] and tweak_data.blackmarket.melee_weapons[outfit.melee_weapon].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		if outfit.melee_weapon == "weapon" then
			if primary_texture and secondary_texture then
				local primary = player_slot.panel:bitmap({
					texture = primary_texture,
					w = w * 0.75,
					h = h * 0.75,
					rotation = math.random(2) - 21.5,
					alpha = 0.8
				})
				aspect = primary:texture_width() / math.max(1, primary:texture_height())
				primary:set_w(primary:h() * aspect)
				local secondary = player_slot.panel:bitmap({
					texture = secondary_texture,
					w = w * 0.75,
					h = h * 0.75,
					rotation = math.random(2) - 21.5,
					alpha = 0.8
				})
				aspect = secondary:texture_width() / math.max(1, secondary:texture_height())
				secondary:set_w(secondary:h() * aspect)
				primary:set_center_x(x - primary:w() * 0.25)
				primary:set_center_y(y * 9)
				secondary:set_center_x(x + secondary:w() * 0.25)
				secondary:set_center_y(y * 9)
			end
		else
			local melee_weapon_bitmap = player_slot.panel:bitmap({
				texture = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. outfit.melee_weapon,
				w = w,
				h = h,
				rotation = math.random(2) - 1.5,
				alpha = 0.8
			})
			aspect = melee_weapon_bitmap:texture_width() / math.max(1, melee_weapon_bitmap:texture_height())
			melee_weapon_bitmap:set_w(melee_weapon_bitmap:h() * aspect)
			melee_weapon_bitmap:set_center_x(x)
			melee_weapon_bitmap:set_center_y(y * 9)
		end
	end
	if outfit.grenade then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.grenades[outfit.grenade] and tweak_data.blackmarket.grenades[outfit.grenade].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local grenade_bitmap = player_slot.panel:bitmap({
			texture = guis_catalog .. "textures/pd2/blackmarket/icons/grenades/" .. outfit.grenade,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = grenade_bitmap:texture_width() / math.max(1, grenade_bitmap:texture_height())
		grenade_bitmap:set_w(grenade_bitmap:h() * aspect)
		grenade_bitmap:set_center_x(x)
		grenade_bitmap:set_center_y(y * 12)
	end
	if outfit.armor then
		local changed = false
		local armor_bmp
		for i, armor in ipairs(Global.real_armor) do
			if outfit.armor == armor then
				armor_bmp = Global.spoof_armor[i]
				changed = true
				break
			end
		end
		if not changed then
			armor_bmp = outfit.armor
		end
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[outfit.armor] and tweak_data.blackmarket.armors[outfit.armor].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local armor_bitmap = player_slot.panel:bitmap({
			texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. armor_bmp,--outfit.armor,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = armor_bitmap:texture_width() / math.max(1, armor_bitmap:texture_height())
		armor_bitmap:set_w(armor_bitmap:h() * aspect)
		armor_bitmap:set_center_x(x)
		armor_bitmap:set_center_y(y * 12)
	end
	if outfit.deployable and outfit.deployable ~= "nil" then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.deployables[outfit.deployable] and tweak_data.blackmarket.deployables[outfit.deployable].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local deployable_bitmap = player_slot.panel:bitmap({
			texture = guis_catalog .. "textures/pd2/blackmarket/icons/deployables/" .. outfit.deployable,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = deployable_bitmap:texture_width() / math.max(1, deployable_bitmap:texture_height())
		deployable_bitmap:set_w(deployable_bitmap:h() * aspect)
		deployable_bitmap:set_center_x(x)
		deployable_bitmap:set_center_y(y * 15)
		local deployable_amount = tonumber(outfit.deployable_amount) or 0
		if deployable_amount > 1 then
			local deployable_text = player_slot.panel:text({
				text = "x" .. tostring(deployable_amount),
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				rotation = deployable_bitmap:rotation(),
				color = tweak_data.screen_colors.text
			})
			local _, _, w, h = deployable_text:text_rect()
			deployable_text:set_size(w, h)
			deployable_text:set_rightbottom(player_slot.panel:w(), player_slot.panel:h())
			deployable_text:set_position(math.round(deployable_text:x()) - 16, math.round(deployable_text:y()) - 5)
		end
	end
	player_slot.box = BoxGuiObject:new(player_slot.panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
end
]]