local colors = require("colors")

local colorscheme = {
    TabLine = { ctermfg = colors.dark_foreground },
}
require("utils").set_hl(colorscheme)

return {}
