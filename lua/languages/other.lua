return {
    yaml = {
        treesitter_to_install = { "yaml" },
        formatters = {
            yaml = { "prettier" },
        },
    },

    toml = {
        treesitter_to_install = { "toml" },
    },

    json = {
        treesitter_to_install = { "json" },
        formatters = {
            json = { "prettier" },
        },
    },

    html = {
        treesitter_to_install = { "html" },
        formatters = {
            html = { "prettier" },
        },
    },

    sql = {
        mason_to_install = { "sqlfmt" },
        treesitter_to_install = { "sql" },
        formatters = { sql = { "sqlfmt" } },
    },

    vimdoc = {
        treesitter_to_install = { "vimdoc" },
    },

    markdown = {
        mason_to_install = { "marksman", "prettier" },
        treesitter_to_install = { "markdown" },
        lsp_configs = {
            marksman = {},
        },
        formatters = {
            markdown = { "prettier" },
        },
    },

    markdown_inline = {
        treesitter_to_install = { "markdown_inline" },
    },

    bash = {
        treesitter_to_install = { "bash" },
    },

    typos = {
        mason_to_install = { "typos-lsp" },
        lsp_configs = {
            typos_lsp = {
                init_options = {
                    diagnosticSeverity = "Info",
                },
            },
        },
    },
    regex = {
        treesitter_to_install = { "regex" },
    },
}
