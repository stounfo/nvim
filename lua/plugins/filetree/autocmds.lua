-- Start neotree if opens a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
    if stats and stats.type == "directory" then
      require("neo-tree.setup.netrw").hijack()
    end
  end,
})
