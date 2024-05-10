local colors = require("ui.colorscheme.colors")

return {
    GitSignsAdd = { ctermfg = colors.green },
    GitSignsChange = { ctermfg = colors.blue },
    GitSignsDelete = { ctermfg = colors.red },

    GitSignsAddPreview = { ctermfg = colors.green },
    GitSignsChangePreview = { ctermfg = colors.blue },
    GitSignsDeletePreview = { ctermfg = colors.red },
    -- GitSignsCurrentLineBlame = { ctermfg = C.surface1 },

    -- GitSignsAddPreview = {},
    -- GitSignsDeletePreview = {},
}
