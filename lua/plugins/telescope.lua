require('telescope').setup {
  pickers = {
    find_files = {
      theme = "dropdown",
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
