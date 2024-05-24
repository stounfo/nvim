local utils = require("utils")

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

vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.timeoutlen = 200

vim.opt.termguicolors = false

vim.opt.colorcolumn = "+1"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.langmap =
    "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

return {
    hide_by_pattern = utils.merge_arrays(
        utils.read_gitignore(os.getenv("HOME") .. "/.gitignore"),
        utils.read_local_settings().hide_by_pattern
    ),
}
