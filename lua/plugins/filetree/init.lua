-- file manager
return {
  cmd = "Neotree",
  branch = "v3.x",
  keys = require("mappings").filetree,
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    require("plugins.shared.plenary"),
    require("plugins.shared.nvimwebdevicons"),
    require("plugins.filetree.dependencies.nui"),
  },
  opts = require("plugins.filetree.opts"),
  config = function(_, opts)
    require("neo-tree").setup(opts)
    require("plugins.filetree.ui")
  end,
}
