return {
    require("plugins.other.indentblankline"),
    require("plugins.other.comment"),
    require("plugins.other.illuminate"),
    require("plugins.other.whichkey"),
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
    {
        "folke/zen-mode.nvim",
        lazy = true,
    },
}
