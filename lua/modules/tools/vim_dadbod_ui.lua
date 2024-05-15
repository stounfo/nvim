local my_commands = {
    toggle_dabbodui = "<cmd>DBUIToggle<cr>",
}

return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod" },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_auto_execute_table_helpers = 1
        vim.g.db_ui_show_database_icon = 1
    end,
    my_commands = my_commands,
}
