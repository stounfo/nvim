return {
    "RRethy/vim-illuminate",
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
        require("plugins.languages.code_highlights.illuminate.ui")
        require("illuminate").configure({
            providers = {
                "lsp",
            },
        })
    end,
}
