local colors = require("ui.colorscheme.colors")

return {
  GitSignsAdd = { ctermfg = colors.green },
  GitSignsChange = { ctermfg = colors.blue },
  GitSignsDelete = { ctermfg = colors.red },
  -- GitSignsCurrentLineBlame = { ctermfg = C.surface1 },

  -- GitSignsAddPreview = {},
  -- GitSignsDeletePreview = {},
}
