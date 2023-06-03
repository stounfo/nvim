return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  lazy = false,
  config = function()
    vim.o.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_transparent_background = 1
    vim.cmd.colorscheme("gruvbox-material")
    vim.cmd("highlight CurrentWord cterm= underline gui=underline")
  end,
}

-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     vim.o.background = "dark" -- or "light" for light mode
--     vim.cmd([[colorscheme gruvbox]])
--   end,
-- }
