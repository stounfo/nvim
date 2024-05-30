local colors = require("colors")

local colorscheme = {
    MatchParen = {
        ctermfg = colors.special_foreground,
        ctermbg = colors.special_background,
    },
}
require("utils").set_hl(colorscheme)

return {}
