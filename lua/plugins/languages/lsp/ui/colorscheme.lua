local colors = require("ui.colorscheme.colors")

return {
  DiagnosticUnderlineError = { cterm = { undercurl = true }, sp = "red" },
  DiagnosticUnderlineWarn = { cterm = { undercurl = true }, sp = "yellow" },
  DiagnosticUnderlineInfo = { cterm = { undercurl = true }, sp = "blue" },
  DiagnosticUnderlineHint = { cterm = { undercurl = true }, sp = "green" },
}
