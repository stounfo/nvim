return {
    yaml = {
        treesitter_to_install = { "yaml" },
        formatters = {
            yaml = { "prettier" },
        },
    },

    toml = {
        treesitter_to_install = { "toml" },
        formatters = {
            toml = { "prettier" },
        },
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
        treesitter_to_install = { "markdown" },
    },

    markdown_inline = {
        treesitter_to_install = { "markdown_inline" },
    },

    bash = {
        treesitter_to_install = { "bash" },
    },
}
