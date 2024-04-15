return {
    "stevearc/aerial.nvim",
    opts = require("plugins.code_navigation.opts"),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        require("plugins.shared.nvimwebdevicons"),
    },
    config = function(_, opts)
        require("plugins.code_navigation.ui")
        require("aerial").setup(opts)
    end,
}
