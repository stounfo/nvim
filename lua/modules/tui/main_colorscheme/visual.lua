local colors = require("colors")

local colorscheme = {
    Visual = { ctermbg = colors.dim_blue },
}
require("utils").set_hl(colorscheme)

return {}
