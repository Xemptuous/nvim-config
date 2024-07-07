return {
	{
		"catppuccin/nvim",
        enabled = true,
        lazy = false,
		priority = 1000,
        opts = {
            flavour = "mocha",
            background = { -- :h background
                light = "mocha",
                dark = "mocha",
            },
            transparent_background = false,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.01,
            },
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
            },
            color_overrides = {
                all = {
                    base = "#0d0d14",
                    mantle = "#08080d",
                }
            },
            custom_highlights = {
                -- vim.cmd('hi def IlluminatedWordText gui=underline')
                vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#1e1e2e", underline = true }),
                vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#1e1e2e", underline = true }),
                vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#1e1e2e", underline = true }),
                -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed'})
                -- vim.api.nvim_set_hl(0, 'Pmenu', {fg = '#4fa6ed'})
                -- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed', bg = "#313244"})
            },
            integrations = {
                cmp = true,
                flash = true,
                gitsigns = true,
                nvimtree = true,
                indent_blankline = { enabled = true },
                mason = true,
                lsp_saga = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                    inlay_hints = {
                        background = true
                    }
                },
                semantic_tokens = true,
                rainbow_delimiters = true,
                telescope = true,
                treesitter = true
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end
	},
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        priority = 1000,
        opts = {},
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight-night")
        end
    },
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
        -- event = "BufReadPre",
		event = "VeryLazy",
		opts = {
            options = {
                theme = "catppuccin"
            },
            sections = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 3
                    }
                },
                lualine_x = {'filetype'},
            },
            inactive_sections = {
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 4
                    }
                }
            }
        },
	},
    {
        "folke/twilight.nvim",
        lazy = true,
        keys = "<leader>d",
        opts = {
        dimming = {
            alpha = 0.25, -- amount of dimming
            -- we try to get the foreground from the highlight groups or fallback color
            color = { "Normal", "#ffffff" },
            term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
            inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
          },
          context = 10, -- amount of lines we will try to show around the current line
          treesitter = true, -- use treesitter when available for the filetype
          -- treesitter is used to automatically expand the visible text,
          -- but you can further control the types of nodes that should always be fully expanded
          expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
            "function",
            "method",
            "table",
            "if_statement",
          },
          exclude = {}, -- exclude these filetypes
        },
        config = function(_, opts)
            require("twilight").setup(opts)
            vim.api.nvim_set_keymap("n", "<leader>d", [[:Twilight<CR>]], {})
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        -- config = true,
        config = function()
            require("neogit").setup({
                mappings = {
                    popup = {
                        ["l"] = false,
                        ["L"] = "LogPopup"
                    }
                }
            })
            vim.api.nvim_set_keymap('n', '<leader>ng', [[:Neogit<CR>]], { noremap = true })
        end,
    },
    {
        "airblade/vim-gitgutter",
        enabled = false,
    },
    {
        "tpope/vim-fugitive",
        lazy = true,
        event = "VeryLazy",
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = "VeryLazy",
        config = function() require("gitsigns").setup({
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']g', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[g', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                map('n', '<leader>hs', gitsigns.stage_hunk)
                map('n', '<leader>hr', gitsigns.reset_hunk)
                map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                map('n', '<leader>hS', gitsigns.stage_buffer)
                map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                map('n', '<leader>hR', gitsigns.reset_buffer)
                map('n', '<leader>hp', gitsigns.preview_hunk)
                map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                map('n', '<leader>hd', gitsigns.diffthis)
                map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                map('n', '<leader>td', gitsigns.toggle_deleted)

                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }) end,
    },
	{
		"kristijanhusak/vim-dadbod-ui",
		lazy = true,
		cmd = "DBUI",
		dependencies = { "tpope/vim-dadbod" },
	},
    { -- Minimap Sidebar
        "gorbit99/codewindow.nvim",
        lazy = true,
        keys = "<leader>mm",
        opts = {
            auto_enable = false,
            minimap_width = 15,
            window_border = "single",
            -- width_multiplier = 4,
            -- show_cursor = false,
        },
        config = function(_, opts)
            require("codewindow").setup(opts)
            require("codewindow").apply_default_keybinds()
        end
    },
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = { "VimEnter", "NvimTreeToggle" },
		keys = "<C-t>",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
        opts = function ()
            local function on_attach(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set("n", "<C-[>", api.tree.change_root_to_parent, opts("Up"))
                vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
                vim.keymap.set("n", "<C-T>", api.tree.close, opts("Close"))
            end
            return {
                sort_by = "case_sensitive",
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
                on_attach = on_attach,
            }
        end,
		config = function(_, opts)
            require("nvim-tree").setup()
            vim.api.nvim_set_keymap("n", "<C-t>", [[:NvimTreeToggle<CR>]], {})
        end
	},
	{
		"glepnir/dashboard-nvim",
		enabled = false,
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            theme = "hyper",
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = " Update",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        desc = " Apps",
                        group = "DiagnosticHint",
                        action = "Telescope app",
                        key = "a",
                    },
                    {
                        desc = " dotfiles",
                        group = "Number",
                        action = "Telescope dotfiles",
                        key = "d",
                    },
                },
            },
            hide = {
                statusline = true,
                tabline = true,
                winbar = true,
            }
        }
	},
    {
        "stevearc/dressing.nvim",
        enabled = true,
        opts = {}
    },
    {
        "2kabhishek/nerdy.nvim",
        lazy = true,
        cmd = "Nerdy",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-telescope/telescope.nvim"
        },
    },
    {
        "xemptuous/sqlua.nvim",
        lazy = true,
        cmd = 'SQLua',
        config = function() require("sqlua").setup({
            load_connections_on_start = false,
        }) end
    },
    {
        "kndndrj/nvim-dbee",
        dependencies = {"MunifTanjim/nui.nvim"},
        build = function() require("dbee").install() end,
        config = function()
            require("dbee").setup({
                sources = {
                    require("dbee.sources").FileSource:new(vim.fn.stdpath("data") .. "/dbee/connections.json") ,
                },
                default_connection = "americor-crm",
                editor = {
                    mappings = {
                        { key = "<leader>r", mode = "v", action = "run_selection"},
                        { key = "<leader>r", mode = "n", action = "run_file"},
                    }
                }

            })
        end
    },
}
