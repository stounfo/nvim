local opts = {
  ensure_installed = {
    "lua-language-server",
    "pyright",
    "rust-analyzer",
    "black",
    "stylua",
    "prettier",
    "rustfmt",
  },
}

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
  opts = opts,
  config = function(_, opts)
    require("mason").setup(opts)

    -- custom cmd to install all mason binaries listed
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end, {})
  end,
}
