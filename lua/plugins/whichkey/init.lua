return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("plugins.whichkey.ui")
        local wk = require("which-key")
        wk.setup()
        require("mappings")()
    end,
}
