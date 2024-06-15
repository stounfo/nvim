return function()
    local telescope_commands = require("modules.tools.telescope").my_commands
    local neo_tree_commands = require("modules.tools.neo_tree").my_commands
    local gitsigns_commans = require("modules.tools.vcs.gitsigns").my_commands
    local blame_commands = require("modules.tools.vcs.blame").my_commands
    local conform_commands = require("modules.tools.conform").my_commands
    local aerial_commands = require("modules.tools.aerial").my_commands
    local lspconfig_commands = require("modules.editor.lspconfig").my_commands
    local copilot_commands =
        require("modules.editor.completion.copilot").my_commands
    local dabbodui_commands = require("modules.tools.vim_dadbod_ui").my_commands
    local zoom_commands = require("modules.tui.zoom_window").my_commands
    local copilot_chat_commands =
        require("modules.tools.copilot_chat").my_commands
    local neotest = require("modules.tools.neotest").my_commands
    local dap = require("modules.tools.dap.dap").my_commands
    local dapui = require("modules.tools.dap.dap_ui").my_commands
    local gitlinker = require("modules.tools.vcs.gitlinker").my_commands
    local git_dev = require("modules.tools.vcs.git_dev").my_commands

    local wk = require("which-key")

    -- general
    wk.register({
        ["<leader>d"] = {
            lspconfig_commands.line_diagnostic,
            "Line diagnostic",
        },
        ["<leader>D"] = {
            telescope_commands.current_buff_diagnostic,
            "Current buff diagnostic",
        },
        ["}"] = { "}zz", "Next paragraph" },
        ["{"] = { "{zz", "Previous paragraph" },
        ["n"] = { "nzz", "Next search" },
        ["N"] = { "Nzz", "Previous search" },
    }, { mode = "n" })

    -- window
    wk.register({
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },
    }, {})
    wk.register({
        ["<C-w>z"] = { zoom_commands.toggle_zoom, "Toggle zoom" },
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

    -- go to
    wk.register({
        D = { lspconfig_commands.declaration, "Declaration" },
        d = { telescope_commands.lsp_definitions, "Definition" },
        t = { telescope_commands.lsp_type_definitions, "Type definition" },
        r = { telescope_commands.lsp_references, "References" },
    }, { mode = "n", desc = "Go to", prefix = "g" })

    -- filetree
    wk.register({
        ["<C-f>"] = { neo_tree_commands.toggle_tree, "Toggle tree" },
        ["<leader>e"] = { neo_tree_commands.focus_tree, "Focus tree" },
    }, { mode = "n" })
    wk.register(
        { ["<C-f>"] = { neo_tree_commands.toggle_tree, "Toggle tree" } },
        { mode = "i" }
    )

    -- search
    wk.register({
        -- files
        f = { telescope_commands.find_files, "Find files" },
        F = { telescope_commands.find_files_all, "Find files all" },
        w = { telescope_commands.live_grep, "Live grep" },
        W = { telescope_commands.live_grep_args, "Live grep (Args)" },
        o = { telescope_commands.oldfiles, "Find oldfiles" },
        O = { telescope_commands.oldfiles_all, "Find oldfiles all" },
        -- vim
        z = {
            telescope_commands.current_buffer_fuzzy_find,
            "Find in current buffer",
        },
        b = { telescope_commands.buffers, "Find buffers" },
        t = { telescope_commands.help_tags, "Help tags" },
        m = { telescope_commands.marks, "Bookmarks" },
        k = { telescope_commands.keymaps, "Keymaps" },
        h = { telescope_commands.highlights, "Highlights" },
    }, { mode = "n", desc = "Search", prefix = "<leader>f" })

    -- git
    wk.register({
        c = { telescope_commands.git_commits, "Git commits" },
        s = { telescope_commands.git_status, "Git status" },
        b = { telescope_commands.git_branches, "Git branches" },
        l = { gitsigns_commans.blame_line, "Blame line" },
        L = { blame_commands.toggle_blame, "Toggle blame" },
        r = { gitsigns_commans.reset_buffer, "Reset buffer" },
        h = {
            name = "Hunk",
            p = { gitsigns_commans.preview_hunk, "Preview hunk" },
            r = { gitsigns_commans.reset_hunk, "Reset hunk" },
        },
        Y = { gitlinker.git_link, "Create link and open" },
        O = { git_dev.open_repo, "Open remote repo" },
    }, { mode = "n", desc = "Git", prefix = "<leader>g" })
    wk.register({
        Y = { gitlinker.git_link, "Create link and open" },
    }, { mode = "v", desc = "Git", prefix = "<leader>g" })

    -- copilot_chat
    wk.register({
        c = { copilot_chat_commands.toggle_chat, "Toggle chat" },
        C = { copilot_commands.toggle_copilot, "Toggle copilot" },
        o = { copilot_chat_commands.commit_staged, "Commit staged" },
        O = { copilot_chat_commands.commit, "Commit" },
    }, { mode = "n", desc = "Copilot chat", prefix = "<leader>c" })
    wk.register({
        e = { copilot_chat_commands.explain, "Explain" },
        r = { copilot_chat_commands.review, "Review" },
        f = { copilot_chat_commands.fix, "Fix" },
        p = { copilot_chat_commands.optimize, "Optimize" },
        d = { copilot_chat_commands.docs, "Docs" },
        t = { copilot_chat_commands.tests, "Tests" },
        i = { copilot_chat_commands.diagnostic, "Diagnostic" },
    }, { mode = "v", desc = "Copilot chat", prefix = "<leader>c" })

    -- refactoring
    wk.register({
        r = { lspconfig_commands.rename, "Rename" },
        f = { conform_commands.format, "Formating" },
        a = { lspconfig_commands.code_action, "Code action" },
        c = { copilot_commands.panel, "Copilot panel" },
    }, { mode = "n", desc = "Refactoring", prefix = "<leader>r" })

    -- symbols
    wk.register({
        y = { aerial_commands.toggle_aerial, "Toggle symbols" },
    }, { mode = "n", desc = "Symbols", prefix = "<leader>y" })

    -- db
    wk.register({
        d = { dabbodui_commands.toggle_dabbodui, "Toggle database ui" },
    }, { mode = "n", desc = "Database", prefix = "<leader>b" })

    -- debug/run
    wk.register({
        c = { dap.continue, "Continue" },
        b = { dap.toggle_breakpoint, "Toggle breakpoint" },
        o = { dap.step_over, "Step over" },
        i = { dap.step_into, "Step into" },
        O = { dap.run_to_cursor, "Run to cursor" },
        T = { dap.terminate, "Terminate" },
        K = { dapui.hover, "Hover" },

        r = { dap.run, "Run" },
        u = { dapui.toggle_dapui, "Toggle dapui" },
        e = { dapui.show_repl, "Show repl" },
    }, {
        mode = "n",
        desc = "Debug",
        prefix = "<leader>u",
    })

    -- tests
    wk.register({
        t = { neotest.toggle_ui, "Toggle neotest ui" },
        n = { neotest.test_nearest, "Run nearest test" },
        N = { neotest.test_nearest_debug, "Debug nearest test" },
        f = { neotest.test_file, "Run all tests in file" },
    }, { mode = "n", desc = "Tests", prefix = "<leader>t" })

    wk.register({
        l = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t single-line') <cr>",
            "To one line",
        },
        s = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t snake-case') <cr>",
            "To snake_case",
        },
        k = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t kebab-case') <cr>",
            "To kebab-case",
        },
        c = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t camel-case') <cr>",
            "To camelCase",
        },
        p = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t pascal-case') <cr>",
            "To PascalCase",
        },
        t = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t title') <cr>",
            "To Title",
        },
        w = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t word') <cr>",
            "To Word",
        },
        T = {
            "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t text') <cr>",
            "To text",
        },
    }, { mode = "v", desc = "Reformat", prefix = "<leader>r" })
end
