local plugins = {
    -- Mason
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason with LSP
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },

    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            local default_config = {
                capabilities = capabilities,
            }

            local servers = {
                "bashls",               -- Shell
                "clangd",               -- C/C++
                "dockerls",             -- Docker
                "gdscript",             -- GodotScript
                "html",                 -- HTML
                "jedi_language_server", -- Python
                "jsonls",               -- JSON
                "lua_ls",               -- Lua
                "qml_lsp",              -- QML
                "rust_analyzer",        -- Rust
                "ts_ls",                -- Typescript/Javascript
            }

            -- Default config
            for _, server in ipairs(servers) do
                -- Lua
                if server == "lua_ls" then
                    local specific_config = require("lsp-config.lua_ls").config()
                    lspconfig[server].setup(specific_config)
                    -- Defaults
                else
                    lspconfig[server].setup({
                        default_config,
                    })
                end
            end
        end,
    },

    -- None LS
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Code actions
                    null_ls.builtins.code_actions.refactoring,

                    -- Diagnostics
                    null_ls.builtins.diagnostics.rpmspec,
                    -- null_ls.builtins.diagnostics.ruff,

                    -- Formatting
                    null_ls.builtins.formatting.astyle,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.beautysh,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.djlint,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettierd,
                }
            })
        end,
    },
}

return plugins
