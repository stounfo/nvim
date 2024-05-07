local M = {}

M.numbercolumn_enabled = function()
    return vim.opt.number:get() or vim.opt.relativenumber:get()
end

return M
