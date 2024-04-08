return function()
  local settings = require("settings")
  return {
    close_if_last_window = true,
    enable_diagnostics = false,
    hide_root_node = true,
    window = {
      position = "float",
      popup = {
        size = { height = "80%", width = "40%" },
        position = "50%", -- 50% means center it
      },
      mappings = {
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["P"] = {
          "toggle_preview",
          config = { use_float = true, use_image_nvim = false },
        },
      },
    },
    default_component_configs = {
      indent = {
        last_indent_marker = "│",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "◇",
      },
      modified = {
        symbol = "",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "",
          modified = "",
          deleted = "",
          renamed = "",
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
      file_size = {
        enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
      created = {
        enabled = false,
        required_width = 40,
      },
      symlink_target = {
        enabled = false,
      },
    },
    filesystem = {
      filtered_items = {
        show_hidden_count = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_pattern = settings.hide_by_pattern,
      },
      follow_current_file = {
        enabled = false,
      },
      use_libuv_file_watcher = true,
    },
  }
end
