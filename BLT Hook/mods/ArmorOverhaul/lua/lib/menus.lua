if _menus_once then return end
_menus_once = true

local function menu_fun(t)
    local main = t.menu.node
    local visibility = {
        fav_videos_pc = 'untruth',
        content_updates_pc = 'untruth',
        gamehub = 'untruth',
        credits = 'untruth',
    }

    for i, item in ipairs(main) do
        item.visible_callback = visibility[item.name] or item.visible_callback
    end
end
--[[
table.insert(menu_hooks, menu_fun)

local divider = menu_item{
    no_text = true,
    size = 8,
    type = 'MenuItemDivider',
}

local jobmenu = menu_item{
    text = 'Job Menu',
    help = 'Start the heist of your choice.',
    callback = function()
        dofile('notwa/jobs.lua')
    end,
}

local skillprofiler = menu_item{
    text = 'Skill Profiler',
    help = 'Manage your skill tree profiles.',
    callback = function()
        dofile('Scripts/skillprofiler.lua')
        managers.skilltree:profileMain()
    end,
}

local example_box = menu_checkbox{
    text = 'toggleable',
    help = 'toggle a feature.',
    key = 'example',
    default = 'off',
    callback = function()
        io.write(Global.menu_options['example'] and "it's on!" or "it's off...", '\n')
    end,
}

local m = {}
m[#m+1] = menu_item{
    text = 'this is a different menu',
    callback = function()
        io.write('indeed\n')
    end,
}
m[#m+1] = divider
m[#m+1] = menu_item{
    text_id = 'menu_network',
    help_id = 'menu_network_help',
    next_node = 'network_options',
}
local menu2 = menu_submenu(m)

local m = {}
m[#m+1] = menu_item{
    text = 'hey there',
    help = 'hi',
    callback = function()
        io.write('you did it!\n')
    end,
}
m[#m+1] = example_box
m[#m+1] = divider
m[#m+1] = jobmenu
m[#m+1] = skillprofiler
m[#m+1] = divider
m[#m+1] = menu_item{
    text = 'cool a submenu',
    help = "it's so easy even your kids can do menus",
    next_node = menu2,
}
local menu1 = menu_submenu(m)

local useless_item = menu_item{
    text = 'useless menu',
    help = 'hello world',
    next_node = menu1,
}
menu_after('options', useless_item)--]]






local m = {}
for equipment, _ in pairs(CustomArmor.equipment.head) do
    m[#m+1] = menu_item{
        type = "MenuItemLevel",
        text_id = "custom_" .. equipment,
        help_id = "custom_" .. equipment .. "_help",
        callback = function(self, item)
            Global._custom_armor:change_equipment("head", equipment)
            Global._custom_armor:save()
        end
    }
end
local heads = menu_item{
    name = "custom_armor_heads_menu",
    text_id = "custom_armor_heads",
    help_id = "custom_armor_heads_help",
    localize = true,
    next_node = menu_submenu(m),
    callback = function(self, item)
    end,
}

local m = {}
for equipment, _ in pairs(CustomArmor.equipment.neck) do
    m[#m+1] = menu_item{
        type = "MenuItemLevel",
        text_id = "custom_" .. equipment,
        help_id = "custom_" .. equipment .. "_help",
        callback = function(self, item)
            Global._custom_armor:change_equipment("neck", equipment)
            Global._custom_armor:save()
        end
    }
end
local necks = menu_item{
    name = "custom_armor_necks_menu",
    text_id = "custom_armor_necks",
    help_id = "custom_armor_necks_help",
    localize = true,
    next_node = menu_submenu(m),
    callback = function(self, item)
    end,
}

local m = {}
for equipment, _ in pairs(CustomArmor.equipment.chest) do
    m[#m+1] = menu_item{
        type = "MenuItemLevel",
        text_id = "custom_" .. equipment,
        help_id = "custom_" .. equipment .. "_help",
        callback = function(self, item)
            Global._custom_armor:change_equipment("chest", equipment)
            Global._custom_armor:save()
        end
    }
end
local chests = menu_item{
    name = "custom_armor_chests_menu",
    text_id = "custom_armor_chests",
    help_id = "custom_armor_chests_help",
    localize = true,
    next_node = menu_submenu(m),
    callback = function(self, item)
    end,
}

local m = {}
for equipment, _ in pairs(CustomArmor.equipment.legs) do
    m[#m+1] = menu_item{
        type = "MenuItemLevel",
        text_id = "custom_" .. equipment,
        help_id = "custom_" .. equipment .. "_help",
        callback = function(self, item)
            Global._custom_armor:change_equipment("legs", equipment)
            Global._custom_armor:save()
        end
    }
end
local legs = menu_item{
    name = "custom_armor_legs_menu",
    text_id = "custom_armor_legs",
    help_id = "custom_armor_legs_help",
    localize = true,
    next_node = menu_submenu(m),
    callback = function(self, item)
    end,
}

local m = {}
for equipment, _ in pairs(CustomArmor.equipment.arms) do
    m[#m+1] = menu_item{
        type = "MenuItemLevel",
        text_id = "custom_" .. equipment,
        help_id = "custom_" .. equipment .. "_help",
        level_title_id = "A title",
        level_text_id = "A text",
        callback = function(self, item)
        LAOUtils.table_print(item)
            Global._custom_armor:change_equipment("arms", equipment)
            Global._custom_armor:save()
        end
    }
end
local arms = menu_item{
    name = "custom_armor_arms_menu",
    text_id = "custom_armor_arms",
    help_id = "custom_armor_arms_help",
    localize = true,
    next_node = menu_submenu(m),
    callback = function(self, item)
    end,
}

local m = {}
m[#m+1] = heads
m[#m+1] = necks
m[#m+1] = chests
m[#m+1] = legs
m[#m+1] = arms

local custom_armor_menu = menu_item{
    name = "custom_armor_menu",
    text_id = "custom_armor",
    help_id = "custom_armor_help",
    localize = true,
    next_node = menu_submenu(m, "custom_armor_menu2"),
    callback = function(self, item)
    end,
}

menu_after('safehouse', custom_armor_menu)

local m = {}

m[#m+1] = menu_item{
    text_id = "description_hurt_animation_intro",
    help_id = "description_hurt_animation_intro_help",
    size = 8,
    callback = function()
        menus.hurt.intro:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_hurt_animation_duration",
    help_id = "description_hurt_animation_duration_help",
    size = 8,
    callback = function()
        menus.hurt.duration:show()
    end
}

local hurt_animation_menu = menu_submenu(m)

local m = {}
m[#m+1] = menu_item{
    text_id = "description_hurt_animation",
    help_id = "description_hurt_animation_help",
    localize = true,
    next_node = hurt_animation_menu
}
m[#m+1] = menu_item{
    text_id = "description_carrying_bags",
    help_id = "description_carrying_bags_help",
    size = 8,
    callback = function()
        menus.carrying_bags:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_interaction",
    help_id = "description_interaction_help",
    size = 8,
    callback = function()
        menus.interaction:show()
    end
}

local game_mechanics = menu_submenu(m)

local m = {}
m[#m+1] = menu_item{
    text_id = "description_new_armor_regen",
    help_id = "description_new_armor_regen_help",
    callback = function()
        menus.new.armor_regen:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_bullet_deflection",
    help_id = "description_new_bullet_deflection_help",
    callback = function()
        menus.new.bullet_deflection:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_hdr",
    help_id = "description_new_hdr_help",
    callback = function()
        menus.new.hdr:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_armor_ammo",
    help_id = "description_new_armor_ammo_help",
    callback = function()
        menus.new.armor_ammo:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_edr",
    help_id = "description_new_edr_help",
    callback = function()
        menus.new.edr:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_health_armor",
    help_id = "description_new_health_armor_help",
    callback = function()
        menus.new.health_armor:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_health_regen",
    help_id = "description_new_health_regen_help",
    callback = function()
        menus.new.health_regen:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_jump_armor",
    help_id = "description_new_jump_armor_help",
    callback = function()
        menus.new.jump_armor:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_bleeding",
    help_id = "description_new_bleeding_help",
    callback = function()
        menus.new.bleeding:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_difficulty",
    help_id = "description_new_difficulty_help",
    callback = function()
        menus.new.difficulty:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_armor_reduction",
    help_id = "description_new_armor_reduction_help",
    callback = function()
        menus.new.armor_reduction:show()
    end
}
m[#m+1] = menu_item{
    text_id = "description_new_armor_drainer",
    help_id = "description_new_armor_drainer_help",
    callback = function()
        menus.new.armor_drainer:show()
    end
}

local new_mechanics = menu_submenu(m)

local m  ={}
--[[
m[#m+1] = menu_item{
    text_id = "description_long_guide",
    help_id = "description_long_guide_help",
    size = 8,
    next_node = game_mechanics
}--]]
m[#m+1] = menu_item{
    text_id = "description_new",
    help_id = "description_new_help",
    size = 8,
    next_node = new_mechanics
}

local mechanics = menu_item{
    text_id = "description_mechanics",
    help_id = "description_mechanics_help",
    localize = true,
    next_node = menu_submenu(m)
}

--menu_after('options', mechanics)

local m = {}

m[#m+1] = menu_checkbox{
    text_id = "armor_overhaul_options_debug",
    help_id = "armor_overhaul_options_debug_help",
    key = 'example',
    default = ArmorOverhaul and ArmorOverhaul.options.debug or 'on',
    callback = function(self, item)
        LAOUtils.change_option("debug", item:value())
        LAOUtils.save_options()
    end
}
m[#m+1] = menu_item{
    type = "MenuItemMultiChoice",
    text_id = "armor_overhaul_options_lang",
    help_id = "armor_overhaul_options_lang_help",
    {
        _meta = "option",
        text_id = "lang_en",
        value = 0
    },
    {
        _meta = "option",
        text_id = "lang_fr",
        value = 1
    },
    callback = function(self, item)
        LAOUtils.change_option("lang", item:value())
        LAOUtils.save_options()
    end
}
m[#m+1] = menu_checkbox{
    text_id = "armor_overhaul_options_gui",
    help_id = "armor_overhaul_options_gui_help",
    key = 'example',
    default = ArmorOverhaul and ArmorOverhaul.options.gui_enabled or 'on',
    callback = function(self, item)
        LAOUtils.change_option("gui_enabled", item:value())
        LAOUtils.save_options()
    end
}
m[#m+1] = menu_checkbox{
    text_id = "armor_overhaul_options_gui_health",
    help_id = "armor_overhaul_options_gui_health_help",
    key = 'example',
    default = ArmorOverhaul and ArmorOverhaul.options.gui_health or 'on',
    callback = function(self, item)
        LAOUtils.change_option("gui_health", item:value())
        LAOUtils.save_options()
    end
}
m[#m+1] = menu_checkbox{
    text_id = "armor_overhaul_options_gui_armor",
    help_id = "armor_overhaul_options_gui_armor_help",
    key = 'example',
    default = ArmorOverhaul and ArmorOverhaul.options.gui_enabled or 'on',
    callback = function(self, item)
        LAOUtils.change_option("gui_armor", item:value())
        LAOUtils.save_options()
    end
}

m = menu_item{
    text_id = "armor_overhaul_options",
    help_id = "armor_overhaul_options_help",
    next_node = menu_submenu(m)
}

menu_after('mods', m)

local m = {}

m[#m+1] = menu_item{
	type = "MenuItemMultiChoice",
	text_id = "crew_bonuses",
	help_id = "crew_bonuses_help",
    callback = function(self, item)
        local f = io and io.open(ArmorOverhaul.ROOT .. "saves/crew_bonus.sav", "w")
        if f == nil then return end
        f:write(item:value())
        f:close()
        managers.player:empty_crew_bonuses()
        managers.player:aquire_crew_bonus(tweak_data.upgrades.definitions["crew_" .. item:value()])
    end
}
local crews = tweak_data.upgrades.values.crew
for tab_name, tab in pairs(crews) do
	for k, v in pairs(tab) do
		table.insert(m[#m], {
			_meta = "option",
			text_id = "crew_bonus_" .. tab_name .. "_" .. k,
			value = tab_name .. "_" .. k
		})
	end
end

m = menu_item{
    text_id = "crew_bonuses",
    help_id = "crew_bonuses_help",
    next_node = menu_submenu(m)
}

menu_after('safehouse', m)

--[[local m = {}

m[#m+1] = menu_item{
	text_id = "changelog_beta_0_6",
	callback = function(self, item)
		menus.changelog_beta_0_6:show()
	end
}
m[#m+1] = menu_item{
	text_id = "changelog_beta_0_5",
	callback = function(self, item)
		menus.changelog_beta_0_5:show()
	end
}

m = menu_item{
	text_id = "changelog",
	help_id = "changelog_help",
	next_node = menu_submenu(m)
}

menu_after('safehouse', m)]]