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





local stats = {
    armor = 30,
    movement = 35,
    concealment = {
        1,
        12,
        18,
        21,
        23,
        26,
        30
    },
    dodge = 1,
    stamina = 20,
    damage_shake = 0.5,
    regen = 5,
    health_damage_reduction_min_value = 0.25,
    health_damage_reduction_max_dmg = 8,
    health_damage_reduction_max_value = 0.35,
    deflect_min_value = 0.35,
    deflect_max_dmg = 10,
    deflect_max_value = 0.25,
    explosion_damage_reduction = 0.5,
    hp_addend = 2,
    jump_speed_multiplier = 0.25,
    bleeding_reduction = 2.5
}
local stats_name = {
    "armor",
    "movement",
    "concealment",
    "dodge",
    "damage_shake",
    "stamina",
    "skill_ammo_mul",
    "health_damage_reduction_min_dmg",
    "health_damage_reduction_min_value",
    "health_damage_reduction_max_dmg",
    "health_damage_reduction_max_value",
    "deflect_min_dmg",
    "deflect_min_value",
    "deflect_max_dmg",
    "deflect_max_value",
    "regen",
    "explosion_damage_reduction",
    "hp_regen",
    "hp_addend",
    "jump_speed_multiplier",
    "ap_regen_suppressed_max_multiplier",
    "bleeding_reduction"
}
local stat_cost = {
    armor = 25000,
    movement = 35000,
    concealment = {
        0,
        4000,
        7000,
        8000,
        10000,
        12000,
        15000
    },
    dodge = 50000,
    damage_shake = 5000,
    stamina = 10000,
    skill_ammo_mul = 20000,
    regen = 10000,
    health_damage_reduction_min_dmg = 2500,
    health_damage_reduction_min_value = 10000,
    health_damage_reduction_max_dmg = 5000,
    health_damage_reduction_max_value = 15000,
    deflect_min_dmg = 2500,
    deflect_min_value = 15000,
    deflect_max_dmg = 5000,
    deflect_max_value = 10000,
    explosion_damage_reduction = 10000,
    hp_addend = 8000,
    jump_speed_multiplier = 5000,
    ap_regen_suppressed_max_multiplier = 10000,
    bleeding_reduction = 15000
}

total_points = total_points or 100000
points_used = points_used or 0

local save_path = "lib/Lua/ArmorOverhaul/saves/custom_armor.sav"
local index_count = 5
local cust = {}
local index = 1

local adresses = {}

function apply_changes()
    if Global then
        cust = Global.custom_armor or cust
        Global.custom_armor = cust
        Global.custom_armor.index = index or 1
        Global.custom_armor.stats = stats
    end
end

function init_custom_armor()
    for i = 1, index_count do
        cust[i] = {}
        for j, stat in ipairs(stats_name) do
            if stat == "health_damage_reduction" or stat == "deflect" then
                cust[i][stat] = {
                    {0, 0},
                    {0, 0}
                }
            else
                cust[i][stat] = 0
            end
        end
    end
    apply_changes()
end
init_custom_armor()

function change_value(stat, value)
    cust[index][stat] = value
    check_values(stat)
    apply_changes()
end

