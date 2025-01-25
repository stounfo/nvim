local settings = require("settings")

local my_commands = {
    find_files = function()
        local vimgrep_arguments =
            vim.deepcopy(require("telescope.config").values.vimgrep_arguments)
        table.insert(vimgrep_arguments, "--files")
        for _, v in ipairs(settings.hide_by_pattern) do -- exclude trash
            table.insert(vimgrep_arguments, "--glob=!" .. v)
        end
        require("telescope.builtin").find_files({
            find_command = vimgrep_arguments,
        })
    end,

    find_files_all = function()
        local vimgrep_arguments =
            vim.deepcopy(require("telescope.config").values.vimgrep_arguments)
        table.insert(vimgrep_arguments, "--files")
        require("telescope.builtin").find_files({
            find_command = vimgrep_arguments,
        })
    end,

    live_grep = function()
        local vimgrep_arguments =
            vim.deepcopy(require("telescope.config").values.vimgrep_arguments)
        table.insert(vimgrep_arguments, "--fixed-strings") -- literal prompt instead of regex
        for _, v in ipairs(settings.hide_by_pattern) do -- exclude trash
            table.insert(vimgrep_arguments, "--glob=!" .. v)
        end
        require("telescope.builtin").live_grep({
            vimgrep_arguments = vimgrep_arguments,
        })
    end,

    live_grep_args = function()
        require("telescope").extensions.live_grep_args.live_grep_args()
    end,

    current_buffer_fuzzy_find = function()
        require("telescope.builtin").current_buffer_fuzzy_find()
    end,

    oldfiles = function()
        require("telescope.builtin").oldfiles({ only_cwd = true })
    end,

    oldfiles_all = function()
        require("telescope.builtin").oldfiles()
    end,

    -- vim
    buffers = function()
        require("telescope.builtin").buffers()
    end,

    help_tags = function()
        require("telescope.builtin").help_tags()
    end,

    marks = function()
        require("telescope.builtin").marks()
    end,

    keymaps = function()
        require("telescope.builtin").keymaps()
    end,

    highlights = function()
        require("telescope.builtin").highlights()
    end,

    -- git
    git_commits = function()
        require("telescope.builtin").git_commits()
    end,

    git_status = function()
        require("telescope.builtin").git_status()
    end,

    git_branches = function()
        require("telescope.builtin").git_branches()
    end,

    -- Go to
    lsp_definitions = function()
        require("telescope.builtin").lsp_definitions({ show_line = false })
    end,

    lsp_type_definitions = function()
        require("telescope.builtin").lsp_type_definitions({ show_line = false })
    end,

    lsp_references = function()
        require("telescope.builtin").lsp_references({ show_line = false })
    end,

    -- diagnostic
    current_buff_diagnostic = function()
        require("telescope.builtin").diagnostics({
            bufnr = 0,
            show_line = false,
        })
    end,
}

local mappings = function()
    return {
        buffers = {
            i = {
                ["<C-d>"] = "delete_buffer",
            },
            n = {
                ["<C-d>"] = "delete_buffer",
            },
        },

        general = {
            i = {
                ["<C-q>"] = require("telescope.actions").send_to_qflist,
                ["<C-s>"] = "select_horizontal",
                ["<C-v>"] = "select_vertical",
            },
            n = {
                ["<C-q>"] = require("telescope.actions").send_to_qflist,
                ["<C-s>"] = "select_horizontal",
                ["<C-v>"] = "select_vertical",
                ["]h"] = require("telescope.actions").cycle_history_next,
                ["[h"] = require("telescope.actions").cycle_history_prev,
                ["<C-n>"] = require("telescope.actions").move_selection_next,
                ["<C-p>"] = require("telescope.actions").move_selection_previous,
            },
        },
    }
end

local pickers = function()
    return {
        buffers = {
            mappings = mappings().buffers,
        },
        find_files = {
            path_display = { "filename_first" },
        },
        live_grep = {
            path_display = { "tail" },
            disable_coordinates = true,
        },
        oldfiles = {
            path_display = { "filename_first" },
        },
    }
end

local options = function()
    return {
        defaults = {
            layout_config = {
                vertical = {
                    prompt_position = "top",
                    height = 0.9,
                    width = 0.8,
                    mirror = true,
                    preview_cutoff = 30,
                },
            },
            layout_strategy = "vertical",
            sorting_strategy = "ascending",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--no-ignore",
            },
            dynamic_preview_title = true,
            mappings = mappings().general,
        },
        pickers = pickers(),
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
            live_grep_args = vim.tbl_deep_extend("error", {
                auto_quoting = false,
            }, pickers().live_grep),
        },
    }
end

local dependencies = {
    require("modules.dependencies.plenary"),
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
    },
}

local colorscheme = {
    TelescopeSelection = { link = "CursorLine" },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopePromptTitle = { link = "FloatTitle" },
    TelescopeResultsTitle = { link = "TelescopePromptTitle" },
    TelescopePreviewTitle = { link = "TelescopePromptTitle" },
    TelescopeMatching = { link = "Search" },
    TelescopePreviewLine = { link = "CursorLine" },
}

return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = options,
    dependencies = dependencies,
    config = function(_, opts)
        require("utils").set_hl(colorscheme)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("live_grep_args")
    end,
    my_commands = my_commands,
}
