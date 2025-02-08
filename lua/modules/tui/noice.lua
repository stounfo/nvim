local colors = require("colors")

local options = function()
    return {
        notify = {
            enabled = true,
        },
        messages = {
            enabled = true,
        },
        popupmenu = {
            enabled = true,
        },
        lsp = {
            progress = {
                enabled = false,
            },
            hover = {
                enabled = true,
            },
            signature = {
                enabled = false,
            },
            message = {
                enabled = false,
            },
        },
        smart_move = {
            enabled = false,
        },
        views = {
            cmdline_popup = {
                size = {
                    width = "64",
                },
                position = {
                    row = "7",
                    col = "50%",
                },
            },
            popupmenu = {
                size = {
                    width = "66",
                    height = "auto",
                },
                position = {
                    row = "10",
                    col = "50%",
                },
                border = {
                    style = "rounded",
                },
            },
            hover = {
                border = {
                    style = "rounded",
                },
                anchor = "SW",
                position = { row = 1, col = 2 },
            },
        },
    }
end

local colorscheme = {
    NoiceCmdlineIcon = {
        ctermfg = colors.dark_foreground,
    },
    NoiceCmdlineIconSearch = {
        ctermfg = colors.dark_foreground,
    },
    NoiceCmdlinePopupBorder = {
        link = "FloatBorder",
    },
    NoiceCmdlinePopupBorderSearch = {
        link = "FloatBorder",
    },
    NoiceCmdlinePopupTitle = {
        link = "FloatTitle",
    },
    NoiceVirtualText = {
        ctermfg = colors.dark_foreground,
    },
    NoicePopupmenu = {
        link = "NormalFloat",
    },
    NoicePopupmenuBorder = {
        link = "FloatBorder",
    },
    NoicePopupmenuSelected = {
        link = "CursorLine",
    },
    NoicePopupmenuMatch = {
        link = "Search",
    },
}

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = options,
    dependencies = {
        require("modules.dependencies.nui"),
    },
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("noice").setup(opts)
    end,
}
