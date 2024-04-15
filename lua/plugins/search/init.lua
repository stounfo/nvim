-- file, lsp, git etc searches
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require("plugins.search.opts"),
    dependencies = {
        require("plugins.shared.plenary"),
        require("plugins.search.dependencies.telescopefzfnative"),
        require("plugins.search.dependencies.telescopelivegrepargs"),
    },
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
        require("plugins.search.ui")
    end,
}
