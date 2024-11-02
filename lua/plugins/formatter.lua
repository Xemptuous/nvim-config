local clang_config_path = "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format"

return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		-- keys = {
		-- 	{
		-- 		-- Customize or remove this keymap to your liking
		-- 		"<leader>f",
		-- 		function()
		-- 			require("conform").format({ async = true })
		-- 		end,
		-- 		mode = "",
		-- 		desc = "Format buffer",
		-- 	},
		-- },
		init = function()
			-- Format on Save
			-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			-- 	pattern = { "*" },
			-- 	callback = function(args)
			-- 		require("conform").format({ bufnr = args.buf })
			-- 	end,
			-- })
			-- Manual Format
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })
			-- Enable/Disable Formatting
			vim.api.nvim_create_user_command("FormatDisable", function()
				vim.g.disable_autoformat = true
			end, { desc = "Disable autoformat-on-save" })
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, { desc = "Re-enable autoformat-on-save" })
		end,
		opts = {
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				bash = { "beautysh" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cs = { "clang-format" },
				fish = { "fish_indent" },
				go = { "gofmt" },
				java = { "clang-format" },
				js = { "prettier" },
				json = { "jq" },
				jsr = { "prettier" },
				jsx = { "prettier" },
				lua = { "stylua" },
				mjs = { "prettier" },
				php = { "pretty-php" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				sh = { "beautysh" },
				svelte = { "prettier" },
				ts = { "prettier" },
				tsr = { "prettier" },
				tsx = { "prettier" },
				zsh = { "beautysh" },
			},
		},
	},
}
