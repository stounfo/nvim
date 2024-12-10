local colors = require("colors")

local header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

local my_commands = {
    git_link = function()
        require("snacks").gitbrowse()
    end,
}

local colorscheme = {
    LspReferenceText = { ctermbg = colors.default_background },
    LspReferenceRead = { ctermbg = colors.lightest_background },
    LspReferenceWrite = { ctermbg = colors.lightest_background },
    SnacksIndent = { ctermfg = colors.darkest_foreground, blend = 0 },
    SnacksIndentScope = { ctermfg = colors.darkest_foreground, blend = 0 },
}

local options = function()
    return {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        gitbrowse = { enabled = true },
        dashboard = {
            preset = {
                header = header,
                keys = {
                    {
                        icon = " ",
                        key = "n",
                        desc = "New File",
                        action = ":ene | startinsert",
                    },
                    {
                        icon = "󰒲 ",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 2 },
                { section = "startup" },
            },
        },
        words = { enabled = true },
        indent = {
            indent = {
                char = "│",
            },
            scope = {
                animate = {
                    enabled = false,
                },
            },
        },
    }
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("snacks").setup(opts)
    end,
    my_commands = my_commands,
}
