return {
    single_file_support = true,
    filestypes = { "java" },
    handlers = {
        -- ["language/status"] = function(_, _) end,
        ["$/progress"] = function(_, _, _) end,
    },
}
