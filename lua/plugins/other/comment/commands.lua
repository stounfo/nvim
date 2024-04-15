local M = {}

M.toogle_comment = function()
    require("Comment.api").toggle.linewise.current()
end

M.toogle_comment_visual =
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"

return M
