require("utils").set_hl(
  require("plugins.autocompletion.nvimcmp.ui.colorscheme")
)

return {
  window_opts = {
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:NvimcmpCursorLine",
    border = "rounded",
  },
}
