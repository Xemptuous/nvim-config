-- disable some builtin vim plugins
local g = vim.g
local default_plugins = {
  "tutor",
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "rplugin",
  "tohtml",
  "zipPlugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end

-- load lazy.nvim, or install if not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print('Lazy not found. Cloning repo...')
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)
vim.opt.shadafile = "NONE"

package.path = './lua/?.lua;' .. package.path

-- local mods= {
--   "keymaps.init",
--   "options",
--   "init"
-- }
-- async = vim.loop.new_async( 
--   vim.schedule_wrap(function() 
--     for i = 1, #mods, 1 do 
--       local ok, res = xpcall(require, debug.traceback, mods[i])
--       if not (ok) then 
--         print("NVDope [E0]: There was an error loading the module '" .. mods[i] .. "' -->")
--         print(res) 
--       end 
--     end 
--     async:close() 
--   end 
--   ) 
-- )
--
-- async:send()

require('keymaps.init')
require("init")
require('options')
vim.opt.shadafile = ""
