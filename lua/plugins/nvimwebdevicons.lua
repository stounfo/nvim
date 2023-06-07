return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local devicons = require("nvim-web-devicons")

    for _, icon in pairs(devicons.get_icons()) do
      -- TODO remove hardcode
      icon.color = "#928374"
    end

    devicons.setup()
  end,
}
