-- open help files in full window
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("only")
        end
    end,
})
