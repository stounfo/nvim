local M = {}

M.mason_to_install = { "lua-language-server", "stylua" }
M.treesitter_to_install = { "lua" }
M.lsp_configs = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
}
M.formatters = { lua = { "stylua" } }

return M
