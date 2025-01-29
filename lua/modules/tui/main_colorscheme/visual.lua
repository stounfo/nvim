local colors = require("colors")

local colorscheme = {
    Visual = { ctermbg = colors.dim_magenta },
}
require("utils").set_hl(colorscheme)

return {}
