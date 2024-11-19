return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		lazy = true,
		cmd = "Telescope",
		keys = "<leader>t",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- build = "make",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
				config = function()
					require("telescope").load_extension("fzf")
				end,
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
			pickers = {},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			local k = vim.keymap.set
			local builtin = require("telescope.builtin")
			k("n", "<leader>to", builtin.vim_options, { desc = "Vim Options" })
			k("n", "<leader>tf", builtin.find_files, { desc = "Find File" })
			k("n", "<leader>tg", builtin.live_grep, { desc = "Grep" })
			k("n", "<leader>tb", builtin.buffers, { desc = "Buffers" })
			k("n", "<leader>th", builtin.help_tags, { desc = "Help" })
			k("n", "<leader>tm", builtin.man_pages, { desc = "Man Pages" })
			k("n", "<leader>tk", builtin.keymaps, { desc = "Keymaps" })
			k("n", "<leader>tR", builtin.oldfiles, { desc = "Old Files" })
			k("n", "<leader>tw", builtin.grep_string, { desc = "Grep String" })
			k("n", "<leader>tH", builtin.search_history, { desc = "Search History" })
			k("n", "<leader>tC", builtin.colorscheme, { desc = "Colorscheme" })
			k("n", "<leader>tc", builtin.commands, { desc = "Commands" })
			k("n", "<leader>tr", builtin.registers, { desc = "Registers" })
			k("n", "<leader>tM", [[:lua require'telescope.builtin'.marks{}<CR>]], { desc = "Marks" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		enabled = false,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
