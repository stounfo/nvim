return function()
    return {
        defaults = {
            layout_config = {
                vertical = {
                    prompt_position = "top",
                    height = 0.9,
                    width = 0.8,
                    mirror = true,
                    preview_cutoff = 30,
                },
            },
            layout_strategy = "vertical",
            sorting_strategy = "ascending",
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--no-ignore",
            },
            dynamic_preview_title = true,
            mappings = require("plugins.search.mappings").general,
        },
        pickers = {
            buffers = require("plugins.search.pickers.buffers"),
            live_grep = require("plugins.search.pickers.live_grep"),
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
            live_grep_args = require("utils").merge_tables({
                auto_quoting = false,
            }, require("plugins.search.pickers.live_grep")),
        },
    }
end
