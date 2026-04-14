return {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell" },
    handlers = {
        ["language/status"] = function(_, _) end,
        ["$/progress"] = function(_, _, _) end,
    },
    single_file_support = true,
}
