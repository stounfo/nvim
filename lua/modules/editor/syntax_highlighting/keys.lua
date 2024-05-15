local color = require("colors").bright_black

local colorscheme = {
    Conditional = { ctermfg = color }, --  if, then, else, endif, switch, etc.
    Repeat = { ctermfg = color }, --   for, do, while, etc.
    Keyword = { ctermfg = color }, --  any other keyword
    Exception = { ctermfg = color }, --  try, catch, throw
    Label = { ctermfg = color }, --    case, default, etc.
    Structure = { ctermfg = color }, --  struct, union, enum, etc.
    Special = { ctermfg = color }, -- (preferred) any special symbol
    Tag = { ctermfg = color }, -- you can use CTRL-] on this
    Statement = { ctermfg = color }, -- (preferred) any statement
    StorageClass = { ctermfg = color }, -- static, privat, register, volatile, etc.
    Typedef = { ctermfg = color }, --  A typedef
    ["@keyword.function"] = { ctermfg = color }, -- Lambda
}
require("utils").set_hl(colorscheme)

return {}
