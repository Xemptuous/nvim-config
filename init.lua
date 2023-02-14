vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)
vim.opt.shadafile = "NONE"
package.path = './lua/?.lua;' .. package.path
require("plugins")
require('keymaps')
require('options')
