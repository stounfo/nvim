return function()
    return {
        size = function()
            return vim.o.columns * 0.4
        end,
        direction = "float",
        highlights = require("plugins.terminal.ui").highlights,
        float_opts = {
            border = "curved",
        },
    }
end
