local colors = require("colors")

local my_commands = {
    toggle_tree = function()
        require("neo-tree.command").execute({
            toggle = true,
            position = "float",
        })
    end,

    focus_tree = function()
        require("neo-tree.command").execute({
            reveal = true,
            position = "float",
        })
    end,
}

local _ = {
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
            if stats and stats.type == "directory" then
                require("neo-tree.setup.netrw").hijack()
            end
        end,
    }),
}

local mappings = {
    ["<C-s>"] = "open_split",
    ["<C-v>"] = "open_vsplit",
    ["P"] = {
        "toggle_preview",
        config = { use_float = true, use_image_nvim = false },
    },
}

local options = function()
    local settings = require("settings")
    return {
        close_if_last_window = true,
        enable_diagnostics = false,
        hide_root_node = true,
        popup_border_style = "rounded",
        window = {
            position = "float",
            popup = {
                size = { height = "80%", width = "40%" },
                position = "50%", -- 50% means center it
            },
            mappings = mappings,
        },
        default_component_configs = {
            indent = {
                last_indent_marker = "│",
            },
            icon = require("icons").folder_state,
            modified = {
                symbol = "",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = "",
                    modified = "",
                    deleted = "",
                    renamed = "",
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            },
            file_size = {
                enabled = false,
            },
            type = {
                enabled = false,
            },
            last_modified = {
                enabled = false,
            },
            created = {
                enabled = false,
                required_width = 40,
            },
            symlink_target = {
                enabled = false,
            },
        },
        filesystem = {
            filtered_items = {
                show_hidden_count = false,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_pattern = settings.hide_by_pattern,
            },
            follow_current_file = {
                enabled = false,
            },
            use_libuv_file_watcher = true,
        },
    }
end

local colorscheme = {
    NeoTreeDirectoryIcon = { ctermfg = colors.special_foreground },
    NeoTreeFileIcon = { ctermfg = colors.dark_backgound },
    Directory = { ctermfg = colors.default_foreground },
    NeoTreeFileName = { ctermfg = colors.default_foreground },
    NeoTreeHiddenByName = { ctermfg = colors.magenta },

    -- git
    NeoTreeGitAdded = { ctermfg = colors.green },
    NeoTreeGitUntracked = { ctermfg = colors.red },
    NeoTreeGitIgnored = { ctermfg = colors.dark_foreground },
    NeoTreeGitModified = { ctermfg = colors.blue },
    NeoTreeGitRenamed = { ctermfg = colors.blue },
    NeoTreeGitDeleted = { ctermfg = colors.default_foreground },
    -- TODO
    NeoTreeGitConflict = { ctermbg = colors.debug },
    NeoTreeGitStaged = { ctermbg = colors.debug },
    NeoTreeGitUnstaged = { ctermbg = colors.debug },

    -- window
    NeoTreeFloatBorder = {
        link = "FloatBorder",
    },
    NeoTreeFloatTitle = {
        link = "FloatTitle",
    },
    NeoTreeFloatNormal = {
        link = "NormalFloat",
    },
    NeoTreeCursorLine = { link = "CursorLine" },

    NeoTreeIndentMarker = { ctermfg = colors.darkest_foreground },
}

return {
    cmd = "Neotree",
    branch = "v3.x",
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        require("modules.dependencies.plenary"),
        require("modules.dependencies.nvim_web_devicons"),
        { "MunifTanjim/nui.nvim" },
    },
    opts = options,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("neo-tree").setup(opts)
    end,
    my_commands = my_commands,
}
