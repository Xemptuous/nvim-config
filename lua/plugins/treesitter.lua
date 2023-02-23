require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "html",
    "htmldjango",
    "javascript",
    "json",
    "json5",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "vim"
  },
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
    disable = {"python"}
	},
	-- autotag = {
	-- 	enable = true
	-- },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- rainbow = {
	-- 	enable = false,
	-- 	extended_mode = false,
	-- 	max_file_lines = nil,
	-- 	-- colors = {
	-- 	-- 	'#adadad',
	-- 	-- 	'#f0c837',
	-- 	-- 	'#bb60f7',
	-- 	-- 	'#359ff4',
	-- 	-- 	'#ff4f4f',
	-- 	-- 	'#359ff4',
	-- 	-- 	'#bb60f7'
	-- 	-- }
	-- },
	-- playground = {
	-- 	enable = false,
	-- 	disable = {},
	-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	-- 	persist_queries = false, -- Whether the query persists across vim sessions
	-- 	keybindings = {
	-- 		toggle_query_editor = 'o',
	-- 		toggle_hl_groups = 'i',
	-- 		toggle_injected_languages = 't',
	-- 		toggle_anonymous_nodes = 'a',
	-- 		toggle_language_display = 'I',
	-- 		focus_language = 'f',
	-- 		unfocus_language = 'F',
	-- 		update = 'R',
	-- 		goto_node = '<cr>',
	-- 		show_help = '?',
	-- 	},
	-- }
}
