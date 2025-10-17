-- You are a highly capable and concise code assistant designed to seamlessly complete code based on a developer’s current editing context. Your suggestions should be syntactically correct, contextually relevant, and follow best coding practices. Always aim to complete the user’s thought, infer intent when reasonable, and do not repeat what is already written unless needed. Prioritize code over commentary unless clarification is essential.
-- local prompt = [[
-- You are the backend of an AI-powered code completion engine. Your task is to
-- provide code suggestions based on the user's input. Avoid writing comments
-- in completions. The user's code will be enclosed in markers:
--
-- - `<contextAfterCursor>`: Code context after the cursor
-- - `<cursorPosition>`: Current cursor location
-- - `<contextBeforeCursor>`: Code context before the cursor
-- ]]
return {
    {
        "milanglacier/minuet-ai.nvim",
        enabled = false,
        lazy = false,
        -- event = "VeryLazy",
        -- event = { "InsertEnter", "CmdlineEnter" },
        opts = {
            provider = "openai_fim_compatible",
            n_completions = 1,
            context_window = 32768,
            request_timeout = 5,
            provider_options = {
                openai_fim_compatible = {
                    -- system = {
                    --     prompt = prompt,
                    -- },
                    stream = true,
                    api_key = "TERM",
                    name = "Ollama",
                    end_point = "http://localhost:11434/v1/completions",
                    -- model = "deepseek-coder-v2:16b-lite-base-q8_0",
                    optional = {
                        max_tokens = 1000,
                        top_p = 0.9,
                    },
                },
            },
            virtualtext = {
                auto_trigger_ft = { "*" },
                show_on_completion_menu = true,
                keymap = {
                    accept = "<C-A>",
                    accept_line = "<A-a>",
                    -- accept n lines (prompts for number)
                    -- e.g. "A-z 2 CR" will accept 2 lines
                    accept_n_lines = "<A-z>",
                    prev = "<C-[>",
                    next = "<C-]>",
                    dismiss = "<C-x>",
                },
            },
            -- lsp = {
            --     enabled_ft = { "*" },
            --     enabled_auto_trigger_ft = { "*" },
            -- },
            presets = {
                ["qwen2.5-14b-q8_0"] = {
                    context_window = 32768,
                    provider = "openai_fim_compatible",
                    provider_options = {
                        openai_fim_compatible = {
                            api_key = "TERM",
                            name = "Ollama",
                            end_point = "http://localhost:11434/v1/completions",
                            model = "qwen2.5-coder:14b-base-q8_0",
                            optional = {
                                max_tokens = 1000,
                                top_p = 0.9,
                            },
                        },
                    },
                },
                ["deepseek-coder-v2:16b"] = {
                    context_window = 32768,
                    provider = "openai_fim_compatible",
                    provider_options = {
                        openai_fim_compatible = {
                            api_key = "TERM",
                            name = "Ollama",
                            end_point = "http://localhost:11434/v1/completions",
                            model = "deepseek-coder-v2:16b-lite-base-q8_0",
                            optional = {
                                max_tokens = 1000,
                                top_p = 0.9,
                            },
                        },
                    },
                },
            },
        },
        config = function(_, opts) require("minuet").setup(opts) end,
    },
    {
        "yetone/avante.nvim",
        enabled = false,
        event = "InsertEnter",
        -- event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            provider = "ollama",
            ollama = {
                -- model = "qwen2.5-coder:32b-base-q4_K_M",
                -- model = "qwen3:14b",
                model = "deepseek-coder-v2:16b-lite-base-q8_0",
                -- model = "deepseek-coder-v2:16b-lite-base-q6_K",
            },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "echasnovski/mini.icons",
            "MeanderingProgrammer/render-markdown.nvim",
        },
    },
}
