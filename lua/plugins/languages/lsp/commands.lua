local M = {}

M.declaration = function()
  vim.lsp.buf.declaration()
end

M.hover = function()
  vim.lsp.buf.hover()
end

M.line_diagnostic = function()
  vim.diagnostic.open_float({ border = "rounded" })
end

M.code_action = function()
  vim.lsp.buf.code_action()
end

M.rename = function()
  vim.lsp.buf.rename()
end

return M
