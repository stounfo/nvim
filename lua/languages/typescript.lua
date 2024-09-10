local M = {}

M.mason_to_install = { "typescript-language-server", "prettier", "eslint-lsp" }
M.treesitter_to_install = { "typescript", "tsx" }
M.lsp_configs = {
    ts_ls = {},
    eslint = {},
}
M.formatters = {
    typescriptreact = {
        "prettier",
    },
    typescript = {
        "prettier",
    },
}

return M
