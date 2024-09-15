local colors = require("colors")

local colorscheme = {
    Comment = { ctermfg = colors.darkest_foreground }, -- just comments
    SpecialComment = { ctermfg = colors.debug }, -- special things inside a comment
}
require("utils").set_hl(colorscheme)

return {}
