local color = require("colors").bright_black

local colorscheme = {
    Delimiter = { ctermfg = color }, -- character that needs attention like (, ), {, }, [, ], etc.
}
require("utils").set_hl(colorscheme)

return {}
