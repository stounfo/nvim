local M = {}

M.mason_to_install = { "typescript-language-server", "prettier" }
M.treesitter_to_install = { "typescript", "tsx" }
M.lsp_configs = {
    tsserver = {},
}
M.formatters = { "prettier" }

return M
