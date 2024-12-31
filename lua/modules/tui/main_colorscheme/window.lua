local colors = require("colors")

local colorscheme = {
    Normal = {
        ctermfg = colors.default_foreground,
        ctermbg = colors.default_background,
    },
    CursorLine = {
        ctermbg = colors.light_background,
    },
    NormalFloat = {
        ctermfg = colors.default_foreground,
        ctermbg = colors.default_background,
    },
    LineNr = {
        ctermfg = colors.darkest_foreground,
        ctermbg = colors.default_background,
    },
    CursorLineNr = {
        ctermfg = colors.default_foreground,
        ctermbg = colors.default_background,
    },
    SignColumn = { ctermbg = colors.default_background },
    WinSeparator = { ctermfg = colors.light_background },

    FloatBorder = {
        ctermfg = colors.darkest_foreground,
        ctermbg = colors.default_background,
    },
    Title = {
        ctermfg = colors.default_foreground,
        ctermbg = colors.default_background,
    },
    FloatTitle = {
        ctermfg = colors.default_foreground,
        ctermbg = colors.default_background,
    },
    ColorColumn = { ctermbg = colors.light_background },
}
require("utils").set_hl(colorscheme)

return {}
