require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "<C-[>", action = "dir_up" },
        { key = "<C-s>", action = "split" },
      },
    },
  },
})

