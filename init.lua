vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.python3_host_prog = "/bin/python3"

-- install lazy.nvim if dir doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    install = { colorscheme = { "catppuccin" } },
    defaults = { lazy = true },
    ui = { border = "single" },
    change_detection = {
        enabled = false,
        notify = false,
    },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "bugreport",
                "compiler",
                "editorconfig",
                "ftplugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "man",
                "matchit",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "nvim-treesitter-textobjects",
                "node",
                "optwin",
                "osc52",
                "perl",
                "python3",
                "rplugin",
                "rrhelper",
                "ruby",
                "spellfile",
                "spellfile_plugin",
                "synmenu",
                "syntax",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "shada",
            },
        },
    },
})

-- Resize windows on resize
vim.api.nvim_create_autocmd({ "VimResized" }, {
    pattern = { "*" },
    command = "wincmd =",
})

package.path = "./lua/?.lua;./lua/?.vim;" .. package.path
require("keymaps")
require("options")

-- experimental ui for errors
require("vim._extui").enable({})
