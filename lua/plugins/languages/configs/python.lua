local M = {}

M.mason_to_install = { "pyright", "ruff" }
M.treesitter_to_install = { "python" }
M.lsp_configs = {
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "off",
                },
            },
        },
    },
    ruff_lsp = {},
}
M.formatters = { "ruff_format" }

return M
