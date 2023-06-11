local opts = {
  close_if_last_window = true,
  enable_diagnostics = false,
  hide_root_node = true,
  window = {
    position = "left",
    width = 30,
    mappings = {
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
    },
  },
  default_component_configs = {
    indent = {
      last_indent_marker = "│",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
    },
    modified = {
      symbol = "",
    },
    git_status = {
      symbols = {
        -- Change type
        added = "",    -- this is redundant info if you use git_status_colors on the name
        modified = "", -- this is redundant info if you use git_status_colors on the name
        deleted = "",  -- this can only be used in the git_status source
        renamed = "",  -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        ".DS_Store",
        ".git",

        "__pycache__",
        "venv"
      },
    },
    follow_current_file = false,
    use_libuv_file_watcher = true,
  },
}

return {
  cmd = "Neotree",
  keys = require("mappings").neotree,
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    require("plugins.plenary"),
    require("plugins.nvimwebdevicons"),
    require("plugins.nui"),
  },
  opts = opts,
  config = true,
}
