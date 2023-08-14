-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local util = require("formatter.util")
require("formatter").setup({
	logging = false,
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		c = {
			-- require("formatter.filetypes.cpp").clangformat
			function()
				return {
					exe = "clang-format",
					args = {
						'--style="{IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left, IndentCaseBlocks: false, IndentCaseLabels: true, ColumnLimit: 100, IncludeBlocks: Regroup, AllowShortIfStatementsOnASingleLine: AllIfsAndElse, AllowShortCaseLabelsOnASingleLine: true, BreakBeforeBraces: Attach, AllowAllParametersOfDeclarationOnNextLine: true, AllowShortEnumsOnASingleLine: true, AlwaysBreakTemplateDeclarations: MultiLine, BreakBeforeBinaryOperators: NonAssignment, BreakBeforeTernaryOperators: true, PackConstructorInitializers: NextLine, AlignArrayOfStructures: Left, AlignConsecutiveAssignments: Consecutive}"',
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
						'--style="{IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left, IndentCaseBlocks: false, IndentCaseLabels: true, ColumnLimit: 100, IncludeBlocks: Regroup, AllowShortIfStatementsOnASingleLine: AllIfsAndElse, AllowShortCaseLabelsOnASingleLine: true, BreakBeforeBraces: Attach, AllowAllParametersOfDeclarationOnNextLine: true, AllowShortEnumsOnASingleLine: true, AlwaysBreakTemplateDeclarations: MultiLine, BreakBeforeBinaryOperators: NonAssignment, BreakBeforeTernaryOperators: true, PackConstructorInitializers: NextLine, AlignArrayOfStructures: Left, AlignConsecutiveAssignments: Consecutive, Cpp11BracedListStyle: true}"',
						-- "-assume-filename",
						util.escape_path(util.get_current_buffer_file_name()),
					},
					stdin = true,
				}
			end,
		},
		java = {
			-- require("formatter.filetypes.cpp").clangformat
			function()
				return {
					exe = "clang-format",
					args = {
						'--style="{IndentWidth: 4, AlignAfterOpenBracket: BlockIndent, PointerAlignment: Left, IndentCaseBlocks: false, IndentCaseLabels: true, ColumnLimit: 100, IncludeBlocks: Regroup, AllowShortIfStatementsOnASingleLine: AllIfsAndElse, AllowShortCaseLabelsOnASingleLine: true, BreakBeforeBraces: Attach, AllowAllParametersOfDeclarationOnNextLine: true, AllowShortEnumsOnASingleLine: true, AllowShortLoopsOnASingleLine: true, AlwaysBreakTemplateDeclarations: MultiLine, BreakBeforeBinaryOperators: NonAssignment, BreakBeforeTernaryOperators: true, PackConstructorInitializers: NextLine, AlignArrayOfStructures: Left, AlignConsecutiveAssignments: Consecutive}"',
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
		-- sh = { require("formatter.filetypes.sh").beautysh },
		-- bash = { require("formatter.filetypes.bash").beautysh },
		zsh = { require("formatter.filetypes.sh").beautysh },
		sql = { require("formatter.filetypes.sql").sql_formatter },
		rust = { require("formatter.filetypes.rust").rustfmt },
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
