return function()
  return {
    suggestion = {
      auto_trigger = true,
      keymap = require("plugins.autocompletion.copilot.mappings"),
    },
    filetypes = {
      yaml = true,
      markdown = true,
      help = true,
      gitcommit = true,
      gitrebase = true,
      hgcommit = true,
      svn = true,
      cvs = true,
      ["."] = true,
    },
  }
end
