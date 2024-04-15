return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = require("plugins.languages.treesitter.opts"),
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
