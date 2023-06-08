return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  keys = require("mappings").lspconfig,
  dependencies = {
    require("plugins.mason"),
  },
  config = function()
    -- turn off text
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup({})
    lspconfig.rust_analyzer.setup({})
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
