local opts = {
  defaults = {
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },

    mappings = {
      i = {
        ["<C-s>"] = "select_vertical",
      },
      n = {
        ["<C-s>"] = "select_vertical",
      },
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = require("mappings").telescope,
  opts = opts,
  dependencies = { require("plugins.plenary") },
  config = true,
}
