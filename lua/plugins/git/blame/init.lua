return {
    "FabijanZulj/blame.nvim",
    cmd = {
        "BlameToggle",
    },
    opts = require("plugins.git.blame.opts"),
    config = function(_, opts)
        require("blame").setup(opts)
    end,
}
