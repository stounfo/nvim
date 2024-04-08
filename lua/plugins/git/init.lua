-- git hunks, diff, blame etc
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = require("mappings").gisigns,
  config = function()
    require("gitsigns").setup()
    require("plugins.git.ui")
  end,
}
