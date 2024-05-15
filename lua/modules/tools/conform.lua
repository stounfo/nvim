local my_commands = {
    format = function()
        require("conform").format({ async = true })
    end,
}

local options = function()
    local formatters_by_ft = {}
    for _, opts in pairs(require("languages")) do
        if opts.formatters ~= nil then
            for name, formatter in pairs(opts.formatters) do
                formatters_by_ft[name] = formatter
            end
        end
    end
    return {
        formatters_by_ft = formatters_by_ft,
    }
end

return {
    "stevearc/conform.nvim",
    opts = options,
    config = true,
    my_commands = my_commands,
}
