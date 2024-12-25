local dependencies = {
    "rafamadriz/friendly-snippets",
}

local colorscheme = {
    BlinkCmpMenu = {
        link = "NormalFloat",
    },
    BlinkCmpMenuBorder = {
        link = "FloatBorder",
    },
    BlinkCmpMenuSelection = {
        link = "CursorLine",
    },
    BlinkCmpDocBorder = {
        link = "BlinkCmpMenuBorder",
    },
    BlinkCmpSignatureHelpBorder = {
        link = "BlinkCmpMenuBorder",
    },
}

local options = function()
    return {
        keymap = {
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },

            -- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            -- ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        },
        sources = {
            default = { "lsp", "snippets", "buffer", "path" },
            cmdline = {},
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    winblend = 10,
                    border = "rounded",
                },
            },
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                },
                enabled = true,
                border = "rounded",
            },
        },
        appearance = {
            nerd_font_variant = "mono",
        },

        signature = {
            enabled = true,
            window = {
                border = "rounded",
            },
        },
    }
end

return {
    "saghen/blink.cmp",
    version = "v0.*",
    event = "InsertEnter",
    dependencies = dependencies,
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("blink.cmp").setup(opts)
    end,
}
