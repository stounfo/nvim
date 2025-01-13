local colors = require("colors")
local settings = require("settings")

local my_commands = {
    find_files = function()
        local cmd = [[rg --color=never --files --hidden --follow --no-ignore ]]
        for _, v in ipairs(settings.hide_by_pattern) do -- exclude trash
            cmd = cmd .. " --glob=!" .. v
        end
        require("fzf-lua").files({
            cmd = cmd,
            winopts = {
                title = " Find Files ",
            },
        })
    end,

    find_files_all = function()
        local cmd = [[rg --color=never --files --hidden --follow --no-ignore ]]
        require("fzf-lua").files({
            cmd = cmd,
            winopts = {
                title = " Find Files All ",
            },
        })
    end,

    live_grep = function()
        require("fzf-lua").live_grep({})
    end,
}

local options = function()
    return {
        files = {
            formatter = "path.filename_first",
            header = false,
            git_icons = false,
            prompt = "> ",
            cwd_prompt = false,
            actions = nil,
        },
        grep = {
            debug = true,
            prompt = "> ",
            formatter = "path.filename_first",
            actions = nil,
            fzf_opts = {
                ["--with-nth"] = "4..",
            },
            no_header_i = false,
        },
        fzf_opts = {
            ["--pointer"] = ">",
        },
        winopts = {
            row = 0.5,
            col = 0.5,
            height = 0.9,
            width = 0.8,
            backdrop = false,
            title = "",
            title_pos = "center",
            border = "rounded",
            preview = {
                vertical = "down:60%",
                layout = "vertical",
            },
        },
        fzf_colors = {
            ["fg"] = { "fg", "NormalFloat" },
            ["bg"] = { "bg", "NormalFloat" },
            ["hl"] = tostring(colors.blue),
            ["fg+"] = { "fg", "NormalFloat" },
            ["bg+"] = { "bg", "CursorLine" },
            ["hl+"] = tostring(colors.blue),
            ["info"] = { "fg", "NormalFloat" },
            ["border"] = { "fg", "FloatBorder" },
            ["gutter"] = "-1",
            ["query"] = { "fg", "NormalFloat" },
            ["prompt"] = { "fg", "NormalFloat" },
            ["pointer"] = { "fg", "NormalFloat" },
            ["marker"] = { "fg", "NormalFloat" },
            ["header"] = { "fg", "FloatTitle" },
        },
    }
end

local colorscheme = {
    FzfLuaTitle = { link = "FloatTitle" },
    FzfLuaBorder = { link = "FloatBorder" },
}

return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { require("modules.dependencies.nvim_web_devicons") },
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("fzf-lua").setup(opts)
    end,
    my_commands = my_commands,
}
