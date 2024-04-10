local M = {}

M.toggle_copilot = function()
  for _, c in ipairs(vim.lsp.get_active_clients()) do
    if c.name == "copilot" then
      vim.cmd("Copilot disable")
      return
    end
  end
  vim.cmd("Copilot enable")
end

M.panel = function()
  require("copilot.panel").open()
end

return M
