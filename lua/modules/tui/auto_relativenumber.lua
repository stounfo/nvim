local utils = {
    numbercolumn_enabled = function()
        return vim.opt.number:get() or vim.opt.relativenumber:get()
    end,
}

local _ = {
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        callback = function()
            if utils.numbercolumn_enabled() then
                vim.opt.relativenumber = false
                vim.opt.cursorline = false
            end
        end,
    }),
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        callback = function()
            if utils.numbercolumn_enabled() then
                vim.opt.relativenumber = true
                vim.opt.cursorline = true
            end
        end,
    }),
}

return {}
