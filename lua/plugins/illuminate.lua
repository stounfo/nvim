return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
      },
    })
  end,
}
