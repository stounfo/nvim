return {
    lua = require("plugins.languages.configs.lua"),
    python = require("plugins.languages.configs.python"),
    typescript = require("plugins.languages.configs.typescript"),
    rust = require("plugins.languages.configs.rust"),
    php = require("plugins.languages.configs.php"),

    -- others
    yaml = {
        formatters = {
            yaml = { "prettier" },
        },
    },

    json = {
        formatters = {
            json = { "prettier" },
        },
    },

    html = {
        formatters = {
            html = { "prettier" },
        },
    },
}
