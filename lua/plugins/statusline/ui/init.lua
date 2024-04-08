local colors = require("ui.colorscheme.colors")

vim.api.nvim_set_hl(0, "WinBar", { ctermfg = colors.muted_fg })

return {
  normal = {
    a = { bg = colors.highlighted_bg, fg = colors.muted_fg },
    b = { bg = colors.normal_bg, fg = colors.muted_fg },
    c = { bg = colors.highlighted_bg, fg = colors.muted_fg },
  },
  insert = { a = { bg = colors.red, fg = colors.highlighted_bg } },
  command = { a = { bg = colors.cyan, fg = colors.highlighted_bg } },
  replace = { a = { bg = colors.yellow, fg = colors.highlighted_bg } },
  visual = { a = { bg = colors.green, fg = colors.highlighted_bg } },
}
