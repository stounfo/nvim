local M = {}

M.format = function()
    require("conform").format({ async = true })
end

return M
