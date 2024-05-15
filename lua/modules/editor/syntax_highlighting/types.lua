local colors = require("colors")

local colorscheme = {
    Type = { ctermfg = colors.white }, -- (preferred) int, long, char, etc.

    Identifier = { ctermfg = colors.white }, -- (preferred) any variable name
    ["@variable.builtin"] = { ctermfg = colors.white },
    ["@variable.parameter"] = { ctermfg = colors.white },

    Function = { ctermfg = colors.white }, -- function name (also: methods for classes)
    ["@function.builtin"] = { ctermfg = colors.white },
    ["@function.call"] = { ctermfg = colors.white },
    ["@function.method.call"] = { ctermfg = colors.white },
    ["@constructor"] = { ctermfg = colors.white },

    ["@attribute"] = { ctermfg = colors.white },
    ["@attribute.builtin"] = { link = "@attribute" },
    ["@property"] = { link = "@attribute" },

    -- preprocessor
    PreProc = { link = "@attribute" }, -- (preferred) generic Preprocessor
    Include = { link = "PreProc" }, --  preprocessor #include
    Define = { link = "PreProc" }, -- preprocessor #define
    Macro = { link = "PreProc" }, -- same as Define
    PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.
}
require("utils").set_hl(colorscheme)

return {}
