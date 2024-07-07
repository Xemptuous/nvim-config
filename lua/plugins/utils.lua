return {
    {
        "michaelb/sniprun",
        lazy = true,
        cmd = "SnipRun",
        build = "sh ./install.sh",
        config = function() require("sniprun").setup({}) end
    },
    {
        "max397574/better-escape.nvim",
        opts = {
            mappings = {
                i = {
                    j = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                    k = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                },
            },
            timeout = vim.o.timeoutlen,
        },
        config = function(_, opts) require("better_escape").setup(opts) end
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end,
    },
    {
        "kylechui/nvim-surround",
        lazy = true,
        keys = { "ys", "yS" },
        config = function() require("nvim-surround").setup() end,
    },
	{
		"alvan/vim-closetag",
		lazy = true,
		ft = { "html", "djangohtml", "htmldjango" },
	},
    {
        "numToStr/Comment.nvim",
        lazy = true,
        keys = { "gc", "V" },
        config = function() require("Comment").setup() end,
    },
    {
        "Vimjas/vim-python-pep8-indent",
        lazy = true,
        ft = { "python", "py" },
    },
	{
		"folke/flash.nvim",
		lazy = true,
		keys = {
			{ "s", mode = { "n", "o", "x" }, function() require("flash").jump() end },
			{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end },
			{ "r", mode = "o", function() require("flash").remote() end },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end},
		},
		config = function()
            vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#89b4fa" })
            vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#a6e3a1" })
            vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#11111b", bg = "#f38ba8" })
		end
	},
    {
        "ggandor/leap.nvim",
        enabled = false,
        lazy = true,
        keys = {{ "s", mode = { "n", "o", "x" }}},
        config = function() require("leap").create_default_mappings() end
    },
    {
        "karb94/neoscroll.nvim",
        enabled = false,
        config = function() require('neoscroll').setup {} end
    },
	{
		"lambdalisue/suda.vim",
		lazy = true,
		cmd = "SudaWrite",
	},
    { -- parse and color ansi escape color codes
        "m00qek/baleia.nvim",
        enabled = false,
        lazy = true,
        cmd = { "BaleiaColorize" },
        config = function() require("baleia").setup({}) end,
    },
    {
        "toppair/peek.nvim",
        -- ft = {"markdown"},
        init = function()
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
        opts = {
            -- whether to automatically load preview when entering another markdown buffer
            auto_load = true,
            -- close preview window on buffer delete
            close_on_bdelete = true,
            -- enable syntax highlighting, affects performance
            syntax = true,
            -- 'dark' or 'light'
            theme = 'dark',
            update_on_change = true,
            -- 'webview', 'browser', string or a table of strings explained below
            app = 'webview',
            -- list of filetypes to recognize as markdown relevant if update_on_change is true
            filetype = { 'markdown' },
            -- start throttling when file exceeds this amount of bytes in size
            throttle_at = 200000,
            -- minimum amount of time in milliseconds that has to pass before starting new render
            throttle_time = 'auto',
        },
        config = function(_, opts) require("peek").setup(opts) end
    },
	{
		"mrjones2014/legendary.nvim",
		enabled = false,
		event = "VeryLazy",
        config = function() vim.keymap.set("n", "<C-f>", ":Legendary<CR>") end,
        opts = {
            keymaps = {
                { "<leader>tf", ":Telescope find_files<CR>", description = "Telescope Find File" },
                { "<leader>tg", ":Telescope live_grep<CR>", description = "Telescope Grep" },
                { "<leader>tb", ":Telescope buffers<CR>", description = "Telescope Buffers" },
                { "<leader>th", ":Telescope help_tags<CR>", description = "Telescope Help" },
                { "<leader>tR", ":Telescope oldfiles<CR>", description = "Telescope Open Recent File" },
                { "<leader>tw", ":Telescope grep_string{}<CR>", description = "Telescope String" },
                { "<leader>tH", ":Telescope search_history{}<CR>", description = "Telescope Search History" },
                { "<leader>tC", ":Telescope command_history{}<CR>", description = "Telescope Command History" },
                { "<leader>tc", ":Telescope colorscheme{}<CR>", description = "Telescope Colorscheme" },
                { "<leader>tr", ":Telescope registers{}<CR>", description = "Telescope Registers" },
                { "<F5>", "DapContinue<CR>", description = "Debugger Continue" },
                { "<F6>", "DapStepOver<CR>", description = "Debugger StepOver" },
                { "<F7>", "DapStepInto<CR>", description = "Debugger StepInto" },
                { "<F8>", "DapStepOut<CR>", description = "Debugger StepOut" },
                { "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", description = "Debugger Breakpoint Toggle" },
                { "<leader>dr", ":lua require('dap').repl.open()<CR>", description = "Debugger REPL Toggle" },

                -- {'<leader>db', "DapToggleBreakpoint<CR>", description = "Debugger Breakpoint Toggle" },
                -- {'<leader>dr', "DapToggleReplCR>", description = "Debugger REPL Toggle" },
                { "<leader>dl", ":lua require('dap').run_last()<CR>", description = "Debugger Run Last" },
                { "<leader>dh", ":lua require('dap.ui.widgets').hover()<CR>", description = "Debugger Show Hover Info" },
                { "<leader>dp", ":lua require('dap.ui.widgets').preview()<CR>", description = "Debugger Show Preview" },
                { "<leader>df", ":lua widgets.centered_float(require('dap.ui.widgets').frames)<CR>", description = "Debugger Show Frames", },
                { "<leader>ds", ":lua widgets.centered_float(require('dap.ui.widgets').scopes)<CR>", description = "Debugger Show Scopes", }
            }
        }
	},
    {
		"folke/which-key.nvim",
        enabled = true,
		event = "VeryLazy",
		config = function()
            local wk = require("which-key")
            wk.setup()
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
		end,
	},
    { "jidn/vim-dbml" },
    { "chrisbra/unicode.vim" }
}
