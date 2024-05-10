-- git hunks, diff, blame etc
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.git.gitsigns.opts"),
    config = function(_, opts)
        require("plugins.git.gitsigns.ui")
        require("gitsigns").setup(opts)
    end,
}
