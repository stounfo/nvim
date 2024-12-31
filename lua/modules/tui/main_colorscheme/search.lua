local colors = require("colors")

local colorscheme = {
    Search = { ctermbg = colors.dim_blue },
    CurSearch = { ctermbg = colors.dim_red },
}
require("utils").set_hl(colorscheme)

return {}
