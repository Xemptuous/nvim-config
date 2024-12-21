return {
    {
        "nvim-telescope/telescope.nvim",
        enabled = true,
        cmd = "Telescope",
        -- keys = "<leader>",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                -- build = "make",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                config = function() require("telescope").load_extension("fzf") end,
            },
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
            pickers = {
                buffers = { theme = "ivy" },
                colorscheme = { theme = "ivy" },
                commands = { theme = "ivy" },
                find_files = { theme = "ivy" },
                grep_string = { theme = "ivy" },
                help_tags = { theme = "ivy" },
                keymaps = { theme = "ivy" },
                live_grep = { theme = "ivy" },
                man_pages = { theme = "ivy" },
                oldfiles = { theme = "ivy" },
                registers = { theme = "ivy" },
                search_history = { theme = "ivy" },
                vim_options = { theme = "ivy" },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            local k = vim.keymap.set
            local builtin = require("telescope.builtin")
            k("n", "<leader>to", builtin.vim_options, { desc = "Vim Options" })
            k("n", "<leader>tf", builtin.find_files, { desc = "Find File" })
            k("n", "<leader>f", builtin.find_files, { desc = "Find File" })
            k("n", "<leader>tg", builtin.live_grep, { desc = "Grep" })
            k("n", "<leader>G", builtin.live_grep, { desc = "Grep" })
            k("n", "<leader>tb", builtin.buffers, { desc = "Buffers" })
            k("n", "<leader>b", builtin.buffers, { desc = "Buffers" })
            k("n", "<leader>th", builtin.help_tags, { desc = "Help" })
            k("n", "<leader>h", builtin.help_tags, { desc = "Help" })
            k("n", "<leader>tm", builtin.man_pages, { desc = "Man Pages" })
            k("n", "<leader>tk", builtin.keymaps, { desc = "Keymaps" })
            k("n", "<leader>k", builtin.keymaps, { desc = "Keymaps" })
            k("n", "<leader>tR", builtin.oldfiles, { desc = "Old Files" })
            k("n", "<leader>tw", builtin.grep_string, { desc = "Grep String" })
            k("n", "<leader>w", builtin.grep_string, { desc = "Grep String" })
            k("n", "<leader>tH", builtin.search_history, { desc = "Search History" })
            k("n", "<leader>tC", builtin.colorscheme, { desc = "Colorscheme" })
            k("n", "<leader>tc", builtin.commands, { desc = "Commands" })
            k("n", "<leader>tr", builtin.registers, { desc = "Registers" })
            k("n", "<leader>tM", builtin.marks, { desc = "Marks" })
            k("n", "<leader>tn", "<cmd>Telescope nerdy<cr>", { desc = "Nerd Icons" })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = false,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
}
