local colors = require("colors")

local colorscheme = {
    Normal = { ctermbg = colors.default_background },
    CursorLine = { ctermbg = colors.light_background },
    NormalFloat = { ctermbg = colors.default_background },
    LineNr = {
        ctermbg = colors.default_background,
        ctermfg = colors.darkest_foreground,
    },
    CursorLineNr = {
        ctermbg = colors.default_background,
        ctermfg = colors.default_foreground,
    },
    SignColumn = { ctermbg = colors.default_background },
    WinSeparator = { ctermfg = colors.light_background },

    FloatBorder = {
        ctermbg = colors.default_background,
        ctermfg = colors.darkest_foreground,
    },
    Title = {
        ctermbg = colors.default_background,
        ctermfg = colors.default_foreground,
    },
    FloatTitle = {
        ctermbg = colors.default_background,
        ctermfg = colors.default_foreground,
    },
    ColorColumn = { ctermbg = colors.light_background },
}
require("utils").set_hl(colorscheme)

return {}
