-- OneDark
require('onedark').setup {
	style = 'darker',
  transparent = true,

  code_style = {
    comments = "italic",
    keywords = "italic",
  },
  lualine = {
    transparent = false
  },
	colors = {
		bg1 = '#080a0d', -- completion background
		bg3 = '#1f222b', -- visual selection background
	},
	highlights = {
    ["@parameter"] = {fg = '#cc9057'},
    ["@keyword.operator"] = {fmt = 'bold'},
	},
	diagnostics = {
		darker = true,
		undercurl = true,
		background = true
	}
}
require('onedark').load()
-- vim.cmd("colorscheme onedark_dark")
vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed'})
-- vim.api.nvim_set_hl(0, 'FloatBorder', {fg = '#4fa6ed', bg='#080a0d'})
vim.api.nvim_set_hl(0, 'PMenu', {fg = '#4fa6ed', bg='#080a0d'})
vim.api.nvim_set_hl(0, 'PMenuSel', {fg = '#4fa6ed', bg='#080a0d'})
vim.api.nvim_set_hl(0, 'PMenuThumb', {fg = '#4fa6ed', bg='#4fa6ed'})
vim.api.nvim_set_hl(0, 'NormalFloat', {fg = '#4fa6ed', bg='#080a0d'})
-- vim.api.nvim_set_hl(0, 'NormalFloat', {fg = '#4fa6ed', bg='#080a0d'})
vim.api.nvim_set_hl(0, 'TelescopeBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#4fa6ed'})
vim.api.nvim_set_hl(0, 'CodewindowBackground', {fg = '#4fa6ed'})
-- vim.api.nvim_command("redraw")
