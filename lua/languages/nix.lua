local M = {}

M.mason_to_install = { "nil", "nixfmt" }
M.treesitter_to_install = { "nix" }
M.lsp_configs = {
    nil_ls = {},
}
M.formatters = { nix = { "nixfmt" } }
return M
