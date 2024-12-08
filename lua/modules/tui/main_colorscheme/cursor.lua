local colors = require("colors")

local colorscheme = {
    Cursor = {
        ctermbg = colors.yellow,
    },
    -- SignColumn = {
    --     ctermbg = colors.debug,
    -- },
    -- Huita = {
    --     ctermbg = colors.blue,
    -- },
    -- LineNr = {
    --     ctermbg = colors.green,
    -- },
}
require("utils").set_hl(colorscheme)

return {}
