local M = {}

M.general = {
  -- Windows
  { "<C-h>", "<C-w>h", mode = "n", desc = "Window left" },
  { "<C-l>", "<C-w>l", mode = "n", desc = "Window right" },
  { "<C-j>", "<C-w>j", mode = "n", desc = "Window down" },
  { "<C-k>", "<C-w>k", mode = "n", desc = "Window up" },
  -- Tabs # TODO - it rewrite "Jump to tag"
  { "<C-]>", "<cmd>tabnext<cr>", mode = "n", desc = "Next Tab" },
  { "<C-[>", "<cmd>tabprevious<cr>", mode = "n", desc = "Next Tab" },
}

require("utils").load_mappings(M.general)

M.neotree = {
  {
    "<C-n>",
    "<cmd>Neotree toggle left<cr>",
    mode = "n",
    desc = "Toggle tree",
  },
  {
    "<leader>e",
    "<cmd>Neotree reveal left<cr>",
    mode = "n",
    desc = "Focus tree",
  },
}

M.comment = {
  {
    "<leader>/",
    function()
      require("Comment.api").toggle.linewise.current()
    end,
    mode = "n",
    desc = "Toggle comment",
  },
  {
    "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    mode = "v",
    desc = "Toggle comment",
  },

  -- defaults
  { "gcc", mode = "n" },
  { "gbc", mode = "n" },
  { "gc", mode = "v" },
  { "gb", mode = "v" },
  { "[count]gcc", mode = "n" },
  { "[count]gbc", mode = "n" },
  { "gc[count]{motion}", mode = "n" },
  { "gb[count]{motion}", mode = "n" },
}

M.telescope = {
  -- find
  {
    "<leader>ff",
    "<cmd> Telescope find_files <CR>",
    mode = "n",
    desc = "Find files",
  },
  {
    "<leader>fa",
    "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
    mode = "n",
    desc = "Find all",
  },
  {
    "<leader>fw",
    "<cmd> Telescope live_grep <CR>",
    mode = "n",
    desc = "Live grep",
  },
  {
    "<leader>fb",
    "<cmd> Telescope buffers <CR>",
    mode = "n",
    desc = "Find buffers",
  },
  {
    "<leader>fh",
    "<cmd> Telescope help_tags <CR>",
    mode = "n",
    desc = "Help page",
  },
  {
    "<leader>fo",
    "<cmd> Telescope oldfiles <CR>",
    mode = "n",
    desc = "Find oldfiles",
  },
  {
    "<leader>fz",
    "<cmd> Telescope current_buffer_fuzzy_find <CR>",
    mode = "n",
    desc = "Find in current buffer",
  },

  -- git
  {
    "<leader>gc",
    "<cmd> Telescope git_commits <CR>",
    mode = "n",
    desc = "Git commits",
  },
  {
    "<leader>gs",
    "<cmd> Telescope git_status <CR>",
    mode = "n",
    desc = "Git status",
  },
  {
    "<leader>gb",
    "<cmd> Telescope git_branches<CR>",
    mode = "n",
    desc = "Git branches",
  },

  -- marks
  {
    "<leader>ma",
    "<cmd> Telescope marks <CR>",
    mode = "n",
    desc = "Telescope bookmarks",
  },
}

M.lspconfig = {
  {
    "gD",
    vim.lsp.buf.declaration,
    mode = "n",
    desc = "LSP declaration",
  },

  {
    "gd",
    function()
      require("telescope.builtin").lsp_definitions({ show_line = false })
    end,
    mode = "n",
    desc = "LSP definition",
  },

  {
    "gr",
    function()
      require("telescope.builtin").lsp_references({ show_line = false })
    end,
    mode = "n",
    desc = "LSP references",
  },
  {
    "<leader>D",
    function()
      require("telescope.builtin").lsp_type_definitions({ show_line = false })
    end,
    mode = "n",
    desc = "LSP definition type",
  },
  {
    "<leader>q",
    function()
      require("telescope.builtin").diagnostics({
        bufnr = 0,
        path_display = "hidden",
        wrap_results = true,
      })
    end,
    mode = "n",
    desc = "Diagnostic setloclist",
  },
  {
    "<leader>f",
    function()
      vim.diagnostic.open_float({ border = "rounded" })
    end,
    mode = "n",
    desc = "Floating diagnostic",
  },
  {
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    mode = "n",
    desc = "LSP code action",
  },
  {
    "K",
    function()
      vim.lsp.buf.hover()
    end,
    mode = "n",
    desc = "LSP hover",
  },
  {
    "<leader>ra",
    function()
      vim.lsp.buf.rename()
    end,
    mode = "n",
    desc = "LSP rename",
  },
}

M.nullls = {
  {
    "<leader>fm",
    function()
      vim.lsp.buf.format({ async = true })
    end,
    mode = "n",
    desc = "LSP formatting",
  },
}

return M
