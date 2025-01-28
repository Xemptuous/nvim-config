return {
    cmd = { "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                disabled = { "unlinked-file" },
            },
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
    root_markers = { "Cargo.toml" },
    filetypes = { "rust" },
}
