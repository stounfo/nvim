local _ = {
    vim.api.nvim_create_autocmd("QuickFixCmdPost", {
        callback = function()
            vim.cmd("Trouble qflist open")
        end,
    }),
}

return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
}
