return {
  "RRethy/vim-illuminate",
  event = { "CursorMoved", "CursorMovedI" },
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
      },
    })
  end,
}
