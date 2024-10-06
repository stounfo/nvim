local M = {}

local debugpy_adapter = {
    type = "executable",
    command = os.getenv("HOME")
        .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
}

M.mason_to_install = {
    "basedpyright",
    "ruff",
    "debugpy",
}
M.treesitter_to_install = { "python" }
M.lsp_configs = {
    basedpyright = {
        autostart = true,
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "basic",
                },
            },
        },
    },
}
M.formatters = { python = { "ruff_format" } }
M.dap = {
    adapters = {
        python = debugpy_adapter,
        debugpy = debugpy_adapter,
    },
    configurations = {
        python = {
            {
                type = "python",
                name = "Python Debugger: Current File",
                request = "launch",
                program = "${file}",
            },
            {
                type = "python",
                name = "Python Run: Current File",
                request = "launch",
                program = "${file}",
                noDebug = true,
            },
        },
    },
}

return M
