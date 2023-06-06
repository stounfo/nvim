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

    vim.cmd("highlight errorText gui=undercurl")
    vim.cmd("highlight WarningText gui=undercurl")
    vim.cmd("highlight InfoText gui=undercurl")
    vim.cmd("highlight HintText gui=undercurl")
    vim.cmd("hi NeoTreeWinSeparator guifg=#1d2021")
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
