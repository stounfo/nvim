-- Control flow and declaration keywords: if, for, return, class, and related forms.
do
    local color = require("colors").dark_foreground

    local colorscheme = {
        Conditional = { ctermfg = color }, --  if, then, else, endif, switch, etc.
        Repeat = { ctermfg = color }, --   for, do, while, etc.
        Keyword = { ctermfg = color }, --  any other keyword
        Exception = { ctermfg = color }, --  try, catch, throw
        Label = { ctermfg = color }, --    case, default, etc.
        Structure = { ctermfg = color }, --  struct, union, enum, etc.
        Tag = { ctermfg = color }, -- you can use CTRL-] on this
        Statement = { ctermfg = color }, -- (preferred) any statement
        StorageClass = { ctermfg = color }, -- static, privat, register, volatile, etc.
        Typedef = { ctermfg = color }, --  A typedef
        ["@keyword.function"] = { ctermfg = color }, -- Lambda
    }
    require("utils").set_hl(colorscheme)
end

-- Comments, with special comments called out in the debug color.
do
    local colors = require("colors")

    local colorscheme = {
        Comment = { ctermfg = colors.darkest_foreground }, -- just comments
        SpecialComment = { ctermfg = colors.debug }, -- special things inside a comment
    }
    require("utils").set_hl(colorscheme)
end

-- Types, variables, functions, attributes, modules, and preprocessor directives.
do
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

        ["@module"] = { ctermfg = colors.default_foreground },

        -- preprocessor
        PreProc = { link = "@attribute" }, -- (preferred) generic Preprocessor
        Include = { link = "PreProc" }, --  preprocessor #include
        Define = { link = "PreProc" }, -- preprocessor #define
        Macro = { link = "PreProc" }, -- same as Define
        PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.
    }
    require("utils").set_hl(colorscheme)
end

-- Literal values and constants: strings, numbers, booleans, and special characters.
do
    local color = require("colors").magenta
    local colors = require("colors")

    local colorscheme = {
        String = { ctermfg = color }, -- a string constant: "this is a string"
        Character = { ctermfg = color }, --  a character constant: 'c', '\n'
        Number = { ctermfg = color }, --   a number constant: 234, 0xff
        Float = { link = "Number" }, --    a floating point constant: 2.3e10
        Boolean = { ctermfg = color }, --  a boolean constant: TRUE, false
        SpecialChar = { ctermfg = colors.default_foreground }, -- special character in a constant
        Special = { ctermfg = colors.default_foreground }, -- (preferred) any special symbol

        Constant = { ctermfg = colors.default_foreground }, -- (preferred) any constant
        ["@constant.builtin"] = { ctermfg = color },
    }
    require("utils").set_hl(colorscheme)
end

-- Punctuation and operators, such as brackets and arithmetic symbols.
do
    local color = require("colors").dark_foreground

    local colorscheme = {
        Delimiter = { ctermfg = color }, -- character that needs attention like (, ), {, }, [, ], etc.
        Operator = { ctermfg = color }, -- any operator: +, -, *, /, etc.
    }
    require("utils").set_hl(colorscheme)
end

-- Added, changed, and deleted lines in diff views.
do
    local colors = require("colors")

    local colorscheme = {
        -- diff
        DiffAdd = { ctermbg = colors.dim_green }, -- diff mode: Added line |diff.txt|
        DiffChange = { ctermbg = colors.dim_blue }, -- diff mode: Changed line |diff.txt|
        DiffDelete = { ctermbg = colors.dim_red }, -- diff mode: Deleted line |diff.txt|
        DiffText = { ctermbg = colors.dim_magenta }, -- diff mode: Changed line |diff.txt|
        --
        diffAdded = { ctermbg = colors.dim_green },
        diffRemoved = { ctermbg = colors.dim_red },
        diffChanged = { ctermbg = colors.dim_blue },
    }
    require("utils").set_hl(colorscheme)
end

-- Main editor surfaces: text, cursor line, gutters, status line, separators, and floats.
do
    local colors = require("colors")

    local colorscheme = {
        Normal = {
            ctermfg = colors.default_foreground,
            ctermbg = colors.default_background,
        },
        CursorLine = {
            ctermbg = colors.light_background,
        },
        NormalFloat = {
            ctermfg = colors.default_foreground,
            ctermbg = colors.default_background,
        },
        LineNr = {
            ctermfg = colors.darkest_foreground,
            ctermbg = colors.default_background,
        },
        CursorLineNr = {
            ctermfg = colors.default_foreground,
            ctermbg = colors.default_background,
        },
        SignColumn = { ctermbg = colors.default_background },
        StatusLine = {
            ctermfg = colors.default_background,
            ctermbg = colors.default_background,
        },
        StatusLineNC = {
            ctermfg = colors.default_background,
            ctermbg = colors.default_background,
        },
        WinSeparator = { ctermfg = colors.light_background },

        FloatBorder = {
            ctermfg = colors.darkest_foreground,
            ctermbg = colors.default_background,
        },
        Title = {
            ctermfg = colors.default_foreground,
            ctermbg = colors.default_background,
        },
        FloatTitle = {
            ctermfg = colors.default_foreground,
            ctermbg = colors.default_background,
        },
        ColorColumn = { ctermbg = colors.light_background },
    }
    require("utils").set_hl(colorscheme)
end

-- Search matches and the current search result.
do
    local colors = require("colors")

    local colorscheme = {
        Search = { ctermbg = colors.dim_blue },
        CurSearch = { ctermbg = colors.dim_red },
    }
    require("utils").set_hl(colorscheme)
end

-- Matching bracket under the cursor.
do
    local colors = require("colors")

    local colorscheme = {
        MatchParen = {
            ctermfg = colors.special_foreground,
            ctermbg = colors.special_background,
        },
    }
    require("utils").set_hl(colorscheme)
end

-- Text selected in visual mode.
do
    local colors = require("colors")

    local colorscheme = {
        Visual = { ctermbg = colors.dim_magenta },
    }
    require("utils").set_hl(colorscheme)
end

-- Tab bar text.
do
    local colors = require("colors")

    local colorscheme = {
        TabLine = { ctermfg = colors.dark_foreground },
    }
    require("utils").set_hl(colorscheme)
end

return {}
