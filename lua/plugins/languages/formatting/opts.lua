return function()
    local formatters_by_ft = {}
    for name, opts in pairs(require("plugins.languages.configs")) do
        if opts.formatters then
            formatters_by_ft[name] = opts.formatters
        end
    end
    return {
        formatters_by_ft = formatters_by_ft,
    }
end
