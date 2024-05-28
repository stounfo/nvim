local my_commands = {
    test_nearest = function()
        require("neotest").run.run()
    end,
    test_nearest_debug = function()
        require("neotest").run.run({ strategy = "dap" })
    end,
    test_file = function()
        require("neotest").run.run(vim.fn.expand("%"))
    end,
    toggle_ui = function()
        require("neotest").summary.toggle()
        require("neotest").output_panel.toggle()
    end,
}

local options = function()
    local icons = require("icons")
    return {
        adapters = {
            require("neotest-python"),
        },
        icons = {
            child_indent = " ",
            child_prefix = " ",
            collapsed = icons.node_state.closed,
            expanded = icons.node_state.open,
            final_child_indent = " ",
            final_child_prefix = " ",
            non_collapsible = " ",
            running_animated = icons.loader,
        },
    }
end

return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-python",
        require("modules.dependencies.nvim_nio"),
        require("modules.dependencies.plenary"),
        require("modules.editor.treesitter"),
        require("modules.tools.dap.dap"),
        -- "antoinemadec/FixCursorHold.nvim",
    },
    opts = options,
    config = function(_, opts)
        require("neotest").setup(opts)
    end,
    my_commands = my_commands,
}
