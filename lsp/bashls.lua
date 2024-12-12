vim.lsp.config.bashls = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash", "zsh", "fish" },
    settings = {
        bashIde = {
            globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
        },
    },
    single_file_support = true,
}
