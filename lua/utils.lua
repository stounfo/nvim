local M = {}

M.numbercolumn_enabled = function()
    return vim.opt.number:get() or vim.opt.relativenumber:get()
end

M.set_hl = function(groups)
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

M.read_gitignore = function(path)
    local lines = {}

    local file = io.open(path, "r")
    if not file then
        return lines
    end

    for line in file:lines() do
        -- Ignore comments and blank lines
        if not (line:match("^#") or line:match("^%s*$")) then
            if line ~= ".dev" then
                table.insert(lines, line)
            end
        end
    end

    file:close()
    return lines
end

M.read_local_settings = function()
    local lua_dev_path = "./.dev/lua/?.lua"
    package.path = package.path .. ";" .. lua_dev_path

    local function file_exists(path)
        local f = io.open(path, "r")
        if f then
            f:close()
            return true
        else
            return false
        end
    end

    local file_path = "./.dev/lua/local_settings.lua"
    if file_exists(file_path) then
        local local_settings = require("local_settings")
        return local_settings
    else
        return {}
    end
end

M.merge_arrays = function(a1, a2)
    if not a1 and not a2 then
        return {}
    elseif not a1 then
        return a2
    elseif not a2 then
        return a1
    end

    local result = {}
    for i = 1, #a1 do
        table.insert(result, a1[i])
    end
    for i = 1, #a2 do
        table.insert(result, a2[i])
    end
    return result
end

M.merge_tables = function(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

return M
