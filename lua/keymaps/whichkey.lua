local wk = require("which-key")
wk.register({
	["<leader>"] = {
		t = {
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			g = { "<cmd>Telescope live_grep<cr>", "Grep" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
			R = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			w = { "<cmd>Telescope grep_string{}<CR>", "String" },
			H = { "<cmd>Telescope search_history{}<CR>", "Search History" },
			C = { "<cmd>Telescope command_history{}<CR>", "Command History" },
			c = { "<cmd>Telescope colorscheme{}<CR>", "Colorscheme" },
			r = { "<cmd>Telescope registers{}<CR>", "Registers" },
		},
		d = {
			name = "Debugger",
			["<F5>"] = { "<cmd>DapContinue<CR>", "Continue" },
			["<F6>"] = { "<cmd>DapStepOver<CR>", "StepOver" },
			["<F7>"] = { "<cmd>DapStepInto<CR>", "StepInto" },
			["<F8>"] = { "<cmd>DapStepOut<CR>", "StepOut" },
			b = { "<cmd>DapToggleBreakpoint<CR>", "Breakpoint Toggle" },
			r = { "<cmd>DapToggleReplCR>", "REPL Toggle" },
			l = { "<cmd>:lua require('dap').run_last()", "Run Last" },
			h = { "<cmd>:lua require('dap.ui.widgets').hover()", "Show Hover Info" },
			p = { "<cmd>:lua require('dap.ui.widgets').preview()", "Show Preview" },
			f = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').frames)", "Show Frames" },
			s = { "<cmd>:lua widgets.centered_float(require('dap.ui.widgets').scopes)", "Show Scopes" },
		},
		m = {
			name = "Code Window",
			o = {},
		},
	},
}, {
	mode = "n",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})
