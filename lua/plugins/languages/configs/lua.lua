local M = {}

M.mason_to_install = { "lua-language-server", "stylua" }
M.treesitter_to_install = { "lua" }
M.lsp_config = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
M.formatters = { "stylua" }

return M
