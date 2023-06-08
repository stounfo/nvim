vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

-- Change diagnostic signs
for type, icon in pairs(require("consts").diagnostic_signs) do
  local hl = "DiagnosticSign" .. type:sub(1, 1):upper() .. type:sub(2)
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- fix colors
vim.opt.termguicolors = true

-- fix tabs (tabs vs spaces. The spaces win!)
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- fix maps in russian
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
