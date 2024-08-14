local M = {}

M.mason_to_install = { "intelephense", "php_cs_fixer" }
M.treesitter_to_install = { "php" }
M.lsp_configs = {
    intelephense = {},
}
M.formatters = { php = { "php_cs_fixer" } }

return M
