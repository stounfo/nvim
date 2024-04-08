return {
  require("plugins.other.indentblankline"),
  require("plugins.other.comment"),
  require("plugins.other.illuminate"),
  {
    "stevearc/aerial.nvim",
    keys = require("mappings").aerial,
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 , lazy=false},
}
