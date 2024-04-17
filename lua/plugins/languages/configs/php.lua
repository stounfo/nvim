local M = {}

M.mason_to_install = { "intelephense", "phpcbf" }
M.treesitter_to_install = { "php" }
M.lsp_configs = {
    intelephense = {},
}
M.formatters = { "phpcbf" }

return M
