return {
    cmd = { "serve-d" },
    filetypes = { "d" },
    root_markers = { { "dub.json", "dub.sdl", ".git" } },
    single_file_support = true,
    settings = {
        dfmt = {
            braceStyle = "stroustrup",
        },
    },
}
