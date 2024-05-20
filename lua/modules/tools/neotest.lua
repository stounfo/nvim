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
    return {
        adapters = {
            require("neotest-python"),
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
