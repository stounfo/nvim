local colors = require("colors")

local colorscheme = {
    WhichKeyFloat = { ctermbg = colors.dark_backgound },
}

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("utils").set_hl(colorscheme)
        local wk = require("which-key")
        wk.setup()
        require("mappings")()
    end,
}
