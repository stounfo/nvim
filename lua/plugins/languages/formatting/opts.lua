return function()
    local formatters_by_ft = {}
    for _, opts in pairs(require("plugins.languages.configs")) do
        for name, formatter in pairs(opts.formatters) do
            formatters_by_ft[name] = formatter
        end
    end
    vim.print(formatters_by_ft)
    return {
        formatters_by_ft = formatters_by_ft,
    }
end
