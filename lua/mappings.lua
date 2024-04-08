-- TODO maybe split the file between plugins dirs
local search_commands = require("plugins.search.commands")
local filetree_commands = require("plugins.filetree.commands")
local comment_commands = require("plugins.other.comment.commands")
local gitsigns_commans = require("plugins.git.commands")

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

M.filetree = {
  {
    "<C-n>",
    filetree_commands.toggle_tree,
    mode = "n",
    desc = "Toggle tree",
  },
  {
    "<leader>e",
    filetree_commands.focus_tree,
    mode = "n",
    desc = "Focus tree",
  },
}

M.comment = {
  {
    "<leader>/",
    comment_commands.toogle_comment,
    mode = "n",
    desc = "Toggle comment",
  },
  {
    "<leader>/",
    comment_commands.toogle_comment_visual,
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

M.search = {
  -- find
  {
    "<leader>ff",
    search_commands.find_files,
    mode = "n",
    desc = "Find files",
  },
  {
    "<leader>fF",
    search_commands.find_files_all,
    mode = "n",
    desc = "Find files all",
  },
  {
    "<leader>fw",
    search_commands.live_grep,
    mode = "n",
    desc = "Live grep",
  },
  {
    "<leader>fW",
    search_commands.live_grep_args,
    mode = "n",
    desc = "Live grep (Args)",
  },
  {
    "<leader>fb",
    search_commands.buffers,
    mode = "n",
    desc = "Find buffers",
  },
  {
    "<leader>fh",
    search_commands.help_tags,
    mode = "n",
    desc = "Help tags",
  },
  {
    "<leader>fo",
    search_commands.oldfiles,
    mode = "n",
    desc = "Find oldfiles",
  },
  {
    "<leader>fz",
    search_commands.current_buffer_fuzzy_find,
    mode = "n",
    desc = "Find in current buffer",
  },

  -- git
  {
    "<leader>gc",
    search_commands.git_commits,
    mode = "n",
    desc = "Git commits",
  },
  {
    "<leader>gs",
    search_commands.git_status,
    mode = "n",
    desc = "Git status",
  },
  {
    "<leader>gb",
    search_commands.git_branches,
    mode = "n",
    desc = "Git branches",
  },

  -- marks
  {
    "<leader>ma",
    search_commands.marks,
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
    "<leader>d",
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

M.conform = {
  {
    "<leader>fm",
    function()
      require("conform").format()
    end,
    mode = "n",
    desc = "Formatting",
  },
}

M.aerial = {
  {
    "<leader>mm",
    "<cmd>AerialToggle left<cr>",
    mode = "n",
    desc = "Toggle aerial",
  },
}

M.gisigns = {
  {
    "<leader>ghb",
    gitsigns_commans.blame_line,
    mode = "n",
    desc = "Blame line",
  },
  {
    "<leader>ghp",
    gitsigns_commans.preview_hunk,
    mode = "n",
    desc = "Preview hunk",
  },
  {
    "<leader>ghr",
    gitsigns_commans.reset_hunk,
    mode = "n",
    desc = "Reset hunk",
  },
  {
    "<leader>ghR",
    gitsigns_commans.reset_buffer,
    mode = "n",
    desc = "Reset buffer",
  },
  {
    "<leader>ghj",
    gitsigns_commans.next_hunk,
    mode = "n",
    desc = "Next hunk",
  },
  {
    "<leader>ghk",
    gitsigns_commans.prev_hunk,
    mode = "n",
    desc = "Prev hunk",
  },
}

return M
