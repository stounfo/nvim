local my_commands = {
    toggle_blame = "<cmd> BlameToggle <cr>",
}

local options = function()
    return {
        date_format = "%d %b %Y",
    }
end

return {
    "FabijanZulj/blame.nvim",
    cmd = {
        "BlameToggle",
    },
    opts = options,
    config = true,
    my_commands = my_commands,
}
