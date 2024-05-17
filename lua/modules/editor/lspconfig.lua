local my_commands = {
    declaration = function()
        vim.lsp.buf.declaration()
    end,

    line_diagnostic = function()
        vim.diagnostic.open_float({ border = "rounded" })
    end,

    code_action = function()
        vim.lsp.buf.code_action()
    end,

    rename = function()
        vim.lsp.buf.rename()
    end,
}

local colorscheme = {
    DiagnosticUnderlineError = { cterm = { undercurl = true }, sp = "Red" },
    DiagnosticUnderlineWarn = {
        cterm = { undercurl = true },
        sp = "Yellow",
    },
    DiagnosticUnderlineInfo = { cterm = { undercurl = true }, sp = "Blue" },
    DiagnosticUnderlineHint = {
        cterm = { undercurl = true },
        sp = "Green",
    },
}

local ui = function()
    -- Hover border style
    vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

    vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        signs = false,
        update_in_insert = false,
        severity_sort = true,
    })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        require("modules.tools.mason"),
    },
    config = function()
        require("utils").set_hl(colorscheme)
        ui()

        local lspconfig = require("lspconfig")
        for _, opts in pairs(require("languages")) do
            if opts.lsp_configs then
                for name, config in pairs(opts.lsp_configs) do
                    lspconfig[name].setup(config)
                end
            end
        end
    end,
    my_commands = my_commands,
}
