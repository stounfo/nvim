local M = {}

M.mason_to_install = { "rust-analyzer", "rustfmt", "codelldb" }
M.treesitter_to_install = { "rust" }
M.lsp_configs = {
    rust_analyzer = {},
}
M.formatters = { rust = { "rustfmt" } }
M.dap = {
    adapters = {
        rust = {
            type = "server",
            port = "${port}",
            executable = {
                command = os.getenv("HOME")
                    .. "/.local/share/nvim/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        },
    },
}

return M
