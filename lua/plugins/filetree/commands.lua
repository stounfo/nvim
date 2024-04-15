local M = {}

M.toggle_tree = function()
    require("neo-tree.command").execute({ toggle = true, position = "float" })
end

M.focus_tree = function()
    require("neo-tree.command").execute({ reveal = true, position = "float" })
end

return M
