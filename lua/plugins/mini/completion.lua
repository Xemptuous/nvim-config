return {
    "echasnovski/mini.completion",
    enabled = false,
    event = "VeryLazy",
    opts = {
        delay = {
            completion = 10,
            info = 50,
            signature = 50,
        },
        window = {
            info = {
                height = 25,
                width = 80,
                border = "none",
            },
            signature = {
                height = 25,
                width = 80,
                border = "none",
            },
        },
        lsp_completion = {
            source_func = "completefunc",
            -- source_func = "omnifunc",
            auto_setup = true,
        },
    },
}
