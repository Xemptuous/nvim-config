return {
	{
		"mhartington/formatter.nvim",
		lazy = true,
		cmd = { "Format", "FormatWrite" },
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				pattern = { "*" },
				command = "FormatWrite",
			})
		end,
        -- opts = {
        config = function()
            local util = require("formatter.util")
            require("formatter").setup{
                logging = false,
                log_level = vim.log.levels.WARN,
                filetype = {
                    -- c = {
                    --     function()
                    --         return {
                    --             exe = "clang-format",
                    --             args = {
                    --                 "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format",
                    --                 util.escape_path(util.get_current_buffer_file_name()),
                    --             },
                    --             stdin = true,
                    --         }
                    --     end,
                    -- },
                    cpp = {
                        function()
                            return {
                                exe = "clang-format",
                                args = {
                                    "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format",
                                    util.escape_path(util.get_current_buffer_file_name()),
                                },
                                stdin = true,
                            }
                        end,
                    },
                    java = {
                        function()
                            return {
                                exe = "clang-format",
                                args = {
                                    "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format",
                                    -- "-assume-filename",
                                    util.escape_path(util.get_current_buffer_file_name()),
                                },
                                stdin = true,
                            }
                        end,
                    },
                    cs = {
                        function()
                            return {
                                exe = "clang-format",
                                args = {
                                    "--style=file:" .. vim.fn.stdpath("config") .. "/.clang-format",
                                    -- "-assume-filename",
                                    util.escape_path(util.get_current_buffer_file_name()),
                                },
                                stdin = true,
                            }
                        end,
                    },
                    -- php = {
                    --     function()
                    --         return {
                    --             exe = "pretty-php",
                    --             args = {
                    --                 "--quiet", "--stdin-filename",
                    --                 util.escape_path(util.get_current_buffer_file_name())
                    --             },
                    --             stdin = false
                    --         }
                    --     end,
                    -- },
                    sql = {
                        function()
                            return {
                                exe = "sleek",
                                stdin = true
                            }
                        end
                    },
                    python = {
                        require("formatter.filetypes.python").black,
                        require("formatter.filetypes.python").isort,
                        function()
                            return {
                                exe = "ruff",
                                args = {
                                    "--fix-only",
                                    "--config" .. vim.fn.stdpath("config") .. "/.ruff.toml",
                                    "-q",
                                },
                            }
                        end,
                    },
                    json = { require("formatter.filetypes.json").jq },
                    -- lua = { require("formatter.filetypes.lua").stylua },
                    -- python = { require("formatter.filetypes.python").black },
                    sh = { require("formatter.filetypes.sh").beautysh },
                    bash = { require("formatter.filetypes.sh").beautysh },
                    zsh = { require("formatter.filetypes.sh").beautysh },
                    -- rust = { require("formatter.filetypes.rust").rustfmt },
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace,
                    }
                }
            }
        end
	}
}
