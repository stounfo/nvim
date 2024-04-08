return {
  "RRethy/vim-illuminate",
  event = { "CursorMoved", "CursorMovedI" },
  config = function()
    require("plugins.other.illuminate.ui")
    require("illuminate").configure({
      providers = {
        "lsp",
      },
    })
  end,
}
