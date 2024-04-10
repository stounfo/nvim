return {
  "linrongbin16/lsp-progress.nvim",
  opts = require("plugins.statusline.dependencies.lspprogress.opts"),
  config = function(_, opts)
    require("lsp-progress").setup(opts)
    require("plugins.statusline.dependencies.lspprogress.autocmds")
  end,
}
