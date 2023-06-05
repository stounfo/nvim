local function opts()
  local symbols = {}
  for key, value in pairs(require("consts").diagnostic_signs) do
    symbols[key] = value .. " "
  end
  local winbar = {
    lualine_b = {
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
      { "%=" },
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = symbols,
        colored = false
      },
    },
  }

  return {
    options = {
      theme = require("plugins.lualine.theme"),
      section_separators = "",
      component_separators = "",
      globalstatus = true,
    },
    sections = {
      lualine_b = {},
      lualine_c = {
        {
          "branch",
        },
      },
      lualine_x = {
        "encoding",
        "location",
        "progress",
        function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") or ""
        end,
      },
      lualine_y = {},
      lualine_z = {},
    },
    winbar = winbar,
    inactive_winbar = winbar,
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
