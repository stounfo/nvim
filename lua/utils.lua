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

M.merge_tables = function(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

M.replace_visual_selection_with_command = function(command)
    local function split_string_by_newline(str)
        local result = {}
        for line in str:gmatch("[^\n]+") do
            table.insert(result, line)
        end
        return result
    end
    local function get_visual_selection_coordinates()
        local function get_line_length(line_id)
            local bufnr = 0
            local line_content =
                vim.api.nvim_buf_get_lines(bufnr, line_id - 1, line_id, false)
            if #line_content > 0 then
                return #line_content[1]
            else
                return 0
            end
        end
        local modeInfo = vim.api.nvim_get_mode()
        local mode = modeInfo.mode

        local cursor = vim.api.nvim_win_get_cursor(0)
        local cline, ccol = cursor[1], cursor[2]
        local vline, vcol = vim.fn.line("v"), vim.fn.col("v")

        local sline, scol
        local eline, ecol
        if cline == vline then
            if ccol <= vcol then
                sline, scol = cline, ccol
                eline, ecol = vline, vcol
                scol = scol + 1
            else
                sline, scol = vline, vcol
                eline, ecol = cline, ccol
                ecol = ecol + 1
            end
        elseif cline < vline then
            sline, scol = cline, ccol
            eline, ecol = vline, vcol
            scol = scol + 1
        else
            sline, scol = vline, vcol
            eline, ecol = cline, ccol
            ecol = ecol + 1
        end

        if mode == "V" or mode == "CTRL-V" or mode == "\22" then
            scol = 1
            ecol = get_line_length(eline)
        end
        return {
            start = { row = sline, col = scol - 1 },
            finish = { row = eline, col = ecol },
        }
    end

    local coordinates = get_visual_selection_coordinates()
    local selected_text = vim.fn.shellescape(
        table.concat(
            vim.api.nvim_buf_get_text(
                0,
                coordinates.start.row - 1,
                coordinates.start.col,
                coordinates.finish.row - 1,
                coordinates.finish.col,
                {}
            ),
            "\n"
        )
    )

    local final_command = "echo -n " .. selected_text .. " | " .. command
    local result = vim.fn.system(final_command)
    vim.api.nvim_buf_set_text(
        0,
        coordinates.start.row - 1,
        coordinates.start.col,
        coordinates.finish.row - 1,
        coordinates.finish.col,
        split_string_by_newline(result)
    )
end

return M
