local colors = require("ui.colorscheme.colors")

return {
    NeoTreeDirectoryIcon = { ctermfg = colors.green },
    NeoTreeFileIcon = { ctermfg = colors.muted_fg },
    NeoTreeCursorLine = { ctermbg = colors.highlighted_bg },
    Directory = { ctermfg = colors.normal_fg },
    NeoTreeFileName = { ctermfg = colors.normal_fg },
    NeoTreeHiddenByName = { ctermfg = colors.magenta },

    -- git
    NeoTreeGitAdded = { ctermfg = colors.green },
    NeoTreeGitUntracked = { ctermfg = colors.red },
    NeoTreeGitIgnored = { ctermfg = colors.muted_fg },
    NeoTreeGitModified = { ctermfg = colors.blue },
    NeoTreeGitRenamed = { ctermfg = colors.blue },
    NeoTreeGitDeleted = { ctermfg = colors.normal_fg },
    -- TODO
    NeoTreeGitConflict = { ctermbg = colors.debug },
    NeoTreeGitStaged = { ctermbg = colors.debug },
    NeoTreeGitUnstaged = { ctermbg = colors.debug },
    --
    NeoTreeFloatBorder = {
        ctermbg = colors.normal_bg,
        ctermfg = colors.muted_fg,
    },
    NeoTreeFloatTitle = {
        ctermbg = colors.normal_bg,
        ctermfg = colors.highlighted_fg,
    },
    NeoTreeIndentMarker = { ctermfg = colors.muted_fg },
    -- NeoTreeTitleBar = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeFileNameOpened = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeDimText = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeFilterTerm = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeTabActive = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeTabInactive = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeTabSeparatorActive = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeTabSeparatorInactive = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeVertSplit = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeWinSeparator = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeStatusLineNC = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeDirectoryName = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeNormal = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeNormalNC = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeExpander = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeRootName = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeSymbolicLinkTarget = { ctermfg = colors.debug, ctermbg = colors.debug },
    -- NeoTreeModified = { ctermfg = colors.debug, ctermbg = colors.debug },
}
