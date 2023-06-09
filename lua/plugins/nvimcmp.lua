local function opts()
  local cmp = require("cmp")
  local window_opts = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
    border = "rounded",
  }

  return {
    completion = {
      completeopt = "menu,menuone,noinsert",
    },

    window = {
      completion = window_opts,
      documentation = window_opts,
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ["<tab>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
  }
end

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    require("plugins.cmpnvimlsp"),
    require("plugins.luaship"),
    require("plugins.cmpluasnip"),
    require("plugins.cmpbuffer"),
    require("plugins.cmppath"),
  },
  opts = opts,
  config = true,
}
