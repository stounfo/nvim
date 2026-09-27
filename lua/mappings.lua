return function()
    local telescope_commands = require("modules.telescope").my_commands
    local neo_tree_commands = require("modules.neo_tree").my_commands
    local gitsigns_commands = require("modules.gitsigns").my_commands
    local conform_commands = require("modules.conform").my_commands
    local lspconfig_commands = require("modules.lspconfig").my_commands
    local zoom_commands = require("modules.zoom_window").my_commands
    local snacks = require("modules.snacks").my_commands
    local render_markdown =
        require("modules.render_markdown").my_commands

    local wk = require("which-key")

    -- general
    wk.add({
        {
            "<leader>d",
            lspconfig_commands.line_diagnostic,
            desc = "Line diagnostic",
        },
        {
            "<leader>D",
            telescope_commands.current_buff_diagnostic,
            desc = "Current buff diagnostic",
        },
        { "Y", '"+y', mode = { "v" }, desc = "Copy to clipboard" },
        { "<leader>w", "<cmd>w<cr><esc>", mode = { "n" }, desc = "Save file" },
        { "<leader>Q", "<cmd>qa<cr>", mode = { "n" }, desc = "Quit nvim" },
        { "<leader>q", "<cmd>q<cr>", mode = { "n" }, desc = "Quit buffer" },
        { "}", "}zz", desc = "Next paragraph" },
        { "{", "{zz", desc = "Previous paragraph" },
        { "n", "nzz", desc = "Next search" },
        { "N", "Nzz", desc = "Previous search" },
    })

    -- window
    wk.add({
        { "<C-h>", "<C-w>h", desc = "Window left" },
        { "<C-l>", "<C-w>l", desc = "Window right" },
        { "<C-j>", "<C-w>j", desc = "Window down" },
        { "<C-k>", "<C-w>k", desc = "Window up" },
        { "<C-w>z", zoom_commands.toggle_zoom, desc = "Toggle zoom" },
    })

    -- next
    wk.add({
        { "]b", "<C-^>", desc = "Next buffer" },
        { "]h", gitsigns_commands.next_hunk, desc = "Next hunk" },
    })

    -- previous
    wk.add({
        { "[b", "<C-^>", desc = "Previous buffer" },
        { "[h", gitsigns_commands.prev_hunk, desc = "Previous hunk" },
    })

    -- go to
    wk.add({
        { "g", group = "Go to" },
        { "gD", lspconfig_commands.declaration, desc = "Declaration" },
        { "gd", telescope_commands.lsp_definitions, desc = "Definition" },
        {
            "gt",
            telescope_commands.lsp_type_definitions,
            desc = "Type definition",
        },
        { "gr", telescope_commands.lsp_references, desc = "References" },
    })

    -- filetree
    wk.add({
        {
            "<C-f>",
            neo_tree_commands.toggle_tree,
            mode = { "n", "i" },
            desc = "Toggle tree",
        },
        { "<leader>e", neo_tree_commands.focus_tree, desc = "Focus tree" },
    })

    -- search
    wk.add({
        { "<leader>f", group = "Search" },
        -- files
        { "<leader>ff", telescope_commands.find_files, desc = "Find files" },
        {
            "<leader>fF",
            telescope_commands.find_files_all,
            desc = "Find files all",
        },
        { "<leader>fw", telescope_commands.live_grep, desc = "Live grep" },
        {
            "<leader>fW",
            telescope_commands.live_grep_args,
            desc = "Live grep (Args)",
        },
        { "<leader>fo", telescope_commands.oldfiles, desc = "Find oldfiles" }, -- spellchecker:disable-line
        {
            "<leader>fO",
            telescope_commands.oldfiles_all,
            desc = "Find oldfiles all",
        },
        -- vim
        {
            "<leader>fz",
            telescope_commands.current_buffer_fuzzy_find,
            desc = "Find in current buffer",
        },
        { "<leader>fb", telescope_commands.buffers, desc = "Find buffers" },
        { "<leader>ft", telescope_commands.help_tags, desc = "Help tags" },
        { "<leader>fm", telescope_commands.marks, desc = "Bookmarks" },
        { "<leader>fk", telescope_commands.keymaps, desc = "Keymaps" },
        { "<leader>fh", telescope_commands.highlights, desc = "Highlights" },
    })

    -- vsc
    wk.add({
        { "<leader>g", group = "vsc" },
        { "<leader>gc", telescope_commands.git_commits, desc = "Commits" },
        { "<leader>gs", telescope_commands.git_status, desc = "Status" },
        { "<leader>gb", telescope_commands.git_branches, desc = "Branches" },
        { "<leader>gl", gitsigns_commands.blame_line, desc = "Blame line" },
        {
            "<leader>gr",
            gitsigns_commands.reset_buffer,
            desc = "Reset buffer",
        },
        { "<leader>gh", group = "Hunk" },
        {
            "<leader>ghp",
            gitsigns_commands.preview_hunk,
            desc = "Preview hunk",
        },
        { "<leader>ghr", gitsigns_commands.reset_hunk, desc = "Reset hunk" },
        {
            "<leader>gY",
            snacks.git_link,
            mode = { "n", "v" },
            desc = "Create link and open",
        },
    })

    -- refactoring
    local txc_table = {}
    for _, mapping in ipairs({
        { key = "t", command = "title", desc = "To Title Case" },
        { key = "l", command = "single-line", desc = "To one line" },
        { key = "c", command = "camel-case", desc = "To camelCase" },
        { key = "p", command = "pascal-case", desc = "To PascalCase" },
        { key = "s", command = "snake-case", desc = "To snake_case" },
        { key = "k", command = "kebab-case", desc = "To kebab-case" },
    }) do
        table.insert(txc_table, {
            "<leader>rc" .. mapping.key,
            string.format(
                "<cmd> lua require('utils').replace_visual_selection_with_command('txc -t %s') <cr><esc>",
                mapping.command
            ),
            desc = mapping.desc,
            mode = { "v" },
        })
    end
    wk.add(vim.list_extend({
        { "<leader>r", group = "Refactoring" },
        { "<leader>rr", lspconfig_commands.rename, desc = "Rename" },
        { "<leader>rf", conform_commands.format, desc = "Formatting" },
        {
            "<leader>ra",
            lspconfig_commands.code_action,
            desc = "Code action",
        },
        { "<leader>rc", group = "Convert text" },
    }, txc_table))

    -- view mode
    wk.add({
        { "<leader>v", group = "View mode" },
        {
            "<leader>vm",
            render_markdown.toggle_render_markdown,
            desc = "Toggle render markdown",
        },
    })
end
