return function()
    local symbols = {}
    for key, value in pairs(require("ui.consts").diagnostic_signs) do
        symbols[key] = value .. " "
    end
    local winbar = {
        lualine_b = {
            {
                "filetype",
                icon_only = true,
                colored = false,
                separator = "",
                padding = {
                    left = 1,
                    right = 0,
                },
            },
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
                        final_path = final_path
                            .. " "
                            .. location.icon
                            .. location.name
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
                if vim.bo.modified then
                    return "●"
                end
                return "○"
            end,
        },
    }

    return {
        options = {
            section_separators = "",
            component_separators = "",
            globalstatus = true,
            theme = require("plugins.statusline.ui"),
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
                function()
                    return require("lsp-progress").progress()
                end,
                "location",
                "progress",
            },
            lualine_y = {},
            lualine_z = {},
        },
        winbar = winbar,
        inactive_winbar = winbar,
        extensions = require("plugins.statusline.extensions"),
    }
end
