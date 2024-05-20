local my_commands = {
    run = function()
        require("dap.ext.vscode").load_launchjs(
            ".dev/launch.json",
            { debugpy = { "python" } }
        )
        require("dap").continue()
    end,

    continue = function()
        require("dap").continue()
    end,

    toggle_breakpoint = function()
        require("dap").toggle_breakpoint()
    end,

    step_over = function()
        require("dap").step_over()
    end,

    step_into = function()
        require("dap").step_into()
    end,

    run_to_cursor = function()
        require("dap").run_to_cursor()
    end,

    terminate = function()
        require("dap").terminate()
    end,
}

local options = {}

return {
    "mfussenegger/nvim-dap",
    opts = options,
    config = function(_, opts)
        local dap = require("dap")

        local debugpy = {
            type = "executable",
            command = os.getenv("HOME")
                .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
            args = { "-m", "debugpy.adapter" },
        }

        dap.adapters.debugpy = debugpy
        dap.adapters.python = debugpy
    end,
    my_commands = my_commands,
}
