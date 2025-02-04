local utils = require("utils")

vim.g.mapleader = " "

vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.statuscolumn =
    [[%!v:lua.require'modules.tui.statuscolumn'.my_utils.statuscolumn()]]

vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.linebreak = false

vim.opt.showmode = false

vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.termguicolors = false
vim.opt.background = "dark"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.langmap =
    "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.opt.autoread = true

return {
    hide_by_pattern = vim.list_extend(
        utils.exclude_from_array(
            utils.read_gitignore(os.getenv("HOME") .. "/.gitignore"),
            { ".mise.toml" }
        ),
        utils.read_local_settings().hide_by_pattern or {}
    ),
}
