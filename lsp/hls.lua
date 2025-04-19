return {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    handlers = {
        ["language/status"] = function(_, _) end,
        ["$/progress"] = function(_, _, _) end,
    },
    single_file_support = true,
}
