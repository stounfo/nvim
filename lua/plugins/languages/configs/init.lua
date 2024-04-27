local main = {
    lua = require("plugins.languages.configs.lua"),
    python = require("plugins.languages.configs.python"),
    typescript = require("plugins.languages.configs.typescript"),
    rust = require("plugins.languages.configs.rust"),
    php = require("plugins.languages.configs.php"),
}
local other = require("plugins.languages.configs.other")

return require("utils").merge_tables(main, other)
