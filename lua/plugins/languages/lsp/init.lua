return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    require("plugins.languages.mason"),
  },
  keys = require("mappings").lspconfig,
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

    lspconfig.lua_ls.setup(require("plugins.languages.configs.lua").lsp_config)
    lspconfig.pyright.setup(
      require("plugins.languages.configs.python").lsp_config
    )
    lspconfig.rust_analyzer.setup(
      require("plugins.languages.configs.rust").lsp_config
    )
    lspconfig.tsserver.setup(
      require("plugins.languages.configs.typescript").lsp_config
    )
  end,
}
