return function()
  local utils = require("utils")
  local result = {}
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.lua").mason_to_install
  )
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.python").mason_to_install
  )
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.rust").mason_to_install
  )
  result = utils.merge_arrays(
    result,
    require("plugins.languages.configs.typescript").mason_to_install
  )
  return { ensure_installed = result }
end
