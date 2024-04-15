local consts = require("ui.consts")

for type, icon in pairs(consts.diagnostic_signs) do
    local hl = "DiagnosticSign" .. type:sub(1, 1):upper() .. type:sub(2)
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("ui.colorscheme")
