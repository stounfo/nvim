return function()
    return {
        formatters_by_ft = {
            lua = require("plugins.languages.configs.lua").formatters,
            python = require("plugins.languages.configs.python").formatters,
            rust = require("plugins.languages.configs.rust").formatters,
            typescript = require("plugins.languages.configs.typescript").formatters,
        },
    }
end
