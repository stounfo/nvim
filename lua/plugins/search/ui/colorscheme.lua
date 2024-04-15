local colors = require("ui.colorscheme.colors")

return {
    TelescopeMatching = { ctermfg = colors.bright_yellow },
    TelescopeResultsVariable = { ctermbg = colors.debug },
    TelescopeBorder = { ctermbg = colors.normal_bg, ctermfg = colors.muted_fg },
    TelescopePromptTitle = { ctermfg = colors.highlighted_fg },
    TelescopeResultsTitle = { ctermfg = colors.highlighted_fg },
    TelescopePreviewTitle = { ctermfg = colors.highlighted_fg },
}
