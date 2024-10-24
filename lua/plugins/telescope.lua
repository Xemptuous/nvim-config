return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = false,
		lazy = true,
		cmd = "Telescope",
		keys = "<leader>t",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
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
			ts = require("telescope")
			ts.setup(opts)
			local k = vim.keymap.set
			local builtin = require("telescope.builtin")
			k("n", "<leader>to", builtin.vim_options, {})
			k("n", "<leader>tf", builtin.find_files, {})
			k("n", "<leader>tg", builtin.live_grep, {})
			k("n", "<leader>tb", builtin.buffers, {})
			k("n", "<leader>th", builtin.help_tags, {})
			k("n", "<leader>tm", builtin.man_pages, {})
			k("n", "<leader>tk", builtin.keymaps, {})
			k("n", "<leader>tR", builtin.oldfiles, {})
			k("n", "<leader>tw", builtin.grep_string, {})
			k("n", "<leader>tH", builtin.search_history, {})
			k("n", "<leader>tC", builtin.command_history, {})
			k("n", "<leader>tc", builtin.commands, {})
			k("n", "<leader>tr", builtin.registers, {})
			k("n", "<leader>m", [[:lua require'telescope.builtin'.marks{}<CR>]])
			ts.load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		enabled = false,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
