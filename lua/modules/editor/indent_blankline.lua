local colors = require("colors")

local colorscheme = {
    IblIndent = { ctermfg = colors.darkest_foreground, blend = 0 },
    IblScope = { ctermfg = colors.darkest_foreground, blend = 0 },
}

local options = function()
    return {
        indent = {
            char = "▏",
        },
        scope = {
            enabled = false,
        },
        exclude = {
            filetypes = {
                "markdown",
            },
        },
    }
end

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("ibl").setup(opts)
    end,
}
