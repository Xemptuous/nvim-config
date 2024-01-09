return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		-- event = "VeryLazy",
		-- cmd = "Telescope",
		keys = "<leader>t",
		dependencies = "nvim-lua/plenary.nvim",
        opts = {
            pickers = {
                find_files = {
                    -- theme = "dropdown",
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                        n = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                },
                -- help_tags = {
                --     theme = "dropdown",
                -- },
                -- live_grep = {
                --     theme = "dropdown",
                -- },
                -- buffers = {
                --     theme = "dropdown",
                -- },
            },
        },
		config = function(_, opts)
            require("telescope").setup(opts)
            local k = vim.keymap.set
            local builtin = require("telescope.builtin")
            k("n", "<leader>tf", builtin.find_files)
            k("n", "<leader>tg", builtin.live_grep, {})
            k("n", "<leader>tb", builtin.buffers, {})
            k("n", "<leader>th", builtin.help_tags, {})
            k("n", "<leader>tR", builtin.oldfiles, {})
            k("n", "<leader>tw", builtin.grep_string, {})
            k("n", "<leader>tH", builtin.search_history, {})
            k("n", "<leader>tC", builtin.command_history, {})
            k("n", "<leader>tc", builtin.colorscheme, {})
            k("n", "<leader>tr", builtin.registers, {})
            k("n", "<leader>m", [[:lua require'telescope.builtin'.marks{}<CR>]])
		end,
	},
}
