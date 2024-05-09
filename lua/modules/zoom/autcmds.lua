-- Autocommand to restore window sizes when leaving any window, if needed
vim.g.prev_window_sizes = vim.g.prev_window_sizes or {}

vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        local cur_win = vim.api.nvim_get_current_win()
        local cur_win_str = tostring(cur_win)

        if vim.g.prev_window_sizes[cur_win_str] then
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
    end,
})
