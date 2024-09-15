local colors = require("colors")

local colorscheme = {
    Type = { ctermfg = colors.default_foreground }, -- (preferred) int, long, char, etc.

    Identifier = { ctermfg = colors.default_foreground }, -- (preferred) any variable name
    ["@variable.builtin"] = { ctermfg = colors.default_foreground },
    ["@variable.parameter"] = { ctermfg = colors.default_foreground },

    Function = { ctermfg = colors.default_foreground }, -- function name (also: methods for classes)
    ["@function.builtin"] = { ctermfg = colors.default_foreground },
    ["@function.call"] = { ctermfg = colors.default_foreground },
    ["@function.method.call"] = { ctermfg = colors.default_foreground },
    ["@constructor"] = { ctermfg = colors.default_foreground },

    ["@attribute"] = { ctermfg = colors.default_foreground },
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
