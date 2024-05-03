-- file manager
require("plugins.filetree.autocmds")
return {
    cmd = "Neotree",
    branch = "v3.x",
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        require("plugins.shared.plenary"),
        require("plugins.shared.nvimwebdevicons"),
        require("plugins.filetree.dependencies.nui"),
    },
    opts = require("plugins.filetree.opts"),
    config = function(_, opts)
        require("plugins.filetree.ui")
        require("neo-tree").setup(opts)
    end,
}
