local colors = require("colors")

local colorscheme = {
    MatchParen = { ctermbg = colors.special_background },
}
require("utils").set_hl(colorscheme)

return {}
