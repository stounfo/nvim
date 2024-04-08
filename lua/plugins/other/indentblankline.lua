local ui = function()
  local colors = require("ui.colorscheme.colors")
  local groups = {
    IblIndent = { ctermfg = colors.muted_fg, blend = 0 },
    IblScope = { ctermfg = colors.muted_fg, blend = 0 },
  }
  require("utils").set_h1(groups)
end

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",
  config = function()
    ui()
    require("ibl").setup({
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
    })
  end,
}
