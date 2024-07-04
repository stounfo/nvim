local colors = require("colors")

local my_commands = {
    blame_line = function()
        require("gitsigns").blame_line()
    end,

    preview_hunk = function()
        require("gitsigns").preview_hunk()
    end,

    reset_hunk = function()
        require("gitsigns").reset_hunk()
    end,

    reset_buffer = function()
        require("gitsigns").reset_buffer()
    end,

    next_hunk = function()
        require("gitsigns").next_hunk()
    end,

    prev_hunk = function()
        require("gitsigns").prev_hunk()
    end,
}

local options = function()
    return {
        signs = {
            changedelete = { text = "┃" },
        },
        signs_staged = {
            changedelete = { text = "┃" },
        },
        sign_priority = 50,
        preview_config = {
            border = "rounded",
        },
    }
end

local colorscheme = {
    GitSignsAdd = { ctermfg = colors.green },
    GitSignsChange = { ctermfg = colors.blue },
    GitSignsDelete = { ctermfg = colors.red },

    GitSignsAddPreview = { link = "diffAdded" },
    GitSignsChangePreview = { link = "diffRemoved" },
    GitSignsDeletePreview = { link = "diffDelete" },
}

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("gitsigns").setup(opts)
    end,
    my_commands = my_commands,
}
