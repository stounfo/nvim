
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    require("plugins.autocompletion.nvimcmp.dependencies.cmpnvimlsp"),
    require("plugins.autocompletion.nvimcmp.dependencies.cmpluasnip"),
    require("plugins.autocompletion.nvimcmp.dependencies.cmpbuffer"),
    require("plugins.autocompletion.nvimcmp.dependencies.cmppath"),
  },
  opts = require("plugins.autocompletion.nvimcmp.opts"),
  config = function(_, opts)
    require("plugins.autocompletion.nvimcmp.ui")
    require("cmp").setup(opts)
  end,
}
