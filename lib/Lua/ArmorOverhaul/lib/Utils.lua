Utils = {}

function Utils.table_print(tt, done)
    if ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD then
        Utils.table_print_HoxHUD(tt, done)
    elseif ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_BLT then
        Utils.table_print_BLT(tt, done)
    end
end

function Utils.table_print_HoxHUD(tt, done)
    local file = io.stdout--io.open("TableDump.txt", "a+")
    done = done or {}
    if type(tt) == "table" then
        for key, value in pairs(tt) do
            if type(value) == "table" and not done[value] then
                done[value] = true
                -- Console(string.format("<%s> => table", tostring(key)))
                file:write("<"..tostring(key).."> => table\n")
                Utils.table_print_HoxHUD(value, done)
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

function Utils.table_print_BLT(tt, done)
    done = done or {}
    if type(tt) == "table" then
        for key, value in pairs(tt) do
            if type(value) == "table" and not done[value] then
                done[value] = true
                log("<"..tostring(key).."> => table\n")
                Utils.table_print_BLT(value, done)
            else
                log("["..tostring(key).."] => "..tostring(value), "\n")
            end
        end
    else 
        log(tostring(tt), "\n")
    end
end

function Utils.print_log(text)
    if ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_HOXHUD then
        if io then io.stdout:write(text) end
    elseif ArmorOverhaul.ARMOR_OVERHAUL_HOOK == ArmorOverhaul.HOOK_BLT then
        if log then log(text, "") end
    end
end

function Utils.file_exists(name)
   local f=io and io.open(name,"r") or nil
   if f~=nil then io.close(f) return true else return false end
end

function Utils.parse_options(filename)
    local f = io and io.open(filename, "r") or nil
    if f == nil then return false end

    for line in io.lines(filename) do
        ArmorOverhaul[line:sub(1, line:find("=") - 1)] = line:sub(line:find("=") + 1)
    end

    io.close(f)

    return true
end

Utils.print_log("[ArmorOverhaul] Util functions initialized\n")