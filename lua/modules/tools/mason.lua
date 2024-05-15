local options = function()
    local utils = require("utils")
    local ensure_installed = {}
    for _, opts in pairs(require("languages")) do
        if opts.mason_to_install then
            ensure_installed =
                utils.merge_arrays(ensure_installed, opts.mason_to_install)
        end
    end
    return { ensure_installed = ensure_installed }
end

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
    opts = options,
    config = function(_, opts)
        local _ = {
            -- Cmd to install all mason binaries listed
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                local to_install = ""
                for _, opts in pairs(require("languages")) do
                    if opts.mason_to_install then
                        to_install = to_install
                            .. " "
                            .. table.concat(opts.mason_to_install, " ")
                    end
                end
                vim.cmd("MasonInstall " .. to_install)
            end, {}),
        }
        require("mason").setup(opts)
    end,
}
