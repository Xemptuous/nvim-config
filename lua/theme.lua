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
	highlights = {
    ["@parameter"] = {fg = '#cc9057'},
    ["@keyword.operator"] = {fmt = 'bold'},
	}
}
require('onedark').load()
