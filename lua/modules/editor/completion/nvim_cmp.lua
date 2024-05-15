local colors = require("colors")

local options = function()
    local cmp = require("cmp")
    local window_opts = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:NvimcmpCursorLine",
        border = "rounded",
    }

    return {
        completion = {
            completeopt = "menu,menuone,noinsert",
        },

        window = {
            completion = window_opts,
            documentation = window_opts,
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            ["<tab>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
    }
end

local dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
            "L3MON4D3/LuaSnip",
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
        },
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "kristijanhusak/vim-dadbod-completion" },
}

local colorscheme = {
    NvimcmpCursorLine = { link = "CursorLine" },
}

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = dependencies,
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
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
