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
    dependencies = { "rcarriga/nvim-dap-ui" },
    opts = options,
    config = function(_, opts)
        local dap = require("dap")
        for _, lang in pairs(require("languages")) do
            if lang.dap then
                if lang.dap.adapters then
                    for name, config in pairs(lang.dap.adapters) do
                        dap.adapters[name] = config
                    end
                end
                if lang.dap.configurations then
                    for name, config in pairs(lang.dap.configurations) do
                        dap.configurations[name] = config
                    end
                end
            end
        end
    end,
    my_commands = my_commands,
}
