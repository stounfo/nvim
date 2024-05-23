local colors = require("colors")

local client_format = function(client_name, spinner, series_messages)
    if #series_messages == 0 then
        return nil
    end
    return {
        name = client_name,
        body = spinner,
    }
end

local format = function(client_messages)
    local function stringify(name, msg)
        return msg and string.format("%s %s", name, msg) or name
    end

    local lsp_clients = {}
    for _, client in ipairs(vim.lsp.get_active_clients()) do
        if
            client.attached_buffers[vim.api.nvim_win_get_buf(
                vim.g.statusline_winid or 0
            )]
        then
            table.insert(lsp_clients, client)
        end
    end

    if #lsp_clients > 0 then
        table.sort(lsp_clients, function(a, b)
            return a.name < b.name
        end)

        local messages_map = {}
        for _, message in ipairs(client_messages) do
            messages_map[message.name] = message.body
        end

        local builder = {}
        for _, client in ipairs(lsp_clients) do
            if
                type(client) == "table"
                and type(client.name) == "string"
                and string.len(client.name) > 0
            then
                if messages_map[client.name] then
                    table.insert(
                        builder,
                        stringify(client.name, messages_map[client.name])
                    )
                else
                    table.insert(builder, stringify(client.name))
                end
            end
        end
        return "" .. " " .. table.concat(builder, ",")
    else
        return ""
    end
end

local dependencies = {
    require("modules.dependencies.nvim_web_devicons"),
    require("modules.tools.aerial"),
    require("modules.tui.noice"),
    {
        "linrongbin16/lsp-progress.nvim",
        opts = {
            client_format = client_format,
            format = format,
        },
        config = function(_, opts)
            require("lsp-progress").setup(opts)
            local _ = {
                vim.api.nvim_create_augroup(
                    "lualine_augroup",
                    { clear = true }
                ),
                vim.api.nvim_create_autocmd("User", {
                    group = "lualine_augroup",
                    pattern = "LspProgressStatusUpdated",
                    callback = require("lualine").refresh,
                }),
            }
        end,
    },
}

local theme = {
    normal = {
        a = { bg = colors.light_background, fg = colors.dark_foreground },
        b = { bg = colors.default_background, fg = colors.dark_foreground },
        c = { bg = colors.light_background, fg = colors.dark_foreground },
    },
    insert = { a = { bg = colors.red, fg = colors.light_background } },
    command = { a = { bg = colors.cyan, fg = colors.light_background } },
    replace = { a = { bg = colors.yellow, fg = colors.light_background } },
    visual = { a = { bg = colors.green, fg = colors.light_background } },
}
vim.api.nvim_set_hl(0, "WinBar", { ctermfg = colors.dark_foreground })

local options = function()
    local symbols = {}
    for key, value in pairs(require("icons").diagnostic_signs) do
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
                            .. " "
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
