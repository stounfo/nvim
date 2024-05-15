local colors = require("colors")

local colorscheme = {
    IblIndent = { ctermfg = colors.darkest_foreground, blend = 0 },
    IblScope = { ctermfg = colors.darkest_foreground, blend = 0 },
}

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    config = function()
        require("utils").set_hl(colorscheme)
        require("ibl").setup({
            indent = {
                char = "▏",
            },
            scope = {
                enabled = false,
            },
        })
    end,
}
