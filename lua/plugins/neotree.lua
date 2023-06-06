local opts = {
  window = {
    position = "left",
    mappings = {
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        ".DS_Store",
        "__pycache__",
      },
    },
  },
}

return {
  cmd = "Neotree",
  keys = require("mappings").neotree,
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    require("plugins.plenary"),
    require("plugins.nvimwebdevicons"),
    require("plugins.nui"),
  },
  opts = opts,
  config = true,
}
