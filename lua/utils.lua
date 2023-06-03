local M = {}

M.load_mappings = function(mappings)
  for _, v in pairs(mappings) do
    vim.keymap.set(v.mode, v[1], v[2], { desc = v.desc})
  end
end

return M
