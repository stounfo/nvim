local my_commands = {
    toggle_copilot = function()
        for _, c in ipairs(vim.lsp.get_active_clients()) do
            if c.name == "copilot" then
                vim.cmd("Copilot disable")
                return
            end
        end
        vim.cmd("Copilot enable")
    end,

    panel = function()
        require("copilot.panel").open()
    end,
}

local mappings = {
    accept = "<C-l>",
    accept_word = "<C-h>w",
    accept_line = "<C-h>l",
    next = "<C-j>",
    prev = "<C-k>",
    dismiss = false,
}

local options = function()
    return {
        suggestion = {
            auto_trigger = true,
            keymap = mappings,
        },
        filetypes = {
            yaml = true,
            markdown = true,
            help = true,
            gitcommit = true,
            gitrebase = true,
            hgcommit = true,
            svn = true,
            cvs = true,
            ["."] = true,
        },
    }
end

return {
    "stounfo/copilot.lua",
    cmd = "Copilot",
    event = { "BufReadPre", "BufNewFile" },
    build = ":Copilot auth",
    opts = options,
    config = function(_, opts)
        require("copilot").setup(opts)
    end,
    my_commands = my_commands,
}
