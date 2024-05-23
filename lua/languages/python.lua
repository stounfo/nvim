local M = {}

M.mason_to_install = {
    "pyright",
    "ruff",
    "debugpy",
    "ruff-lsp",
}
M.treesitter_to_install = { "python" }
M.lsp_configs = {
    pyright = {
        autostart = false,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "off",
                },
            },
        },
    },
    mylsp = {
        -- autostart = false,
    },
    ruff_lsp = {
        autostart = false,
        init_options = {
            settings = {
                args = {
                    "--ignore",
                    "I001",
                },
            },
        },
    },
}
M.formatters = { python = { "ruff_format" } }

return M
