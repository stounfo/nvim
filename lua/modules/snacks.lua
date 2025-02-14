local colors = require("colors")

local header_lines = {
    "   |\\_._/|        |,\\__/|        |\\___/|        |\\/~\\/|  ",
    "   | o o |        |  o o|        | ^ ^ |        | * * |  ",
    "   (  T  )        (   W )        (  v  )        (  U  )  ",
    "  .^`-^-'^.      .^`--^'^.      .^'-^-'^.      .^`o^o'^. ",
    "  `.  ;  .'      `.  ;  .'      `.  *  .'      `.  |  .' ",
    "  | | | | |      | | | | |      | |---| |      | || || | ",
    " ((_((N))_))    ((_((V))_))    ((_((I))_))    ((_((M))_))",
}
local header = table.concat(header_lines, "\n")

local my_commands = {
    git_link = function()
        require("snacks").gitbrowse()
    end,
}

local colorscheme = {
    LspReferenceText = { ctermbg = colors.lightest_background },
    LspReferenceRead = { ctermbg = colors.lightest_background },
    LspReferenceWrite = { ctermbg = colors.lightest_background },
    SnacksIndent = { ctermfg = colors.light_background, blend = 0 },
    SnacksIndentScope = { ctermfg = colors.darkest_foreground, blend = 0 },
    SnacksDashboardHeader = { ctermfg = colors.blue },
    SnacksNotifierMinimal = { ctermfg = colors.darkest_foreground },
    SnacksNotifierIconError = { ctermfg = colors.red },
    SnacksNotifierIconWarn = { link = "SnacksNotifierMinimal" },
    SnacksNotifierIconInfo = { link = "SnacksNotifierMinimal" },
    SnacksNotifierIconDebug = { link = "SnacksNotifierMinimal" },
    SnacksNotifierIconTrace = { link = "SnacksNotifierMinimal" },
}

local options = function()
    return {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        gitbrowse = { enabled = true },
        words = { enabled = true },
        dashboard = {
            preset = {
                header = header,
                keys = {
                    {
                        icon = "",
                        key = "i",
                        desc = "New File",
                        action = ":ene | startinsert",
                    },
                    {
                        icon = "󰒲",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = "", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 2 },
                { section = "startup" },
            },
        },
        indent = {
            indent = {
                char = "▏",
            },
            scope = {
                enabled = false,
            },
            animate = {
                enabled = false,
            },
        },
        scroll = {
            enabled = false,
            animate = {
                duration = { step = 15, total = 250 },
                easing = "inQuad",
            },
        },
        notifier = {
            timeout = 700,
            padding = true,
            width = { min = 0, max = 0.5 },
            margin = { right = 0 },
            style = function(buf, notif, ctx)
                ctx.opts.border = "none"
                local whl = ctx.opts.wo.winhighlight
                ctx.opts.wo.winhighlight =
                    whl:gsub(ctx.hl.msg, "SnacksNotifierMinimal")
                vim.api.nvim_buf_set_lines(
                    buf,
                    0,
                    -1,
                    false,
                    { notif.icon .. notif.msg }
                )
                vim.api.nvim_buf_add_highlight(
                    buf,
                    ctx.ns,
                    ctx.hl.icon,
                    0,
                    0,
                    #notif.icon
                )
            end,
            icons = {
                error = "Error: ",
                warn = "Warn: ",
                info = "",
                debug = "Debug: ",
                trace = "Trace: ",
            },
        },
    }
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("snacks").setup(opts)
    end,
    my_commands = my_commands,
}
