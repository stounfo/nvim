-- winbar and statusline
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    require("plugins.shared.nvimwebdevicons"),
    require("plugins.code_navigation"),
    require("plugins.statusline.dependencies.lspprogress"),
  },
  opts = require("plugins.statusline.opts"),
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
