return function()
    local search_commands = require("plugins.search.commands")
    local filetree_commands = require("plugins.filetree.commands")
    local comment_commands = require("plugins.other.comment.commands")
    local gitsigns_commans = require("plugins.git.commands")
    local conform_commands = require("plugins.languages.formatting.commands")
    local aerial_commands = require("plugins.code_navigation.commands")
    local lsp_commands = require("plugins.languages.lsp.commands")
    local copilot_commands = require("plugins.autocompletion.copilot.commands")
    local zen_mode_commands = require("plugins.other.zenmode.commands")

    local wk = require("which-key")
    -- general
    wk.register({
        K = { lsp_commands.hover, "Hover" },
        ["<leader>d"] = { lsp_commands.line_diagnostic, "Line diagnostic" },
        ["<leader>D"] = {
            search_commands.current_buff_diagnostic,
            "Current buff diagnostic",
        },
    }, { mode = "n" })

    -- window
    wk.register({
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },
    }, {})

    -- next
    wk.register({
        ["]b"] = { "<C-^>", "Next buffer" },
        ["]h"] = { gitsigns_commans.next_hunk, "Next hunk" },
    }, { name = "Next" })

    -- previous
    wk.register({
        ["[b"] = { "<C-^>", "Previous buffer" },
        ["[h"] = { gitsigns_commans.prev_hunk, "Previous hunk" },
    }, { name = "Previous" })

    -- focus
    -- wk.register({
    --     ["<C-y>"] = { aerial_commands.open, "Focus symbols" },
    -- }, {})

    -- toggle
    wk.register({
        y = { aerial_commands.toggle_aerial, "Toggle symbols" },
        c = { copilot_commands.toggle_copilot, "Toggle copilot" },
        z = { zen_mode_commands.toggle_zen_mode, "Toggle zen mode" },
    }, { mode = "n", desc = "Toggle", prefix = "<leader>t" })

    -- go to
    wk.register({
        D = { lsp_commands.declaration, "Declaration" },
        d = { search_commands.lsp_definitions, "Definition" },
        t = { search_commands.lsp_type_definitions, "Type definition" },
        r = { search_commands.lsp_references, "References" },
    }, { mode = "n", desc = "Go to", prefix = "g" })

    -- filetree
    wk.register({
        ["<C-f>"] = { filetree_commands.toggle_tree, "Toggle tree" },
        ["<leader>e"] = { filetree_commands.focus_tree, "Focus tree" },
    }, { mode = "n" })
    wk.register(
        { ["<C-f>"] = { filetree_commands.toggle_tree, "Toggle tree" } },
        { mode = "i" }
    )

    -- comment
    wk.register({
        ["<leader>/"] = { comment_commands.toogle_comment, "Toggle comment" },
    }, { mode = "n" })
    wk.register({
        ["<leader>/"] = {
            comment_commands.toogle_comment_visual,
            "Toggle comment",
        },
    }, { mode = "v" })

    -- search
    wk.register({
        -- files
        f = { search_commands.find_files, "Find files" },
        F = { search_commands.find_files_all, "Find files all" },
        w = { search_commands.live_grep, "Live grep" },
        W = { search_commands.live_grep_args, "Live grep (Args)" },
        o = { search_commands.oldfiles, "Find oldfiles" },
        O = { search_commands.oldfiles_all, "Find oldfiles all" },
        -- vim
        z = {
            search_commands.current_buffer_fuzzy_find,
            "Find in current buffer",
        },
        b = { search_commands.buffers, "Find buffers" },
        t = { search_commands.help_tags, "Help tags" },
        m = { search_commands.marks, "Bookmarks" },
        k = { search_commands.keymaps, "Keymaps" },
    }, { mode = "n", desc = "Search", prefix = "<leader>f" })

    -- git
    wk.register({
        c = { search_commands.git_commits, "Git commits" },
        s = { search_commands.git_status, "Git status" },
        b = { search_commands.git_branches, "Git branches" },
        l = { gitsigns_commans.blame_line, "Blame line" },
        r = { gitsigns_commans.reset_buffer, "Reset buffer" },
        h = {
            name = "Hunk",
            p = { gitsigns_commans.preview_hunk, "Preview hunk" },
            r = { gitsigns_commans.reset_hunk, "Reset hunk" },
        },
    }, { mode = "n", desc = "Git", prefix = "<leader>g" })

    -- refactoring
    wk.register({
        r = { lsp_commands.rename, "Rename" },
        f = { conform_commands.format, "Formating" },
        F = { conform_commands.format_all, "Formating" },
        a = { lsp_commands.code_action, "Code action" },
        c = { copilot_commands.panel, "Copilot panel" },
    }, { mode = "n", desc = "Refactoring", prefix = "<leader>r" })
end
