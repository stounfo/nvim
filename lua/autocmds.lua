-- Start neotree if opens a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not directory or no_name then
      return
    end
    if directory then
      -- change to the directory
      vim.cmd.cd(data.file)
    end
    -- open the tree
    vim.cmd("Neotree")
  end,
})

-- switch to absolute line numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    if require("utils").numbercolumn_enabled() then
      vim.opt.relativenumber = false
      vim.opt.cursorline = false
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    if require("utils").numbercolumn_enabled() then
      vim.opt.relativenumber = true
      vim.opt.cursorline = true
    end
  end,
})
