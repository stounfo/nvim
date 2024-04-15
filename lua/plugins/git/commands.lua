local M = {}

M.blame_line = function()
    require("gitsigns").blame_line()
end

M.preview_hunk = function()
    require("gitsigns").preview_hunk()
end

M.reset_hunk = function()
    require("gitsigns").reset_hunk()
end

M.reset_buffer = function()
    require("gitsigns").reset_buffer()
end

M.next_hunk = function()
    require("gitsigns").next_hunk()
end

M.prev_hunk = function()
    require("gitsigns").prev_hunk()
end

return M
