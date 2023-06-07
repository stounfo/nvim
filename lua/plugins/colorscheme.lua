return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  lazy = false,
  config = function()
    vim.o.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_current_word = "underline"

    vim.cmd.colorscheme("gruvbox-material")

    -- TODO remove hardcode

    vim.cmd("highlight errorText gui=undercurl")
    vim.cmd("highlight WarningText gui=undercurl")
    vim.cmd("highlight InfoText gui=undercurl")
    vim.cmd("highlight HintText gui=undercurl")

    -- neo tree
    vim.cmd("hi NeoTreeWinSeparator guifg=#1d2021")
    vim.cmd("hi link NeoTreeDirectoryIcon Green")
    vim.cmd("hi Directory guifg=#928374")
    vim.cmd("hi NeoTreeFileName guifg=#928374")

    vim.cmd("hi link NeoTreeGitUntracked Red")
    vim.cmd("hi NeoTreeGitIgnored guifg=#504945")
    -- vim.cmd("hi NeoTreeGitStaged guifg=#ff0000")
    -- vim.cmd("hi NeoTreeGitUnstaged guifg=#ff0000")
    -- vim.cmd("hi NeoTreeGitConflict guifg=#ff0000")
    -- vim.cmd("hi NeoTreeGitRenamed guifg=#ff0000")
    -- vim.cmd("hi NeoTreeGitDeleted guifg=#ff0000")

  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     vim.cmd.colorscheme("tokyonight")
--   end
-- }
