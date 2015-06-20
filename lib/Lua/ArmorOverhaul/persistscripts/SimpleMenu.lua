-- SimpleMenu implementation thanks to Harfatus

--SCROLL DOWN TO THE COMMENT BLOCK, YOU CAN IGNORE THIS FIRST PART.
if not SimpleMenu then
    if not managers then return end
    SimpleMenu = class()

    function SimpleMenu:init(title, message, options)
        self.dialog_data = { title = title, text = message, button_list = {},
                             id = tostring(math.random(0,0xFFFFFFFF)) }
        self.visible = false
        for _,opt in ipairs(options) do
            local elem = {}
            elem.text = opt.text
            opt.data = opt.data or nil
            opt.callback = opt.callback or nil
            elem.callback_func = callback(self, self, "_do_callback",
                                          { data = opt.data,
                                            callback = opt.callback})
            elem.cancel_button = opt.is_cancel_button or false
            if opt.is_focused_button then
                self.dialog_data.focus_button = #self.dialog_data.button_list+1
            end
            table.insert(self.dialog_data.button_list, elem)
        end
        return self
    end

    function SimpleMenu:_do_callback(info)
        if info.callback then
            if info.data then
                info.callback(info.data)
            else
                info.callback()
            end
        end
        self.visible = false
    end

    function SimpleMenu:show()
        if self.visible then
            return
        end
        self.visible = true
        managers.system_menu:show(self.dialog_data)
    end

    function SimpleMenu:hide()
        if self.visible then
            managers.system_menu:close(self.dialog_data.id)
            self.visible = false
            return
        end
    end
end

patched_update_input = patched_update_input or function (self, t, dt )
    if self._data.no_buttons then
        return
    end
    
    local dir, move_time
    local move = self._controller:get_input_axis( "menu_move" )

    if( self._controller:get_input_bool( "menu_down" )) then
        dir = 1
    elseif( self._controller:get_input_bool( "menu_up" )) then
        dir = -1
    end
    
    if dir == nil then
        if move.y > self.MOVE_AXIS_LIMIT then
            dir = 1
        elseif move.y < -self.MOVE_AXIS_LIMIT then
            dir = -1
        end
    end

    if dir ~= nil then
        if( ( self._move_button_dir == dir ) and self._move_button_time and ( t < self._move_button_time + self.MOVE_AXIS_DELAY ) ) then
            move_time = self._move_button_time or t
        else
            self._panel_script:change_focus_button( dir )
            move_time = t
        end
    end

    self._move_button_dir = dir
    self._move_button_time = move_time
    
    local scroll = self._controller:get_input_axis( "menu_scroll" )
    -- local sdir
    if( scroll.y > self.MOVE_AXIS_LIMIT ) then
        self._panel_script:scroll_up()
        -- sdir = 1
    elseif( scroll.y < -self.MOVE_AXIS_LIMIT ) then
        self._panel_script:scroll_down()
        -- sdir = -1
    end
end
managers.system_menu.DIALOG_CLASS.update_input = patched_update_input
managers.system_menu.GENERIC_DIALOG_CLASS.update_input = patched_update_input

--[[
SimpleMenu allows you to create a simple menu in the game for executing
all your various Lua code without having to remember which buttons are assigned
to what.

An example is included below for usage. You can define an arbitrary
number of options. The "text" field is mandatory, all others are optional;
obviously though, if you want the option to actually do something, a callback
should be defined.

The original up-arrow key behaviour was not handled correctly due to the mouse
check being bundled in with it. The function is now replaced in-line and behaves
as it should.

Additionally, whilst showing and hiding is handled, it too does not seem to do
anything.

Place your own code below.
--]]

opts = {
  { text = "Cancel", is_cancel_button = true },
}
menus = {}

menus.hurt = {}
menus.hurt.intro = SimpleMenu:new(managers.localization:text("Hurt animations - Introduction"), managers.localization:text("description_hurt_animation_intro_desc"), opts)
menus.hurt.duration = SimpleMenu:new(managers.localization:text("Hurt animations - Animation duration"), managers.localization:text("description_hurt_animation_duration_desc"), opts)

menus.carrying_bags = SimpleMenu:new(managers.localization:text("Carrying bags"), managers.localization:text("description_carrying_bags_desc"), opts)

menus.interaction = SimpleMenu:new(managers.localization:text("Long Range interaction (Shouting/Highlighting)"), managers.localization:text("description_interaction_desc"), opts)

menus.new = {}
menus.new.dodge = SimpleMenu:new(managers.localization:text("description_new_dodge_desc_title"), managers.localization:text("description_new_dodge_desc"), opts)
menus.new.armor_regen = SimpleMenu:new(managers.localization:text("description_new_armor_regen_desc_title"), managers.localization:text("description_new_armor_regen_desc"), opts)
menus.new.bullet_deflection = SimpleMenu:new(managers.localization:text("description_new_bullet_deflection_desc_title"), managers.localization:text("description_new_bullet_deflection_desc"), opts)
menus.new.hdr = SimpleMenu:new(managers.localization:text("description_new_hdr_desc_title"), managers.localization:text("description_new_hdr_desc"), opts)
menus.new.armor_ammo = SimpleMenu:new(managers.localization:text("description_new_armor_ammo_desc_title"), managers.localization:text("description_new_armor_ammo_desc"), opts)
menus.new.edr = SimpleMenu:new(managers.localization:text("description_new_edr_desc_title"), managers.localization:text("description_new_edr_desc"), opts)
menus.new.health_armor = SimpleMenu:new(managers.localization:text("description_new_health_armor_desc_title"), managers.localization:text("description_new_health_armor_desc"), opts)
menus.new.health_regen = SimpleMenu:new(managers.localization:text("description_new_health_regen_desc_title"), managers.localization:text("description_new_health_regen_desc"), opts)
menus.new.jump_armor = SimpleMenu:new(managers.localization:text("description_new_jump_armor_desc_title"), managers.localization:text("description_new_jump_armor_desc"), opts)
menus.new.bleeding = SimpleMenu:new(managers.localization:text("description_new_bleeding_desc_title"), managers.localization:text("description_new_bleeding_desc"), opts)
menus.new.difficulty = SimpleMenu:new(managers.localization:text("description_new_difficulty_desc_title"), managers.localization:text("description_new_difficulty_desc"), opts)
menus.new.armor_reduction = SimpleMenu:new(managers.localization:text("description_new_armor_reduction_desc_title"), managers.localization:text("description_new_armor_reduction_desc"), opts)
menus.new.armor_drainer = SimpleMenu:new(managers.localization:text("description_new_armor_drainer_desc_title"), managers.localization:text("description_new_armor_drainer_desc"), opts)