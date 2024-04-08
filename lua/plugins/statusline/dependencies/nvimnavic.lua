-- Component that uses LSP to show your current code context. 

local function opts()
  return {
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    separator = " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    icons = {
      File = " ",
      Module = " ",
      Namespace = " ",
      Package = " ",
      Class = " ",
      Method = " ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = " ",
      Interface = " ",
      Function = " ",
      Variable = " ",
      Constant = " ",
      String = " ",
      Number = " ",
      Boolean = " ",
      Array = " ",
      Object = " ",
      Key = " ",
      Null = " ",
      EnumMember = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
    },
  }
end

return {
  "SmiteshP/nvim-navic",
  opts = opts,
  config = function(_, opts)
    require("nvim-navic").setup(opts)
  end,
}
