local parsers = function()
    local ensure_installed = {}
    for _, opts in pairs(require("languages")) do
        if opts.treesitter_to_install then
            ensure_installed =
                vim.list_extend(ensure_installed, opts.treesitter_to_install)
        end
    end
    return ensure_installed
end

local _ = {
    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            local filetype = vim.bo[args.buf].filetype
            local lang = vim.treesitter.language.get_lang(filetype)
            if not lang then
                return
            end

            local ok, parser_available = pcall(vim.treesitter.language.add, lang)
            if ok and parser_available then
                vim.treesitter.start(args.buf, lang)
            end
        end,
    }),
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()
        require("nvim-treesitter").install(parsers())
    end,
}