function check_values(stat_name)
    local points = 0
    for i, stat in ipairs(stats_name) do
        if stat_name and stat_name ~= stat then
            local cost = 0
            local max_cost = total_points - points
            if stat == "concealment" then
                cost = stat_cost.concealment[cust[index][stat]]
                if cost > max_cost then
                    for j = cust[index][stat], 1, -1 do
                        if stat_cost.concealment[j] <= max_cost then
                            cost = stat_cost.concealment[j]
                            cust[index].concealment = j
                            break
                        end
                    end
                end
            else
                cost = get_custom_armor_cost(stat)
                if cost > max_cost then
                    cost = max_cost
                    cust[index][stat] = (cost / stat_cost[stat]) - (stat == "dodge" and 1 or 0)
                end
            end
            points = points + cost
            io.stdout:write("After stat: " .. stat .. ", points used: " .. points .. " / " .. total_points .. "\n")
        end
    end
    if stat_name then
        local stat = stat_name
        local cost = 0
        local max_cost = total_points - points
        if stat == "concealment" then
            cost = stat_cost.concealment[cust[index][stat]]
            if cost > max_cost then
                for j = cust[index][stat], 1, -1 do
                    if stat_cost.concealment[j] <= max_cost then
                        cost = stat_cost.concealment[j]
                        cust[index].concealment = j
                        break
                    end
                end
            end
        else
            cost = get_custom_armor_cost(stat)
            if cost > max_cost then
                cost = max_cost
                cust[index][stat] = (cost / stat_cost[stat]) * (stats[stat] or 1) - (stat == "dodge" and 1 or 0)
            end
        end
        points = points + cost
        io.stdout:write("After stat: " .. stat .. ", points used: " .. points .. " / " .. total_points .. "\n")
    end
    points_used = points
end

function save_armor()
    local f = io.open(save_path, "w")
    for i = 1, index_count do
        f:write("index " .. i .. ":\n")
        for j, stat in ipairs(stats_name) do
            f:write(stat .. ": " .. Global.custom_armor[i][stat] .. "\n")
        end
    end
    f:close()
end

function load_armor()
    init_custom_armor()
    local f = io.open(save_path, "r")
    if f == nil then
        io.stdout:write("[ArmorOverhaul] custom armor file not found\n")
        return
    end
    for i = 1, index_count do
        local line = f:read()
        for j, stat in ipairs(stats_name) do
            line = f:read()
            local stat = string.sub(line, 1, string.find(line, ":") - 1)
            local value = tonumber(string.sub(line, string.find(line, ":") + 1))
            if not value then return end
            Global.custom_armor[i][stat] = value
        end
    end
    f:close()
end

function get_custom_armor_cost(stat)
    if stat == "concealment" then
        return stat_cost.concealment[cust[index][stat]]
    end
    local value = cust[index][stat] or 0
    if stat == "dodge" then
        value = value + 1
    elseif stat == "jump_speed_multiplier" then
        value = (value - 0.75) * 4
    elseif stat == "skill_ammo_mul" then
        value = (value - 0.1) / 0.9
    end
    return value * (stat_cost[stat] or 1) / (stats[stat] or 1)
end

function get_custom_armor_value(stat)
    if stat == "oncealment" then
        return stats.concealment[cust[index][stat]]
    end
    return cust[index][stat] or 0
end

load_armor()

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

menu_after('safehouse', mechanics)





function init_value(item)
    local name = item:name()
    if name == adresses.armor then
        item:set_value(get_custom_armor_value("armor"))
    elseif name == adresses.movement then
        item:set_value(get_custom_armor_value("movement"))
    elseif name == adresses.concealment then
        item:set_value(get_custom_armor_value("concealment"))
    elseif name == adresses.dodge then
        item:set_value(get_custom_armor_value("dodge"))
    elseif name == adresses.damage_shake then
        item:set_value(get_custom_armor_value("damage_shake"))
    elseif name == adresses.stamina then
        item:set_value(get_custom_armor_value("stamina"))
    elseif name == adresses.skill_ammo_mul then
        item:set_value(get_custom_armor_value("skill_ammo_mul"))
    elseif name == adresses.health_damage_reduction_min_dmg then
        item:set_value(get_custom_armor_value("health_damage_reduction_min_dmg"))
    elseif name == adresses.health_damage_reduction_min_value then
        item:set_value(get_custom_armor_value("health_damage_reduction_min_value"))
    elseif name == adresses.health_damage_reduction_max_dmg then
        item:set_value(get_custom_armor_value("health_damage_reduction_max_dmg"))
    elseif name == adresses.health_damage_reduction_max_value then
        item:set_value(get_custom_armor_value("health_damage_reduction_max_value"))
    elseif name == adresses.deflect_min_dmg then
        item:set_value(get_custom_armor_value("deflect_min_dmg"))
    elseif name == adresses.deflect_min_value then
        item:set_value(get_custom_armor_value("deflect_min_value"))
    elseif name == adresses.deflect_max_dmg then
        item:set_value(get_custom_armor_value("deflect_max_dmg"))
    elseif name == adresses.deflect_max_value then
        item:set_value(get_custom_armor_value("deflect_max_value"))
    elseif name == adresses.regen then
        item:set_value(get_custom_armor_value("regen"))
    elseif name == adresses.explosion_damage_reduction then
        item:set_value(get_custom_armor_value("explosion_damage_reduction"))
    elseif name == adresses.hp_regen then
        item:set_value(get_custom_armor_value("hp_regen"))
    elseif name == adresses.hp_addend then
        item:set_value(get_custom_armor_value("hp_addend"))
    elseif name == adresses.jump_speed_multiplier then
        item:set_value(get_custom_armor_value("jump_speed_multiplier"))
    elseif name == adresses.ap_regen_suppressed_max_multiplier then
        item:set_value(get_custom_armor_value("ap_regen_suppressed_max_multiplier"))
    elseif name == adresses.bleeding_reduction then
        item:set_value(get_custom_armor_value("bleeding_reduction"))
    end
