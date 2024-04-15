return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        require("plugins.languages.mason"),
    },
    config = function()
        local lspconfig = require("lspconfig")
        for _, opts in pairs(require("plugins.languages.configs")) do
            if opts.lsp_configs then
                for name, config in pairs(opts.lsp_configs) do
                    lspconfig[name].setup(config)
                end
            end
        end
        require("plugins.languages.lsp.ui")
    end,
}
