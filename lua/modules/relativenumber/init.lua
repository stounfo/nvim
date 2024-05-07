vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        if require("modules.relativenumber.utils").numbercolumn_enabled() then
            vim.opt.relativenumber = false
            vim.opt.cursorline = false
        end
    end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        if require("modules.relativenumber.utils").numbercolumn_enabled() then
            vim.opt.relativenumber = true
            vim.opt.cursorline = true
        end
    end,
})
