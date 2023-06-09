return {
  "jose-elias-alvarez/null-ls.nvim",
  keys = require("mappings").nullls,
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local sources = {
      formatting.black,
      formatting.rustfmt,
      formatting.prettier,
      formatting.stylua,
    }

    null_ls.setup({
      sources = sources,
    })
  end,
}
