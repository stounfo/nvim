local colors = require("colors")

local my_commands = {
    git_link = function()
        require("snacks").gitbrowse()
    end,
}

local colorscheme = {
    LspReferenceText = { ctermbg = colors.default_background },
    LspReferenceRead = { ctermbg = colors.lightest_background },
    LspReferenceWrite = { ctermbg = colors.lightest_background },
}

local options = function()
    return {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        gitbrowse = { enabled = true },
        dashboard = { enabled = true },
        words = { enabled = true },
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
