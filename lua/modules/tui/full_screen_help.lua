-- open help files in full window
local _ = {
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "help",
        callback = function()
            if vim.bo.filetype == "help" then
                vim.cmd("only")
            end
        end,
    }),
}

return {}
