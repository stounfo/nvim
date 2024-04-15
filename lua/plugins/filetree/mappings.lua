return {
    ["<C-s>"] = "open_split",
    ["<C-v>"] = "open_vsplit",
    ["P"] = {
        "toggle_preview",
        config = { use_float = true, use_image_nvim = false },
    },
}
