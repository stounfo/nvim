local options = function()
    return {
        input = {
            title_pos = "center",
        },
    }
end

return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = options,
}
