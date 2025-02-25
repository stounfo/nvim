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

            ["<C-p>"] = { "select_prev", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },

            -- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            -- ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        },
        sources = {
            default = { "lsp", "snippets", "buffer", "path", "markdown" },
            cmdline = {},
            providers = {
                markdown = {
                    name = "RenderMarkdown",
                    module = "render-markdown.integ.blink",
                    fallbacks = { "lsp" },
                },
            },
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
            use_nvim_cmp_as_default = false,
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
    version = "0.11.0",
    event = "InsertEnter",
    dependencies = dependencies,
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("blink.cmp").setup(opts)
    end,
}
