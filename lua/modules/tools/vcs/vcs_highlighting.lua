local colors = require("colors")

local colorscheme = {
    -- diff
    DiffAdd = { ctermbg = colors.dim_green }, -- diff mode: Added line |diff.txt|
    DiffChange = { ctermbg = colors.dim_blue }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { ctermbg = colors.dim_red }, -- diff mode: Deleted line |diff.txt|
    DiffText = { ctermbg = colors.dim_magenta }, -- diff mode: Changed line |diff.txt|
    --
    diffAdded = { ctermbg = colors.dim_green },
    diffRemoved = { ctermbg = colors.dim_red },
    diffChanged = { ctermbg = colors.dim_blue },
}
require("utils").set_hl(colorscheme)

return {}
