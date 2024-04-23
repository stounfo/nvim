local colors = require("ui.colorscheme.colors")

return {
    -- comments
    Comment = { ctermfg = colors.muted_fg }, -- just comments
    SpecialComment = { ctermfg = colors.yellow }, -- special things inside a comment

    -- types values
    Type = { ctermfg = colors.yellow }, -- (preferred) int, long, char, etc.
    Constant = { ctermfg = colors.yellow }, -- (preferred) any constant
    String = { ctermfg = colors.green }, -- a string constant: "this is a string"
    Character = { ctermfg = colors.green }, --  a character constant: 'c', '\n'
    Number = { ctermfg = colors.bright_yellow }, --   a number constant: 234, 0xff
    Float = { link = "Number" }, --    a floating point constant: 2.3e10
    Boolean = { ctermfg = colors.magenta }, --  a boolean constant: TRUE, false
    Identifier = { ctermfg = colors.bright_white }, -- (preferred) any variable name
    Function = { ctermfg = colors.blue }, -- function name (also: methods for classes)
    SpecialChar = { ctermfg = colors.bright_yellow }, -- special character in a constant

    -- keys
    Conditional = { ctermfg = colors.magenta }, --  if, then, else, endif, switch, etc.
    Repeat = { ctermfg = colors.magenta }, --   for, do, while, etc.
    Keyword = { ctermfg = colors.magenta }, --  any other keyword
    Exception = { ctermfg = colors.magenta }, --  try, catch, throw
    Label = { ctermfg = colors.magenta }, --    case, default, etc.
    Structure = { ctermfg = colors.magenta }, --  struct, union, enum, etc.
    Special = { ctermfg = colors.bright_white }, -- (preferred) any special symbol
    Tag = { ctermfg = colors.blue }, -- you can use CTRL-] on this
    Statement = { ctermfg = colors.magenta }, -- (preferred) any statement
    StorageClass = { ctermfg = colors.magenta }, -- static, privat, register, volatile, etc.
    Typedef = { ctermfg = colors.yellow }, --  A typedef

    -- operators
    Operator = { ctermfg = colors.bright_white }, -- "sizeof", "+", "*", etc.

    -- preprocessor
    PreProc = { ctermfg = colors.cyan }, -- (preferred) generic Preprocessor
    Include = { link = "PreProc" }, --  preprocessor #include
    Define = { link = "PreProc" }, -- preprocessor #define
    Macro = { link = "PreProc" }, -- same as Define
    PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.

    -- -- rainbow
    rainbow1 = { ctermfg = colors.red },
    rainbow2 = { ctermfg = colors.yellow },
    rainbow3 = { ctermfg = colors.cyan },
    rainbow4 = { ctermfg = colors.green },
    rainbow5 = { ctermfg = colors.magenta },
    rainbow6 = { ctermfg = colors.blue },

    -- Underlined = { ctermbg = colors.green }, -- (preferred) text that stands out, HTML links
    -- Bold = { ctermbg = colors.green },
    -- Italic = { ctermbg = colors.green },

    -- diff
    DiffAdd = { ctermfg = colors.green }, -- diff mode: Added line |diff.txt|
    DiffChange = { ctermfg = colors.blue }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { ctermfg = colors.red }, -- diff mode: Deleted line |diff.txt|
    DiffText = { ctermfg = colors.debug }, -- diff mode: Changed line |diff.txt|
    --
    diffAdded = { ctermfg = colors.green },
    diffRemoved = { ctermfg = colors.red },
    diffChanged = { ctermfg = colors.blue },
    -- diffOldFile = { ctermbg = colors.debug },
    -- diffNewFile = { ctermbg = colors.debug },
    -- diffFile = { ctermbg = colors.debug },
    -- diffLine = { ctermbg = colors.debug },
    -- diffIndexLine = { ctermbg = colors.debug },

    -- Unknown
    Debug = { ctermbg = colors.debug }, -- debugging statements

    Error = { ctermbg = colors.debug, cterm = { bold = true } }, -- (preferred) any erroneous construct
    Todo = { ctermbg = colors.debug, cterm = { bold = true } }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    healthError = { ctermbg = colors.red },
    healthSuccess = { ctermbg = colors.teal },
    healthWarning = { ctermbg = colors.yellow },

    -- treesitter
    ["@constant.builtin"] = { ctermfg = colors.magenta },
    ["@variable.builtin"] = { ctermfg = colors.bright_red },

    ["@function.builtin"] = { ctermfg = colors.blue },
    ["@function.call"] = { ctermfg = colors.blue },
    ["@function.method.call"] = { ctermfg = colors.blue },
    ["@constructor"] = { ctermfg = colors.blue },

    -- TODO
    -- qfLineNr = { fg = C.yellow },
    -- qfFileName = { fg = C.blue },
    -- htmlH1 = { fg = C.pink, style = { "bold" } },
    -- htmlH2 = { fg = C.blue, style = { "bold" } },
    -- -- mkdHeading = { fg = C.peach, style = { "bold" } },
    -- -- mkdCode = { bg = C.terminal_black, fg = C.text },
    -- mkdCodeDelimiter = { bg = C.base, fg = C.text },
    -- mkdCodeStart = { fg = C.flamingo, style = { "bold" } },
    -- mkdCodeEnd = { fg = C.flamingo, style = { "bold" } },
    -- -- mkdLink = { fg = C.blue, style = { "underline" } },
    --
    -- -- debugging
    -- debugPC = { bg = O.transparent_background and C.none or C.crust }, -- used for highlighting the current line in terminal-debug
    -- debugBreakpoint = { bg = C.base, fg = C.overlay0 },                -- used for breakpoint colors in terminal-debug
    -- -- illuminate
    -- illuminatedWord = { bg = C.surface1 },
    -- illuminatedCurWord = { bg = C.surface1 },
    --
    -- -- glyphs
    -- GlyphPalette1 = { fg = C.red },
    -- GlyphPalette2 = { fg = C.teal },
    -- GlyphPalette3 = { fg = C.yellow },
    -- GlyphPalette4 = { fg = C.blue },
    -- GlyphPalette6 = { fg = C.teal },
    -- GlyphPalette7 = { fg = C.text },
    -- GlyphPalette9 = { fg = C.red },
}
