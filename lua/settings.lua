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

-- fix tabs (tabs vs spaces. The spaces win!)
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.timeoutlen = 200

-- fix maps in russian
-- TODO set keymap=russian-jcukenwin
vim.opt.langmap =
    "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- fix relatie path of current dir for neotree
-- vim.opt.autochdir = true

local M = {}

M.hide_by_pattern = utils.merge_arrays(
    utils.read_gitignore(os.getenv("HOME") .. "/.gitignore"),
    utils.read_local_settings().hide_by_pattern
)

M.icons = {
    File = "",
    Module = "",
    Namespace = "",
    Package = "",
    Class = "",
    Method = "",
    Property = "",
    Field = "",
    Constructor = "",
    Enum = "",
    Interface = "",
    Function = "",
    Variable = "",
    Constant = "",
    String = "",
    Number = "",
    Boolean = "",
    Array = "",
    Object = "",
    Key = "",
    Null = "",
    EnumMember = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

return M
