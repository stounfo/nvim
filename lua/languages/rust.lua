local M = {}

M.mason_to_install = { "rust-analyzer", "rustfmt" }
M.treesitter_to_install = { "rust" }
M.lsp_configs = {
    rust_analyzer = {},
}
M.formatters = { rust = { "rustfmt" } }

return M
