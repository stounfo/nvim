return {
  {
    'romgrk/barbar.nvim',
    opts = {
      sidebar_filetypes = {
        ['neo-tree'] = { event = 'BufWipeout' },
      },
      icons = {
        buffer_index = true,
        separator = {left = "│", right = "│"},
      },
    },
    config = true,
  },
}
