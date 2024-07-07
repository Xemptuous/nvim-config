return {
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
            "mtoohey31/cmp-fish",
            -- "ray-x/cmp-sql",
			"L3MON4D3/LuaSnip",
            -- "nanotee/sqls.nvim"
		},
        opts = function()
            local lspkind = require("lspkind")
            local cmp = require("cmp")
            return {
                sources = {
                    { name = "nvim_lsp" },
                    -- { name = "nvim_lsp", keyword_length = 1 },
                    { name = "nvim_lsp+document_symbol", ft={"lua"} },
                    { name = "nvim_lsp+signature_help", ft={"lua"} },
                    { name = "nvim_lua", ft="lua"},
                    { name = "buffer" },
                    { name = "look", ft={"markup", "html"} },
                    { name = "fish", ft={"fish"} },
                    -- { name = "buffer", keyword_length = 3 },
                    -- { name = "look", keyword_length = 3, ft={"markup", "html"} },
                    { name = "path" },
                    -- { name = "sql", ft={"sql", "pgsql"}},
                    { name = "luasnip", keyword_length = 3 },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                        -- vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    -- completion = {
                    --     winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
                    -- },
                    -- documentation = {
                    --     winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
                    -- },
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:FloatBorder,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    }),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        before = function(entry, vim_item)
                            return vim_item
                        end,
                    }),
                    -- format = function(entry, vim_item)
                    -- 	vim_item.abbr = " " .. vim_item.abbr
                    -- 	vim_item.menu = (vim_item.menu or "") .. " "
                    -- 	return vim_item
                    -- end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                }),
            }
        end,
        config = function(_, opts)
            local cmp = require("cmp")
            cmp.setup(opts)
            cmp.setup.filetype("TelescopePrompt", {
                enable = true,
            })

            -- cmp.setup.filetype("gitcommit", {
            --     sources = cmp.config.sources({
            --         { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            --     }, {
            --         { name = "buffer" },
            --     }),
            -- })
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({ { name = "path" }, }, {
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                }),
            })
        end
	}
}
