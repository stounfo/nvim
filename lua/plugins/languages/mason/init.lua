return {
    "williamboman/mason.nvim",
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonInstallAll",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
    },
    build = ":MasonUpdate",
    opts = require("plugins.languages.mason.opts"),
    config = function(_, opts)
        require("mason").setup(opts)
        require("plugins.languages.mason.autocmds")
    end,
}
