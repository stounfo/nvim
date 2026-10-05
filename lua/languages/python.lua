local M = {}

M.mason_to_install = {
    "ty",
    "ruff",
}
M.treesitter_to_install = { "python" }
M.lsp_configs = {
    ty = {
        autostart = true,
    },
}
M.formatters = { python = { "ruff_format" } }
return M
