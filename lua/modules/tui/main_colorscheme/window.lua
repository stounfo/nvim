local colors = require("colors")

local colorscheme = {
    Normal = { ctermbg = 234 },
    CursorLine = { ctermbg = colors.light_background },
    NormalFloat = { ctermbg = colors.default_background },
    LineNr = {
        ctermbg = colors.default_background,
        ctermfg = colors.dark_foreground,
    },
    CursorLineNr = {
        ctermbg = colors.default_background,
        ctermfg = colors.default_foreground,
    },
    SignColumn = { ctermbg = colors.default_background },
    WinSeparator = { ctermfg = colors.dark_backgound },

    FloatBorder = {
        ctermbg = colors.default_background,
        ctermfg = colors.dark_foreground,
    },
    FloatTitle = {
        ctermbg = colors.default_background,
        ctermfg = colors.light_foreground,
    },
}
require("utils").set_hl(colorscheme)

return {}