local colors = require("colors")

local colorscheme = {
    Cursor = {
        ctermbg = colors.yellow,
    },
}
require("utils").set_hl(colorscheme)

return {}