end

local m = {}

m[#m+1] = menu_item{
    text_id = "custom_armor_points",
    size = 8,
    type = "MenuItemDivider"
}

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_armor",
    help = "custom_armor_armor_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].armor) or 10) or 10,
    value = Global and (Global.custom_armor and (Global.custom_armor[index].armor) or 10) or 10,
    callback = function(self, item)
        change_value("armor", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    show_value = true,
    max = 30,
}
adresses.armor = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_movement",
    help_id = "custom_armor_movement_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].movement) or 0) or 0,
    callback = function(self, item)
        change_value("movement", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 35,
}
adresses.movement = addr(m[#m])

m[#m+1] = menu_item{
    type = "MenuItemMultiChoice",
    text_id = "bm_menu_concealment",
    help_id = "custom_armor_concealment_help",
    localize = true,
    {
        _meta = "option",
        no_text = true,
        text_id = "1",
        value = 1
    },
    {
        _meta = "option",
        no_text = true,
        text_id = "12",
        value = 2
    },
    {
        _meta = "option",
        no_text = true,
        text_id = "18",
        value = 3
    },
    {
        _meta = "option",
        no_text = true,
        text_id = "21",
        value = 4
    },
    {
        _meta = "option",
        no_text = true,
        text_id = "23",
        value = 5
    },
    {
        _meta = "option",
        no_text = true,
        text_id = "26",
        value = 6
    },
    {
        _meta = "option",
        no_text = true,
        text_id = "30",
        value = 7
    },
    callback = function(self, item)
        change_value("concealment", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
}
adresses.concealment = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_dodge",
    help_id = "custom_armor_dodge_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].dodge) or 0) or 0,
    callback = function(self, item)
        change_value("dodge", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    min = -1,
    max = 0,
}
adresses.dodge = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_damage_shake",
    help_id = "custom_armor_damage_shake_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].damage_shake) or 0) or 0,
    callback = function(self, item)
        change_value("damage_shake", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 0.5,
}
adresses.damage_shake = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_stamina",
    help_id = "custom_armor_stamina_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].stamina) or 0) or 0,
    callback = function(self, item)
        change_value("stamina", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 20,
}
adresses.stamina = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_ammo_mul",
    help_id = "custom_armor_skill_ammo_mul_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].skill_ammo_mul) or 0) or 0,
    callback = function(self, item)
        change_value("skill_ammo_mul", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    min = 0.1,
}
adresses.skill_ammo_mul = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_hdr_min_dmg",
    help_id = "custom_armor_hdr_min_dmg_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].health_damage_reduction_min_dmg) or 0) or 0,
    callback = function(self, item)
        change_value("health_damage_reduction_min_dmg", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
}
adresses.health_damage_reduction_min_dmg = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_hdr_min_procent",
    help_id = "custom_armor_hdr_min_value_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].health_damage_reduction_min_value) or 0) or 0,
    callback = function(self, item)
        change_value("health_damage_reduction_min_value", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 0.25,
}
adresses.health_damage_reduction_min_value = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_hdr_max_dmg",
    help_id = "custom_armor_hdr_max_dmg_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].health_damage_reduction_max_dmg) or 0) or 0,
    callback = function(self, item)
        change_value("health_damage_reduction_max_dmg", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 8,
}
adresses.health_damage_reduction_max_dmg = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_hdr_max_procent",
    help_id = "custom_armor_hdr_max_value_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].health_damage_reduction_max_value) or 0) or 0,
    callback = function(self, item)
        change_value("health_damage_reduction_max_value", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 0.35,
}
adresses.health_damage_reduction_max_value = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_deflect_min_dmg",
    help_id = "custom_armor_deflect_min_dmg_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].deflect_min_dmg) or 0) or 0,
    callback = function(self, item)
        change_value("deflect_min_dmg", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
}
adresses.deflect_min_dmg = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_deflect_min_procent",
    help_id = "custom_armor_deflect_min_value_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].deflect_min_value) or 0) or 0,
    callback = function(self, item)
        change_value("deflect_min_value", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 0.35,
}
adresses.deflect_min_value = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_deflect_max_dmg",
    help_id = "custom_armor_deflect_max_dmg_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].deflect_max_dmg) or 0) or 0,
    callback = function(self, item)
        change_value("deflect_max_dmg", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 10
}
adresses.deflect_max_dmg = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_deflect_max_procent",
    help_id = "custom_armor_deflect_max_value_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].deflect_max_value) or 0) or 0,
    callback = function(self, item)
        change_value("deflect_max_value", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 0.25,
}
adresses.deflect_max_value = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_regen",
    help_id = "custom_armor_regen_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].regen) or 0) or 0,
    callback = function(self, item)
        change_value("regen", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 5,
}
adresses.regen = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_explosion_damage_reduction",
    help_id = "custom_armor_edr_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].explosion_damage_reduction) or 0) or 0,
    callback = function(self, item)
        change_value("explosion_damage_reduction", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 0.5,
}
adresses.explosion_damage_reduction = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_hp_addend",
    help_id = "custom_armor_hp_addend_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].hp_addend) or 0) or 0,
    callback = function(self, item)
        change_value("hp_addend", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    max = 2,
}
adresses.hp_addend = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_jump_speed_multiplier",
    help_id = "custom_armor_jump_speed_multiplier_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].jump_speed_multiplier) or 0) or 0,
    callback = function(self, item)
        change_value("jump_speed_multiplier", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    min = 0.75,
}
adresses.jump_speed_multiplier = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_ap_regen_suppressed_max_multiplier",
    help_id = "custom_armor_ap_regen_suppressed_max_multiplier_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].ap_regen_suppressed_max_multiplier) or 0) or 0,
    callback = function(self, item)
        change_value("ap_regen_suppressed_max_multiplier", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
}
adresses.ap_regen_suppressed_max_multiplier = addr(m[#m])

m[#m+1] = menu_item{
    type = 'CoreMenuItemSlider.ItemSlider',
    text_id = "bm_menu_bleeding_reduction",
    help_id = "custom_armor_bleeding_reduction_help",
    localize = true,
    size = 8,
    default = Global and (Global.custom_armor and (Global.custom_armor[index].bleeding_reduction) or 1) or 1,
    callback = function(self, item)
        change_value("bleeding_reduction", item:value())
        save_armor()
    end,
    visible_callback = function(self, item)
        init_value(item)
        return true
    end,
    show_value = true,
    max = 2.5
}
adresses.bleeding_reduction = addr(m[#m])

local custom_armor_menu = menu_item{
    name = "custom_armor_menu",
    text_id = "custom_armor",
    help_id = "custom_armor_help",
    localize = true,
    next_node = menu_submenu(m, "custom_armor_menu"),
    callback = function(self, item)
    end,
}

menu_after('safehouse', custom_armor_menu)