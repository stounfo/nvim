local colors = require("colors")

local my_commands = {
    toggle_dapui = function()
        require("dapui").toggle()
    end,
    show_repl = function()
        require("dapui").float_element(
            "repl",
            { width = 90, height = 50, position = "center" }
        )
    end,
    hover = function()
        require("dapui").eval()
    end,
}

local options = function()
    local node_state = require("icons").node_state
    return {
        floating = {
            border = "rounded",
        },
        icons = {
            collapsed = node_state.closed,
            current_frame = node_state.open,
            expanded = node_state.open,
        },
        layouts = {
            {
                elements = {
                    {
                        id = "breakpoints",
                        size = 0.25,
                    },
                    {
                        id = "stacks",
                        size = 0.25,
                    },
                    {
                        id = "watches",
                        size = 0.25,
                    },
                    {
                        id = "scopes",
                        size = 0.25,
                    },
                },
                position = "left",
                size = 40,
            },
        },
    }
end

local colorscheme = {
    DapUIFloatBorder = { link = "FloatBorder" },
    DapUIDecoration = { ctermfg = colors.special_foreground },
    DapUIScope = { ctermfg = colors.special_foreground },
}

return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        require("modules.tools.dap.dap"),
        require("modules.dependencies.nvim_nio"),
    },
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        local dapui, dap = require("dapui"), require("dap")
        dapui.setup(opts)

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end,
    my_commands = my_commands,
}
