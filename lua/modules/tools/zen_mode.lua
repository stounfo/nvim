local colors = require("colors")

local my_commands = {
    toggle_zen_mode = function()
        require("zen-mode").toggle()
    end,
}

local options = function()
    return {
        border = {
            "",
            "",
            "",
            "▏",
            "",
            "",
            "",
            "▏",
        },
        window = {
            width = 90,
        },
    }
end

local colorscheme = {
    ZenBorder = { link = "WinSeparator" },
}

return {
    "folke/zen-mode.nvim",
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("zen-mode").setup(opts)
    end,
    my_commands = my_commands,
}
