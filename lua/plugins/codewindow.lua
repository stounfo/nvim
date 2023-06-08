return {
  "gorbit99/codewindow.nvim",
  keys = require("mappings").codewindow,
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      window_border = "none",
      minimap_width = 10,
      use_lsp = false,
      exclude_filetypes = { "help", "neo-tree", "" },
      auto_enable = true,
      relative = "editor",
      z_index = 1000
    })
  end,
}
