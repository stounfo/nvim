local function opts()
  local symbols = {}
  for key, value in pairs(require("consts").diagnostic_signs) do
    symbols[key] = value .. " "
  end
  return {
    options = {
      theme = require("plugins.lualine.theme"),
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_b = {},
      lualine_c = {
        {
          "branch",
        },
        {
          "filetype",
          icon_only = true,
          colored = false,
          separator = "",
          padding = {
            left = 1,
            right = 0,
          },
        },
        {
          "filename",
          path = 1,
        },
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = symbols,
          -- colored = false,
        },
      },
      lualine_x = { "encoding", "location", "progress" },
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
    },
  }
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    require("plugins.nvimwebdevicons"),
  },
  opts = opts,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
