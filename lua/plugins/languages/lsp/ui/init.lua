-- Hover border style
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = false,
  update_in_insert = false,
  severity_sort = true,
})

require("utils").set_hl(require("plugins.languages.lsp.ui.colorscheme"))
