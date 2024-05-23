local my_commands = {
    open_repo = function()
        local url = ""
        vim.ui.input({ prompt = "Enter repo: " }, function(input)
            url = input
        end)
        require("git-dev").open(url)
    end,
}

return {
    "moyiz/git-dev.nvim",
    cmd = { "GitDevOpen", "GitDevCleanAll" },
    opts = {},
    my_commands = my_commands,
}
