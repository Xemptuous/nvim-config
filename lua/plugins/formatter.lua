-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local util = require("formatter.util")
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		c = {
			-- require("formatter.filetypes.cpp").clangformat
			function()
				return {
					exe = "clang-format",
					args = {
						-- '--style="{BasedOnStyle: Google, IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left}"',
						'--style="{IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left}"',
						-- "-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
				}
			end,
		},
		cpp = {
			-- require("formatter.filetypes.cpp").clangformat
			function()
				return {
					exe = "clang-format",
					args = {
						-- '--style="{BasedOnStyle: Google, IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left}"',
						'--style="{IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left, IndentCaseBlocks: true, IndentCaseLabels: true, ColumnLimit: 100}"',
						-- "-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
				}
			end,
		},
		json = { require("formatter.filetypes.json").jq },
		lua = { require("formatter.filetypes.lua").stylua },
		python = { require("formatter.filetypes.python").black },
		sh = { require("formatter.filetypes.sh").shfmt },
		sql = { require("formatter.filetypes.sql").sql_formatter },
		rust = { require("formatter.filetypes.rust").rustfmt },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
