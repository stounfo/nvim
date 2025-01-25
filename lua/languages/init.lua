local main = {
    lua = require("languages.lua"),
    python = require("languages.python"),
    typescript = require("languages.typescript"),
    rust = require("languages.rust"),
}
local other = require("languages.other")

return vim.tbl_deep_extend("error", main, other)
