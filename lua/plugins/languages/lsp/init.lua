return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    require("plugins.languages.mason"),
  },
  config = function()

    local lspconfig = require("lspconfig")

    -- lua
    for name, opts in pairs(require("plugins.languages.configs.lua").lsp_configs) do
      lspconfig[name].setup(opts)
    end

    -- python
    for name, opts in pairs(require("plugins.languages.configs.python").lsp_configs) do
      lspconfig[name].setup(opts)
    end

    -- rust
    for name, opts in pairs(require("plugins.languages.configs.rust").lsp_configs) do
      lspconfig[name].setup(opts)
    end

    -- typescript
    for name, opts in pairs(require("plugins.languages.configs.typescript").lsp_configs) do
      lspconfig[name].setup(opts)
    end
    require("plugins.languages.lsp.ui")

  end,
}
