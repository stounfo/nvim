local opts = {
  ensure_installed = { "lua", "python", "rust", "html", "json", "vimdoc" },
  highlight = {
    enable = true,
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = opts,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
