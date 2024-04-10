return function()
  local utils = require("utils")
  local result = {}
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.lua").treesitter_to_install
  )
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.python").treesitter_to_install
  )
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.rust").treesitter_to_install
  )
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.typescript").treesitter_to_install
  )
  result = utils.merge_arrays(result, { "html", "json", "vimdoc", "yaml" })

  return {
    ensure_installed = result,
    highlight = { enable = true },
  }
end
