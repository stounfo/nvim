local my_commands = {
    toggle_zoom = function()
        local cur_win = vim.api.nvim_get_current_win()
        local all_wins = vim.api.nvim_tabpage_list_wins(0) -- Get all windows in the current tab

        -- Check if there are saved sizes for any window
        if next(vim.g.prev_window_sizes) then
            -- Restore sizes of all windows
            for _, win in ipairs(all_wins) do
                local win_str = tostring(win)
                if vim.g.prev_window_sizes[win_str] then
                    vim.api.nvim_win_set_height(
                        win,
                        vim.g.prev_window_sizes[win_str].height
                    )
                    vim.api.nvim_win_set_width(
                        win,
                        vim.g.prev_window_sizes[win_str].width
                    )
                end
            end
            vim.g.prev_window_sizes = {}
        else
            -- Save current sizes and maximize the current window
            local temp_window_sizes = {}
            for _, win in ipairs(all_wins) do
                local win_str = tostring(win)
                temp_window_sizes[win_str] = {
                    height = vim.api.nvim_win_get_height(win),
                    width = vim.api.nvim_win_get_width(win),
                }
            end
            vim.g.prev_window_sizes = temp_window_sizes
            vim.api.nvim_win_set_height(
                cur_win,
                vim.api.nvim_get_option("lines") - 2
            ) -- adjust for command line
            vim.api.nvim_win_set_width(
                cur_win,
                vim.api.nvim_get_option("columns")
            )
        end
    end,
}

vim.g.prev_window_sizes = vim.g.prev_window_sizes or {}
vim.g.is_prev_window_float = vim.g.is_prev_window_float or false
local _ = {
    vim.api.nvim_create_autocmd("WinEnter", {
        callback = function()
            local cur_win = vim.api.nvim_get_current_win()
            local cur_win_str = tostring(cur_win)

            if
                vim.g.prev_window_sizes[cur_win_str]
                and not vim.g.is_prev_window_float
            then
                for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                    local win_str = tostring(win)
                    if vim.g.prev_window_sizes[win_str] then
                        vim.api.nvim_win_set_height(
                            win,
                            vim.g.prev_window_sizes[win_str].height
                        )
                        vim.api.nvim_win_set_width(
                            win,
                            vim.g.prev_window_sizes[win_str].width
                        )
                    end
                end
                vim.g.prev_window_sizes = {}
            end

            -- Check if the current window is a float window
            vim.g.is_prev_window_float = vim.api.nvim_win_get_config(cur_win).relative
                ~= ""
        end,
    }),
}

return {
    "folke/lazy.nvim",
    my_commands = my_commands,
}
