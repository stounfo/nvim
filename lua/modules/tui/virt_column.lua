local color = require("colors").darkest_foreground

local colorscheme = {
    ColorColumn = {
        ctermfg = color,
    },
}

return {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        char = "▏",
    },
    config = function(_, opts)
        require("virt-column").setup(opts)
        require("utils").set_hl(colorscheme)
    end,
}
