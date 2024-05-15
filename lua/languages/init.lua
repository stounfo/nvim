local main = {
    lua = require("languages.lua"),
    python = require("languages.python"),
    typescript = require("languages.typescript"),
    rust = require("languages.rust"),
    php = require("languages.php"),
}
local other = require("languages.other")

return require("utils").merge_tables(main, other)
