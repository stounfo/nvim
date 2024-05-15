local options = function()
    local utils = require("utils")

    local ensure_installed = {}
    for _, opts in pairs(require("languages")) do
        if opts.treesitter_to_install then
            ensure_installed =
                utils.merge_arrays(ensure_installed, opts.treesitter_to_install)
        end
    end
    return {
        ensure_installed = ensure_installed,
        highlight = { enable = true },
    }
end

return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = options,
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
