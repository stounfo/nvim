return function()
    return {
        layout = {
            min_width = 0.25,
            default_direction = "left",
            placement = "edge",
        },
        open_automatic = false,
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        icons = require("settings").icons,
    }
end
