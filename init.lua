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

-- require("lazy").setup("plugins", {
require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.lsp" },
        { import = "plugins.mini" },
        { import = "plugins.ui" },
        { import = "plugins.utils" },
    },
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
                -- "spellfile",
                -- "spellfile_plugin",
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

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = "*",
})

package.path = "./lua/?.lua;./lua/?.vim;" .. package.path
require("keymaps")
require("options")

-- experimental ui for errors
require("vim._extui").enable({})

-- vim.api.nvim_create_user_command("Explore", "Oil <args>", { nargs = "?", complete = "dir" })
-- vim.api.nvim_create_user_command("E", "Explore <args>", { nargs = "?", complete = "dir" })
-- vim.api.nvim_create_user_command("Sexplore", "belowright split | Oil <args>", { nargs = "?", complete = "dir" })
-- vim.api.nvim_create_user_command("Vexplore", "rightbelow vsplit | Oil <args>", { nargs = "?", complete = "dir" })
-- vim.api.nvim_create_user_command("Texplore", "tabedit % | Oil <args>", { nargs = "?", complete = "dir" })
