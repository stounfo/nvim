local color = require("colors").dark_foreground

return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        local devicons = require("nvim-web-devicons")
        local colorized_icons = {}
        for key, value in pairs(devicons.get_icons()) do
            value.cterm_color = tostring(color)
            table.insert(colorized_icons, { key, value })
        end
        devicons.setup({
            override = colorized_icons,
        })
    end,
}
