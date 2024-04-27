return {
    "stevearc/aerial.nvim",
    opts = require("plugins.symbols.opts"),
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        require("plugins.shared.nvimwebdevicons"),
    },
    config = function(_, opts)
        require("plugins.symbols.ui")
        require("aerial").setup(opts)
    end,
}
