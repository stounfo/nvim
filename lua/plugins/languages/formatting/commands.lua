local M = {}

M.format = function()
  require("conform").format()
end

M.format_all = function()
  require("conform").format_all()
end

return M
