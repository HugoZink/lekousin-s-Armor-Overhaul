function addr(t)
    -- unique memory address of table, function, etc.
    return tostring(t):sub(#type(t) + 3)
end

if not txt then
    local_strings = local_strings or {}
    menu_hooks = menu_hooks or {}
    _menu_callbacks = _menu_callbacks or {}
    _menu_befores = _menu_befores or {}
    _menu_afters = _menu_afters or {}
    _menu_submenus = _menu_submenus or {}

    function txt(str)
        -- Idstring might not exist yet
        table.insert(local_strings, str)
        return str
    end
end

local mopts = {}
if Global then
    mopts = Global.menu_options or mopts
    Global.menu_options = mopts
end

function menu_item(item)
    local key, visible_key
    item._meta = item._meta or 'item'
    if item.text then item.text_id = txt(item.text) end
    if item.help then item.help_id = txt(item.help) end
    item.name = addr(item)

    local clbk = item.callback
    local visible_clbk = item.visible_callback

    if type(clbk) == 'function' then
        key = addr(clbk)
        _menu_callbacks[key] = clbk
    end
    if type(visible_clbk) == 'function' then
        visible_key = addr(visible_clbk)
        _menu_callbacks[visible_key] = visible_clbk
    end

    item.callback = key or clbk
    item.visible_callback = visible_key or visible_clbk
    return item -- has been edited in-place but convenient to return as well
end

function menu_checkbox(t)
    t.default = t.default == 'on' or t.default == true

    local on = {
        _meta = 'option',
        value = 'on',
        icon = 'guis/textures/menu_tickbox',
        s_icon = 'guis/textures/menu_tickbox',
        x = 24, y = 0,
        w = 24, h = 24,
        s_x = 24, s_y = 24,
        s_w = 24, s_h = 24,
    }
    local off = {
        _meta = 'option',
        value = 'off',
        icon = 'guis/textures/menu_tickbox',
        s_icon = 'guis/textures/menu_tickbox',
        x = 0,  y = 0,
        w = 24, h = 24,
        s_x = 0,  s_y = 24,
        s_w = 24, s_h = 24,
    }
    t.type = 'CoreMenuItemToggle.ItemToggle'
    t[1] = t.default and on or off
    t[2] = t.default and off or on
    t.option = t[1]

    if t.key then
        local _callback = t.callback
        t.callback = function(self, item)
            local state = item:value() == "on"
            mopts[t.key] = state
            if _callback then
                _callback(self, item)
            end
        end
    end

    return menu_item(t)
end

function menu_before(name, item)
    menu_item(item)
    table.insert(_menu_befores, {[name]=item})
end

function menu_after(name, item)
    menu_item(item)
    table.insert(_menu_afters, {[name]=item})
end

function menu_submenu(items)
    local legend_select = {
        _meta = 'legend',
        name = 'menu_legend_select',
    }
    local legend_back = {
        _meta = 'legend',
        name = 'menu_legend_back',
    }
    local back = {
        _meta = 'item',
        back = true,
        name = 'back',
        previous_node = true,
        text_id = 'menu_back',
        visible_callback = 'is_pc_controller',
    }
    local default = items and #items > 0 and items[1] or back
    local default_item = {
        _meta = 'default_item',
        name = default.name,
    }
    local new_menu = {
        _meta = 'node',
        modifier = 'MenuCustom',
        default_item = default_item,
        item = default,
        legend = legend_select,
        sync_state = 'options', -- optional; what other players will see in lobby
    }
    local name = addr(new_menu)
    new_menu.name = name
    table.insert(new_menu, legend_select)
    table.insert(new_menu, legend_back)
    table.insert(new_menu, default_item)
    for _,item in ipairs(items) do
        table.insert(new_menu, item)
    end
    table.insert(new_menu, back)
    table.insert(_menu_submenus, new_menu)
    return name
end

if RequiredScript ~= 'lib/managers/menumanager' then return end

function MenuCallbackHandler:truth() return true end
function MenuCallbackHandler:untruth() return false end

MenuCustom = class()
function MenuCustom:modify_node(node)
    for _, item in ipairs(node:items()) do
        local key = item:parameters().key
        if key and mopts[key] ~= nil then
            item:set_value(mopts[key] and 'on' or 'off')
        end
    end
    return node
end

for i,str in ipairs(local_strings) do
    local_strings[tostring(Idstring(str))] = str
end

function txt(str)
    local_strings[tostring(Idstring(str))] = str
    return str
end

local mt = getmetatable(Localizer)
local _lookup = mt.lookup
local _exists = mt.exists
function mt:exists(key)
    return local_strings[tostring(key)] ~= nil or _exists(self, key)
end
function mt:lookup(key)
    local ours = local_strings[tostring(key)]
    return ours or _lookup(self, key)
end

local function copy(t)
    -- shallow copy
    if type(t) ~= 'table' then return end
    local new = {}
    for key,value in pairs(t) do
        new[key] = value
    end
    return new
end

local function menu_finalize(item, existing)
    local new = copy(item)
    new.visible_callback = new.visible_callback or existing.visible_callback
    new._once = true
    return new
end

local function add_items(t)
    for i,menu in ipairs(t.menu) do
        for j,item in ipairs(menu) do
            if not item._once then
                item._once = true
                for k,after in ipairs(_menu_afters) do
                    if after[item.name] then
                        table.insert(menu, j + 1, menu_finalize(after[item.name], item))
                    end
                end
                for k,before in ipairs(_menu_befores) do
                    if before[item.name] then
                        table.insert(menu, j, menu_finalize(before[item.name], item))
                    end
                end
            end
        end
        for j,item in ipairs(menu) do
            item._once = nil
        end
    end
end

local mt = getmetatable(PackageManager)
local _script_data = mt.script_data
local idstring_menu = Idstring('menu')
function mt:script_data(type_id, path_id)
    local t = _script_data(self, type_id, path_id)
    if type_id == idstring_menu then
        --dump(t, 'dump/'..tostring(path_id):sub(11, -3)..'.yml')

        add_items(t)

        for _,submenu in pairs(_menu_submenus) do
            table.insert(t.menu, submenu)
        end

        for key,value in pairs(menu_hooks) do
            value(t)
        end

        for key,value in pairs(_menu_callbacks) do
            MenuCallbackHandler[key] = value
        end
        _menu_callbacks = {}
    end
    return t
end

dofile("mods/ArmorOverhaul/lua/lib/menus.lua")