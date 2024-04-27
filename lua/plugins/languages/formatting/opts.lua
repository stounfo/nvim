return function()
    local formatters_by_ft = {}
    for _, opts in pairs(require("plugins.languages.configs")) do
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
