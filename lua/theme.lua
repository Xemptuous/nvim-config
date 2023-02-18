require('catppuccin').setup({
  flavour = "mocha",
   background = { -- :h background
    light = "mocha",
    dark = "mocha",
  },
  transparent_background = false,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    -- loops = {},
    -- functions = {},
    -- keywords = {},
    -- strings = {},
    -- variables = {},
    -- numbers = {},
    -- booleans = {},
    -- properties = {},
    -- types = {},
    -- operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    -- notify = false,
    -- mini = false,
  },
})
vim.cmd.colorscheme 'catppuccin'
-- require('kanagawa').setup({
--     undercurl = true,           -- enable undercurls
--     commentStyle = { italic = true },
--     functionStyle = {},
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = {},
--     variablebuiltinStyle = { italic = true},
--     specialReturn = true,       -- special highlight for the return keyword
--     specialException = true,    -- special highlight for exception handling keywords
--     transparent = true,        -- do not set background color
--     dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
--     globalStatus = false,       -- adjust window separators highlight for laststatus=3
--     terminalColors = true,      -- define vim.g.terminal_color_{0,17}
--     colors = {},
--     overrides = {},
--     theme = "light"           -- Load "default" theme or the experimental "light" theme
-- })
-- vim.cmd("colorscheme kanagawa")

-- require('onedark').setup {
-- 	style = 'darker',
--   transparent = true,
--
--   code_style = {
--     comments = "italic",
--     keywords = "italic",
--   },
--   lualine = {
--     transparent = false
--   },
-- 	colors = {
-- 		bg1 = '#080a0d', -- completion background
-- 		bg3 = '#1f222b', -- visual selection background
-- 	},
-- 	highlights = {
--     ["@parameter"] = {fg = '#cc9057'},
--     ["@keyword.operator"] = {fmt = 'bold'},
-- 	},
-- 	diagnostics = {
-- 		darker = true,
-- 		undercurl = true,
-- 		background = true
-- 	}
-- }
-- require('onedark').load()
-- local hl = vim.api.nvim_set_hl
-- -- vim.cmd("colorscheme onedark_dark")
-- hl(0, 'FloatBorder', {fg = '#4fa6ed'})
-- -- hl(0, 'FloatBorder', {fg = '#4fa6ed', bg='#080a0d'})
-- hl(0, 'PMenu', {fg = '#4fa6ed', bg='#080a0d'})
-- hl(0, 'PMenuSel', {fg = '#4fa6ed', bg='#080a0d'})
-- hl(0, 'PMenuThumb', {fg = '#4fa6ed', bg='#4fa6ed'})
-- hl(0, 'NormalFloat', {fg = '#4fa6ed', bg='#080a0d'})
-- -- hl(0, 'NormalFloat', {fg = '#4fa6ed', bg='#080a0d'})
-- hl(0, 'TelescopeBorder', {fg = '#4fa6ed'})
-- hl(0, 'TelescopePromptBorder', {fg = '#4fa6ed'})
-- hl(0, 'TelescopeResultsBorder', {fg = '#4fa6ed'})
-- hl(0, 'TelescopePreviewBorder', {fg = '#4fa6ed'})
-- hl(0, 'DiagnosticSignInfo', {fg = '#4fa6ed'})
-- hl(0, 'DiagnosticVirtualTextInfo', {fg = '#4fa6ed'})
-- hl(0, 'CodewindowBorder', {fg = '#4fa6ed'})
-- hl(0, 'CodewindowBackground', {fg = '#4fa6ed'})
-- vim.api.nvim_command("redraw")
