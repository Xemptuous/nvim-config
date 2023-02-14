require('telescope').setup {
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous"
        },
        n = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous"
        },
      },
    },
  },
}
