local M = {}

M.buffers = {
    i = {
      ["<C-d>"] = "delete_buffer",
    },
    n = {
      ["<C-d>"] = "delete_buffer",
    }
}

M.general = {
  i = {
    ["<C-s>"] = "select_horizontal",
    ["<C-v>"] = "select_vertical",
  },
  n = {
    ["<C-s>"] = "select_horizontal",
    ["<C-v>"] = "select_vertical",
    ["]h"] = require("telescope.actions").cycle_history_next,
    ["[h"] = require("telescope.actions").cycle_history_prev,
    ["<C-n>"] = require("telescope.actions").move_selection_next,
    ["<C-p>"] = require("telescope.actions").move_selection_previous,
  },
}

return M
