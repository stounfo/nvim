local colors = require("colors")

local colorscheme = {
    Visual = { ctermbg = colors.special_background },
}
require("utils").set_hl(colorscheme)

return {}
