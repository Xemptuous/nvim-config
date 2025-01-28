return {
    cmd = { "lua-language-server" },
    single_file_support = true,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
    filetypes = { "lua" },
}
