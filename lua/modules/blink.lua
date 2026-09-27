local dependencies = {
    "saghen/blink.lib",
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
    BlinkCmpKind = {
        link = "NormalFloat",
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
            providers = {
                markdown = {
                    name = "RenderMarkdown",
                    module = "render-markdown.integ.blink",
                    fallbacks = { "lsp" },
                },
            },
        },
        -- Blink v2 moved mode-specific sources from `sources` to `cmdline`.
        -- Keep command-line completion disabled, as the old empty source list did.
        cmdline = {
            enabled = false,
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
                    components = {
                        label = {
                            highlight = "BlinkCmpLabel",
                        },
                        kind = {
                            highlight = "BlinkCmpKind",
                        },
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
    event = "InsertEnter",
    dependencies = dependencies,
    build = function()
        require("blink.cmp").build():pwait()
    end,
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("blink.cmp").setup(opts)
    end,
}
