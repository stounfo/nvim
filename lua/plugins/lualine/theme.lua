-- TODO del hardcode
local colors = {
  fg = "#928374",
  bg = "#282828",
  bg2 = "#1d2021",
  color2 = "#504945",
  color5 = "#7daea3",
  color6 = "#a9b665",
  color7 = "#d8a657",
  color8 = "#d3869b",
  color9 = "#ea6962",
}

return {
  normal = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg2 },
    c = { fg = colors.fg, bg = colors.bg },

  },
  command = { a = { fg = colors.bg, bg = colors.color5 } },
  inactive = { a = { fg = colors.bg, bg = colors.color2 } },
  insert = { a = { fg = colors.bg, bg = colors.color9 } },
  replace = { a = { fg = colors.bg, bg = colors.color7 } },
  terminal = { a = { fg = colors.bg, bg = colors.color8 } },
  visual = { a = { fg = colors.bg, bg = colors.color6 } },
}
