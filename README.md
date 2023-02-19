# Personal NeoVim Config

This is my personal nvim config that's always being updated.

The main folder structure is:
```
~/.config/nvim/
├── init.lua  # main neovim init
└── lua/
    ├── init.lua  # main plugin manager loader (lazy.nvim)
    ├── options.lua  # various global options
    ├── theme.lua  # color scheme configs
    ├── keymaps/
    │   ├── init.lua  # main keymaps
    │   └── ...  # various individual keymaps
    └── plugins/
        └── ...  # individual plugin setups
```
