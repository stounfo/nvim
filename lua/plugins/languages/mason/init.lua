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

    -- custom cmd to install all mason binaries listed
    -- TODO remove from config
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end, {})
  end,
}

