local colors = require("colors")

local colorscheme = {
    IlluminatedWordText = { ctermbg = colors.default_backgound },
    IlluminatedWordRead = { ctermbg = colors.lightest_background },
    IlluminatedWordWrite = { ctermbg = colors.lightest_background },
}

return {
    "RRethy/vim-illuminate",
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
        require("utils").set_hl(colorscheme)
        require("illuminate").configure({
            providers = {
                "lsp",
            },
        })
    end,
}
