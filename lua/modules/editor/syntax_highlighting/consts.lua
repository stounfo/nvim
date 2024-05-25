local color = require("colors").magenta
local colors = require("colors")

local colorscheme = {
    String = { ctermfg = colors.bright_black }, -- a string constant: "this is a string"
    Character = { ctermfg = color }, --  a character constant: 'c', '\n'
    Number = { ctermfg = color }, --   a number constant: 234, 0xff
    Float = { link = "Number" }, --    a floating point constant: 2.3e10
    Boolean = { ctermfg = color }, --  a boolean constant: TRUE, false
    SpecialChar = { ctermfg = colors.white }, -- special character in a constant
    Special = { ctermfg = colors.white }, -- (preferred) any special symbol

    Constant = { ctermfg = colors.white }, -- (preferred) any constant
    ["@constant.builtin"] = { ctermfg = color },
}
require("utils").set_hl(colorscheme)

return {}
