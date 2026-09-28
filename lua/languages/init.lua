local main = {
    lua = require("languages.lua"),
    python = require("languages.python"),
    nix = require("languages.nix"),
    typescript = require("languages.typescript"),
    rust = require("languages.rust"),
    go = require("languages.go"),
}
local other = require("languages.other")

return vim.tbl_deep_extend("error", main, other)
