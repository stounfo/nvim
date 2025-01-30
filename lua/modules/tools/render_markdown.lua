local colors = require("colors")

local my_commands = {
    toggle_render_markdown = function()
        require("render-markdown").toggle()
    end,
}

local options = function()
    return {
        heading = {
            enabled = false,
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
        link = {
            hyperlink = "",
            wiki = { icon = "", highlight = "RenderMarkdownLink" },
        },
    }
end

local colorscheme = {
    RenderMarkdownCode = {
        ctermbg = colors.light_background,
    },

    ["@markup.link.label.markdown_inline"] = {
        ctermfg = colors.blue,
        cterm = { underline = true },
    },

    ["@markup.heading.1.markdown"] = {
        ctermfg = colors.red,
        bold = true,
    },
    ["@markup.heading.2.markdown"] = {
        ctermfg = colors.yellow,
        bold = true,
    },
    ["@markup.heading.3.markdown"] = {
        ctermfg = colors.magenta,
        bold = true,
    },
    ["@markup.heading.4.markdown"] = {
        ctermfg = colors.blue,
        bold = true,
    },
    ["@markup.heading.5.markdown"] = {
        ctermfg = colors.cyan,
        bold = true,
    },
    ["@markup.heading.6.markdown"] = {
        ctermfg = colors.green,
        bold = true,
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
