local settings = require("settings")

local M = {}

-- search
M.find_files = function()
    local vimgrep_arguments =
        vim.deepcopy(require("telescope.config").values.vimgrep_arguments)
    table.insert(vimgrep_arguments, "--files")
    for _, v in ipairs(settings.hide_by_pattern) do -- exclude trash
        table.insert(vimgrep_arguments, "--glob=!" .. v)
    end
    require("telescope.builtin").find_files({
        find_command = vimgrep_arguments,
    })
end

M.find_files_all = function()
    local vimgrep_arguments =
        vim.deepcopy(require("telescope.config").values.vimgrep_arguments)
    table.insert(vimgrep_arguments, "--files")
    require("telescope.builtin").find_files({
        find_command = vimgrep_arguments,
    })
end

M.live_grep = function()
    local vimgrep_arguments =
        vim.deepcopy(require("telescope.config").values.vimgrep_arguments)
    table.insert(vimgrep_arguments, "--fixed-strings") -- literal promt istead of regex
    for _, v in ipairs(settings.hide_by_pattern) do -- exclude trash
        table.insert(vimgrep_arguments, "--glob=!" .. v)
    end
    require("telescope.builtin").live_grep({
        vimgrep_arguments = vimgrep_arguments,
    })
end

M.live_grep_args = function()
    require("telescope").extensions.live_grep_args.live_grep_args()
end

M.current_buffer_fuzzy_find = function()
    require("telescope.builtin").current_buffer_fuzzy_find()
end

M.oldfiles = function()
    require("telescope.builtin").oldfiles()
end

-- vim
M.buffers = function()
    require("telescope.builtin").buffers()
end

M.help_tags = function()
    require("telescope.builtin").help_tags()
end

M.marks = function()
    require("telescope.builtin").marks()
end

M.keymaps = function()
    require("telescope.builtin").keymaps()
end

-- git
M.git_commits = function()
    require("telescope.builtin").git_commits()
end

M.git_status = function()
    require("telescope.builtin").git_status()
end

M.git_branches = function()
    require("telescope.builtin").git_branches()
end

-- Go to
M.lsp_definitions = function()
    require("telescope.builtin").lsp_definitions({ show_line = false })
end

M.lsp_type_definitions = function()
    require("telescope.builtin").lsp_type_definitions({ show_line = false })
end

M.lsp_references = function()
    require("telescope.builtin").lsp_references({ show_line = false })
end

-- diagnostic
M.current_buff_diagnostic = function()
    require("telescope.builtin").diagnostics({ bufnr = 0, show_line = false })
end

return M
