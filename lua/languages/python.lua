local M = {}

M.mason_to_install = {
    "basedpyright",
    "ruff",
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
return M
