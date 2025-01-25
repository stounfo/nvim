local M = {}

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

M.exclude_from_array = function(array, to_exclude)
    local result = {}
    for _, value in ipairs(array) do
        local shouldExclude = false
        for _, excludeValue in ipairs(to_exclude) do
            if value == excludeValue then
                shouldExclude = true
                break
            end
        end
        if not shouldExclude then
            table.insert(result, value)
        end
    end
    return result
end

return M
