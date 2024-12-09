local my_commands = {
    toggle_chat = function()
        require("CopilotChat").toggle()
    end,
    explain = "<cmd>CopilotChatExplain<cr>",
    review = "<cmd>CopilotChatReview<cr>",
    fix = "<cmd>CopilotChatFix<cr>",
    optimize = "<cmd>CopilotChatOptimize<cr>",
    docs = "<cmd>CopilotChatDocs<cr>",
    tests = "<cmd>CopilotChatTests<cr>",
    diagnostic = "<cmd>CopilotChatFixDiagnostic<cr>",
    commit = "<cmd>CopilotChatCommit<cr>",
}

local options = function()
    return {
        log_level = "warn",
        window = {
            layout = "float",
            height = 0.8,
            width = 0.5,
            border = "rounded",
            row = 3,
        },
        mappings = {
            close = {
                normal = "<Esc>",
            },
        },
    }
end

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
        require("modules.dependencies.plenary"),
        require("modules.editor.completion.copilot"),
    },
    cmd = {
        "CopilotChat",
        "CopilotChatExplain",
        "CopilotChatReview",
        "CopilotChatFix",
        "CopilotChatOptimize",
        "CopilotChatDocs",
        "CopilotChatTests",
        "CopilotChatFixDiagnostic",
        "CopilotChatCommit",
        "CopilotChatCommitStaged",
    },
    build = "make tiktoken",
    opts = options,
    my_commands = my_commands,
}
