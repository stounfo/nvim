local colors = require("ui.colorscheme.colors")

return {
  NeoTreeDirectoryIcon = { ctermfg = colors.green },
  NeoTreeFileIcon = { ctermfg = colors.muted_fg },
  NeoTreeCursorLine = { ctermbg = colors.muted_bg },
  Directory = { ctermfg = colors.normal_fg },
  NeoTreeFileName = { ctermfg = colors.normal_fg },
  NeoTreeHiddenByName = { ctermfg = colors.magenta },

  -- git
  NeoTreeGitAdded = { ctermfg = colors.green },
  NeoTreeGitUntracked = { ctermfg = colors.red },
  NeoTreeGitIgnored = { ctermfg = colors.muted_fg },
  NeoTreeGitModified = { ctermfg = colors.blue },
  NeoTreeGitRenamed = { ctermfg = colors.blue },
  -- todo
  NeoTreeGitConflict = { ctermbg = colors.debug },
  NeoTreeGitDeleted = { ctermbg = colors.debug },
  NeoTreeGitStaged = { ctermbg = colors.debug },
  NeoTreeGitUnstaged = { ctermbg = colors.debug },
}

