return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = { "BufReadPre", "BufNewFile" },
  build = ":Copilot auth",
  opts = require("plugins.autocompletion.copilot.opts"),
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
