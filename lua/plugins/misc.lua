local plugins = {
    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- Dashboard
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
            }

            dashboard.section.buttons.val = {
                dashboard.button("n", "  New File", "<cmd>ene<CR>"),
                dashboard.button("SPC f r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
                dashboard.button("SPC f f", "  Find File", "<cmd>Telescope find_files<CR>"),
                dashboard.button("SPC f g", "  Find Word", "<cmd>Telescope live_grep<CR>"),
                dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
                dashboard.button("m", "󱌣  Mason", "<cmd>Mason<CR>"),
                dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
            }

            _Gopts = {
                position = "center",
                hl = "Type",
            }

            dashboard.opts.opts.noautocmd = true
            alpha.setup(dashboard.opts)
        end,
    },

    -- Discord Rich Presence
    {
        "andweeb/presence.nvim",
        lazy = false,
        opts = {
            main_image = "file",
        },
    },

    -- Indent
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = { enabled = true },
        },
    },

    -- LuaLine
    {
        "nvim-lualine/lualine.nvim",
        opts = {},
    },

    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
            })
        end,
    },

    -- TODO Comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}

return plugins
