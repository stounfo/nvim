local options = function()
    return {
        preset = "helix",
        icons = {
            separator = "",
            mappings = false,
        },
    }
end

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = options,
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        require("mappings")()
    end,
}
