local colors = require("colors")

local options = function()
    return {
        notify = {
            enabled = false,
        },
        messages = {
            enabled = true,
        },
        popupmenu = {
            enabled = true,
            backend = "cmp",
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
                position = {
                    row = "15%",
                    col = "50%",
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
}

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = options,
    dependencies = {
        require("modules.dependencies.nvim_nio"),
    },
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("noice").setup(opts)
    end,
}
