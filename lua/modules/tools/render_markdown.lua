local colors = require("colors")

local my_commands = {
    toggle_render_markdown = function()
        require("render-markdown").toggle()
    end,
}

local options = function()
    return {
        heading = {
            icons = {},
        },
        code = {
            style = "full",
            position = "right",
            width = "block",
            min_width = 80,
            left_pad = 1,
            language_pad = 1,
        },
        dash = {
            width = 80,
        },
        bullet = {
            enabled = false,
        },
        checkbox = {
            enabled = false,
        },
        pipe_table = {
            style = "normal",
        },
        sign = {
            enabled = false,
        },
    }
end

local colorscheme = {
    RenderMarkdownCode = {
        ctermbg = colors.light_background,
    },

    RenderMarkdownH1Bg = {
        ctermfg = colors.red,
        ctermbg = colors.default_background,
    },
    RenderMarkdownH2Bg = {
        ctermfg = colors.yellow,
        ctermbg = colors.default_background,
    },
    RenderMarkdownH3Bg = {
        ctermfg = colors.magenta,
        ctermbg = colors.default_background,
    },
    RenderMarkdownH4Bg = {
        ctermfg = colors.blue,
        ctermbg = colors.default_background,
    },
    RenderMarkdownH5Bg = {
        ctermfg = colors.cyan,
        ctermbg = colors.default_background,
    },
    RenderMarkdownH6Bg = {
        ctermfg = colors.green,
        ctermbg = colors.default_background,
    },
}

return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
        require("modules.editor.treesitter"),
        require("modules.dependencies.nvim_web_devicons"),
    },
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("render-markdown").setup(opts)
    end,
    my_commands = my_commands,
}
