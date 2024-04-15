-- Cmd to install all mason binaries listed
vim.api.nvim_create_user_command("MasonInstallAll", function()
    local opts = require("plugins.languages.mason.opts")()
    vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
end, {})
