vim.g.mapleader = " "

vim.opt.number = true
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.swapfile = false
-- vim.opt.colorcolumn = "79"
vim.opt.signcolumn = "yes"

vim.o.showmode = false

vim.opt.clipboard = "unnamedplus"

-- Change diagnostic signs
for type, icon in pairs(require("consts").diagnostic_signs) do
  local hl = "DiagnosticSign" .. type:sub(1, 1):upper() .. type:sub(2)
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- fix colors
vim.o.termguicolors = true

-- fix tabs
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
