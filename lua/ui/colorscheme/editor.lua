local colors = require("ui.colorscheme.colors")

-- return {
-- ColorColumn = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Conceal = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Cursor = { ctermbg = colors.debug, ctermfg = colors.debug },
-- lCursor = { ctermbg = colors.debug, ctermfg = colors.debug },
-- CursorIM = { ctermbg = colors.debug, ctermfg = colors.debug },
-- CursorColumn = { ctermbg = colors.debug, ctermfg = colors.debug },
-- CursorLine = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Directory = { ctermbg = colors.debug, ctermfg = colors.debug },
-- EndOfBuffer = { ctermbg = colors.debug, ctermfg = colors.debug },
-- ErrorMsg = { ctermbg = colors.debug, ctermfg = colors.debug },
-- VertSplit = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Folded = { ctermbg = colors.debug, ctermfg = colors.debug },
-- FoldColumn = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SignColumn = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SignColumnSB = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Substitute = { ctermbg = colors.debug, ctermfg = colors.debug },
-- LineNr = { ctermbg = colors.debug, ctermfg = colors.debug },
-- CursorLineNr = { ctermbg = colors.debug, ctermfg = colors.debug },
-- ModeMsg = { ctermbg = colors.debug, ctermfg = colors.debug },
-- MoreMsg = { ctermbg = colors.debug, ctermfg = colors.debug },
-- NonText = { ctermbg = colors.debug, ctermfg = colors.debug },
-- NormalNC = { ctermbg = colors.debug, ctermfg = colors.debug },
-- NormalSB = { ctermbg = colors.debug, ctermfg = colors.debug },
-- FloatBorder = { ctermbg = colors.debug, ctermfg = colors.debug },
-- FloatTitle = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Pmenu = { ctermbg = colors.debug, ctermfg = colors.debug },
-- PmenuSel = { ctermbg = colors.debug, ctermfg = colors.debug },
-- PmenuSbar = { ctermbg = colors.debug, ctermfg = colors.debug },
-- PmenuThumb = { ctermbg = colors.debug, ctermfg = colors.debug },
-- QuickFixLine = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Search = { ctermbg = colors.debug, ctermfg = colors.debug },
-- IncSearch = { ctermbg = colors.debug, ctermfg = colors.debug },
-- CurSearch = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SpecialKey = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SpellBad = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SpellCap = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SpellLocal = { ctermbg = colors.debug, ctermfg = colors.debug },
-- SpellRare = { ctermbg = colors.debug, ctermfg = colors.debug },
-- StatusLine = { ctermbg = colors.debug, ctermfg = colors.debug },
-- StatusLineNC = { ctermbg = colors.debug, ctermfg = colors.debug },
-- TabLine = { ctermbg = colors.debug, ctermfg = colors.debug },
-- TabLineFill = { ctermbg = colors.debug, ctermfg = colors.debug },
-- TabLineSel = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Title = { ctermbg = colors.debug, ctermfg = colors.debug },
-- WarningMsg = { ctermbg = colors.debug, ctermfg = colors.debug },
-- Whitespace = { ctermbg = colors.debug, ctermfg = colors.debug },
-- WildMenu = { ctermbg = colors.debug, ctermfg = colors.debug },
-- WinBar = { ctermbg = colors.debug, ctermfg = colors.debug },
-- WinBarNC = { ctermbg = colors.debug, ctermfg = colors.debug },
-- WinSeparator = { ctermbg = colors.debug, ctermfg = colors.debug },
-- }

return {
  Visual = { ctermbg = colors.highlighted_bg },
  VisualNOS = { ctermbg = colors.highlighted_bg },
  NormalFloat = { ctermbg = colors.muted_bg },
  LineNr = { ctermbg = colors.normal_bg, ctermfg = colors.muted_fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  CursorLineNr = { ctermbg = colors.normal_bg, ctermfg = colors.normal_fg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
  CursorLine = { ctermbg = colors.muted_bg }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if forecrust (ctermfg OR guifg) is not set.
  SignColumn = { ctermbg = colors.normal_bg, ctermfg = colors.normal_fg }, -- column where |signs| are displayed
  SignColumnSB = { ctermbg = colors.debug, ctermfg = colors.normal_fg }, -- column where |signs| are displayed
  Question = { ctermbg = colors.normal_bg, ctermfg = colors.blue }, -- |hit-enter| prompt and yes/no questions
  MatchParen = { ctermbg = colors.highlighted_bg },

  -- IlluminatedWordText = { cterm = { underline = true }, },
  -- IlluminatedWordRead = { cterm = { underline = true }, },
  -- IlluminatedWordWrite = { cterm = { underline = true }, },
  -- MatchParen = { cterm = { underline = true }, },
}
