LAOUtils = {}

LAOUtils.options_file = ArmorOverhaul.ROOT .. "lua/options.lua"

function LAOUtils.table_debug(tt)
    if ArmorOverhaul.options.debug then
        LAOUtils.table_print(tt)
    end
end

function LAOUtils.table_print(tt, done)
    if ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD then
        LAOUtils.table_print_HoxHUD(tt, done)
    elseif ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_BLT then
        LAOUtils.table_print_BLT(tt, done)
    end
end

function LAOUtils.table_print_HoxHUD(tt, done)
    local file = io.stdout--io.open("TableDump.txt", "a+")
    done = done or {}
    if type(tt) == "table" then
        for key, value in pairs(tt) do
            if type(value) == "table" and not done[value] then
                done[value] = true
                -- Console(string.format("<%s> => table", tostring(key)))
                file:write("<"..tostring(key).."> => table\n")
                LAOUtils.table_print_HoxHUD(value, done)
            else
                -- Console(string.format("[%s] => %s", tostring(key), tostring(value)))
                file:write("["..tostring(key).."] => "..tostring(value).."\n")
            end
        end
    else 
        -- Console(tt) 
        file:write(tostring(tt).."\n")
    end
    --file:close()
end

function LAOUtils.table_print_BLT(tt, done)
    done = done or {}
    if type(tt) == "table" then
        for key, value in pairs(tt) do
            if type(value) == "table" and not done[value] then
                done[value] = true
                log("<"..tostring(key).."> => table\n")
                LAOUtils.table_print_BLT(value, done)
            else
                log("["..tostring(key).."] => "..tostring(value), "\n")
            end
        end
    else 
        log(tostring(tt), "\n")
    end
end

function LAOUtils.print(text, debug)
    if type(text) == "table" then
        LAOUtils.print(debug and "[ArmorOverhaul][debug] " or "[ArmorOverhaul] ")
        LAOUtils.table_print(text)
    else
        if ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD then
            if io then io.stdout:write((debug and "[ArmorOverhaul][debug] " or "[ArmorOverhaul] ") .. tostring(text) .. "\n") end
        elseif ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_BLT then
            if log then log((debug and "[ArmorOverhaul][debug] " or "[ArmorOverhaul] ") .. tostring(text), "") end
        end
    end
end

function LAOUtils.debug(text)
    if ArmorOverhaul.options.debug then
        LAOUtils.print(text)
    end
end

function LAOUtils.file_exists(name)
   local f=io and io.open(name,"r") or nil
   if f~=nil then io.close(f) return true else return false end
end

function LAOUtils.parse_options()
    local f = io and io.open(LAOUtils.options_file, "r") or nil
    if f == nil then return false end

    for line in io.lines(LAOUtils.options_file) do
        local value = line:sub(line:find("=") + 1)
        local number = tonumber(value)
        ArmorOverhaul.options[line:sub(1, line:find("=") - 1)] = number and number or (value == "true" and true or (value == "false" and false or value))
    end
    ArmorOverhaul.options.debug = ArmorOverhaul.options.debug:lower() == "true" and true or false

    io.close(f)

    return true
end

---- Bug: new text is shown after a screen reload (when entering in another menu)
function LAOUtils.save_options()
    local f = io and io.open(LAOUtils.options_file, "w") or nil
    if f == nil then return false end

    for option, value in pairs(ArmorOverhaul.options) do
        local svalue = tostring(value)
        local number = tonumber(svalue)
        if svalue == "off" or svalue == "false" then
            svalue = "false"
        elseif svalue == "on" or svalue == "true" then
            svalue = "true"
        elseif number then
            svalue = number
        else
            svalue = '"' .. svalue .. '"'
        end
        f:write("ArmorOverhaul.options." .. option .. "=" .. svalue .. "\n")
    end
    if ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD then
        dofile(ArmorOverhaul.ROOT .. "lua/lang/localizationmanager_" .. ArmorOverhaul.options.lang .. ".lua")
    elseif ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_BLT then
        LocalizationManager:load_localization_file(ArmorOverhaul.ROOT .. "lang/" .. ArmorOverhaul.options.lang .. ".json")
    end
    return true
end

function LAOUtils.change_option(option, value)
    if option == "lang" then
        local lang
        if value == 0 then
            lang = "en"
        elseif value == 1 then
            lang = "fr"
        end
        ArmorOverhaul.options.lang = lang
    else
        ArmorOverhaul.options[option] = (value ~= "on" and value ~= "off") and value or (value == "on" and true or false)
    end
end