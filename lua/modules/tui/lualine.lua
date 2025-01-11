local colors = require("colors")

local dependencies = {
    require("modules.dependencies.nvim_web_devicons"),
    require("modules.tools.aerial"),
    require("modules.tui.noice"),
}

local theme = {
    normal = {
        a = { bg = colors.light_background, fg = colors.darkest_foreground },
        b = { bg = colors.default_background, fg = colors.darkest_foreground },
        c = { bg = colors.light_background, fg = colors.darkest_foreground },
    },
    insert = { a = { bg = colors.red, fg = colors.light_background } },
    command = { a = { bg = colors.cyan, fg = colors.light_background } },
    replace = { a = { bg = colors.yellow, fg = colors.light_background } },
    visual = { a = { bg = colors.blue, fg = colors.light_background } },
}

local options = function()
    local symbols = {}
    for key, value in pairs(require("icons").diagnostic_signs) do
        symbols[key] = value .. " "
    end
    local winbar = {
        lualine_b = {
            function()
                local final_path = ""

                local file_path = vim.fn.expand("%:.")
                if #file_path == 0 then
                    file_path = "[No Name]"
                end
                final_path = final_path .. file_path

                local location_path = require("aerial").get_location()
                if #location_path > 0 then
                    for _, location in ipairs(location_path) do
                        final_path = final_path .. "::" .. location.name
                    end
                end

                return final_path
            end,
            { "%=" },
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                symbols = symbols,
                colored = false,
            },
            function()
                local final = ""
                local colored = false
                local signs = {
                    { key = "added", symbol = "+", hl = "%#GitSignsAdd#" },
                    { key = "changed", symbol = "~", hl = "%#GitSignsChange#" },
                    { key = "removed", symbol = "-", hl = "%#GitSignsDelete#" },
                }
                for _, sign in ipairs(signs) do
                    local count = vim.b.gitsigns_status_dict[sign.key] or 0
                    if count > 0 then
                        if colored then
                            final = final .. sign.hl
                        end
                        final = final .. " " .. sign.symbol .. count
                    end
                end
                return final
            end,
            function()
                if vim.bo.modified then
                    return ""
                end
                return ""
            end,
        },
    }

    return {
        options = {
            disabled_filetypes = {
                "dapui_watches",
                "dapui_breakpoints",
                "dapui_scopes",
                "dapui_console",
                "dapui_stacks",
                "dap-repl",
                "snacks_dashboard",
                "trouble",
            },
            section_separators = "",
            component_separators = "",
            globalstatus = true,
            theme = theme,
        },
        sections = {
            lualine_b = {},
            lualine_c = {
                function()
                    return " "
                        .. (vim.fn.fnamemodify(vim.fn.getcwd(), ":t") or "")
                end,
                { "branch", icon = "" },
            },
            lualine_x = {
                {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                    color = { fg = colors.special_foreground },
                },
                {
                    require("noice").api.status.command.get,
                    cond = require("noice").api.status.command.has,
                },
                function()
                    return "Ln %l:%L Col %v:%{strchars(getline('.'))}"
                end,
            },
            lualine_y = {},
            lualine_z = {},
        },
        winbar = winbar,
        inactive_winbar = winbar,
        extensions = {
            neotree = {
                winbar = {},
                filetypes = { "neo-tree" },
            },

            aerial = {
                winbar = {},
                filetypes = { "aerial" },
            },
        },
    }
end

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = dependencies,
    opts = options,
    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}
