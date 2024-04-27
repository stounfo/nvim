return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        require("plugins.autocompletion.nvimcmp.dependencies.cmpnvimlsp"),
        require("plugins.autocompletion.nvimcmp.dependencies.cmpluasnip"),
        require("plugins.autocompletion.nvimcmp.dependencies.cmpbuffer"),
        require("plugins.autocompletion.nvimcmp.dependencies.cmppath"),
        require(
            "plugins.autocompletion.nvimcmp.dependencies.vimdadbodcompletion"
        ),
    },
    opts = require("plugins.autocompletion.nvimcmp.opts"),
    config = function(_, opts)
        require("plugins.autocompletion.nvimcmp.ui")
        require("cmp").setup(opts)

        -- stupid hack to get vim-dadbod-completion to work, I don't
        -- understand how this works, but it does
        local sources =
            table.insert(opts.sources, { name = "vim-dadbod-completion" })
        for _, sql_file_type in ipairs({ "sql", "mysql", "pgsql", "sqlite" }) do
            require("cmp").setup.filetype(sql_file_type, {
                sources = sources,
            })
        end
    end,
}
