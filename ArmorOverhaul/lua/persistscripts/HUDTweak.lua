if not HUDManager then return end
if HUDTweak then return end

local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)

if ArmorOverhaul.options.gui_enabled then

	local panel = hud.panel:panel({
		name = "ArmorOverhaul",
		w = 200,--hud.panel:child("teammates_panel"):child("1"):w(),
		h = 200,
		x = ArmorOverhaul.options.panel_x or 200,--hud.panel:child("teammates_panel"):child("1"):x(),
		y = ArmorOverhaul.options.panel_y or 200--hud.panel:child("teammates_panel"):child("1"):y() - 200
	})


	if ArmorOverhaul.options.gui_health then
		local hp_text = panel:text({
			name = "hp_text",
			visible = true,
			text = "",
			layer = 5,
			color = Color.green,
			y = 16,
			align = "left",
			vertical = "top",
			font_size = 16,
			font = tweak_data.hud_players.timer_font
		})
	end

	if ArmorOverhaul.options.gui_armor then
		local armor_text = panel:text({
			name = "armor_text",
			visible = true,
			text = "",
			layer = 5,
			color = Color.blue,
			y = 32,
			align = "left",
			vertical = "top",
			font_size = 16,
			font = tweak_data.hud_players.timer_font
		})	
		--[[local doom_armor_text = panel:text({
			name = "doom_armor_text",
			visible = true,
			text = "",
			layer = 5,
			color = Color.white,
			y = 48,
			align = "left",
			vertical = "top",
			font_size = 16,
			font = tweak_data.hud_players.timer_font
		})]]
	end

	--[[local doom_armor_radial = panel:bitmap({
		name = "radial_doom",
		texture = "guis/textures/pd2/hud_shield", --texture = "guis/textures/pd2/hud_doom",
		texture_rect = {
			64,
			0,
			-64,
			64
		},
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		alpha = 1,
		w = 78,--64,
		y = 64,
		h = 78,--64,
		layer = 1
	})]]

	local bleeding = hud.panel:text({
		name = "bleeding_text",
		visible = true,
		text = "",
		layer = 5,
		color = Color.red,
		y = 100,
		align = "center",
		vertical = "top",
		font_size = 64,
		font = tweak_data.hud_players.timer_font
	})	
	local bleeding_rate = hud.panel:text({
		name = "bleeding_rate_text",
		visible = true,
		text = "",
		layer = 5,
		color = Color.red,
		y = 168,
		align = "center",
		vertical = "top",
		font_size = 16,
		font = tweak_data.hud_players.timer_font
	})	
end

HUDTweak = true