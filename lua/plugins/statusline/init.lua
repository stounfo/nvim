-- winbar and statusline
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    require("plugins.shared.nvimwebdevicons"),
    require("plugins.statusline.dependencies.nvimnavic"),
  },
  opts = require("plugins.statusline.opts"),
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
