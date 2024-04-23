return function()
    local utils = require("utils")
    local ensure_installed = {}

    for _, opts in pairs(require("plugins.languages.configs")) do
        if opts.treesitter_to_install then
            ensure_installed =
                utils.merge_arrays(ensure_installed, opts.treesitter_to_install)
        end
    end

    ensure_installed = utils.merge_arrays(ensure_installed, {
        "html",
        "json",
        "vimdoc",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
        "bash",
    })

    return {
        ensure_installed = ensure_installed,
        highlight = { enable = true },
    }
end
