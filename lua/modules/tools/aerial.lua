local colors = require("colors")

local my_commands = {
    toggle_aerial = "<cmd>AerialToggle left<cr>",
}

local options = function()
    return {
        layout = {
            min_width = 0.25,
            default_direction = "left",
            placement = "edge",
        },
        open_automatic = false,
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        icons = require("icons").symbols,
    }
end

local colorscheme = {
    AerialLine = { link = "CursorLine" },
    AerialNormal = { link = "Normal" },

    AerialBooleanIcon = { ctermfg = colors.default_foreground },
    AerialClassIcon = { link = "AerialBooleanIcon" },
    AerialConstantIcon = { link = "AerialBooleanIcon" },
    AerialConstructorIcon = { link = "AerialBooleanIcon" },
    AerialFieldIcon = { link = "AerialBooleanIcon" },
    AerialFunctionIcon = { link = "AerialBooleanIcon" },
    AerialMethodIcon = { link = "AerialBooleanIcon" },
    AerialNamespaceIcon = { link = "AerialBooleanIcon" },
    AerialNumberIcon = { link = "AerialBooleanIcon" },
    AerialOperatorIcon = { link = "AerialBooleanIcon" },
    AerialTypeParameterIcon = { link = "AerialBooleanIcon" },
    AerialPropertyIcon = { link = "AerialBooleanIcon" },
    AerialStringIcon = { link = "AerialBooleanIcon" },
    AerialVariableIcon = { link = "AerialBooleanIcon" },
    AerialEnumMemberIcon = { link = "AerialBooleanIcon" },
    AerialEnumIcon = { link = "AerialBooleanIcon" },
    AerialFileIcon = { link = "AerialBooleanIcon" },
    AerialModuleIcon = { link = "AerialBooleanIcon" },
    AerialPackageIcon = { link = "AerialBooleanIcon" },
    AerialInterfaceIcon = { link = "AerialBooleanIcon" },
    AerialStructIcon = { link = "AerialBooleanIcon" },
    AerialEventIcon = { link = "AerialBooleanIcon" },
    AerialArrayIcon = { link = "AerialBooleanIcon" },
    AerialObjectIcon = { link = "AerialBooleanIcon" },
    AerialKeyIcon = { link = "AerialBooleanIcon" },
    AerialNullIcon = { link = "AerialBooleanIcon" },
}

return {
    "stevearc/aerial.nvim",
    opts = options,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        require("modules.dependencies.nvim_web_devicons"),
    },
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("aerial").setup(opts)
    end,
    my_commands = my_commands,
}
