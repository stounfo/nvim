local color = require("colors").dark_foreground

local colorscheme = {
    Delimiter = { ctermfg = color }, -- character that needs attention like (, ), {, }, [, ], etc.
    Operator = { ctermfg = color }, -- any operator: +, -, *, /, etc.
}
require("utils").set_hl(colorscheme)

return {}
