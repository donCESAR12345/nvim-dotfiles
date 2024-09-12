local plugins = {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        init = function()
            -- this is an example, not a default. Please see the readme for more configuration options
            vim.g.molten_output_win_max_height = 12
            -- I find auto open annoying, keep in mind setting this option will require setting
            -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
            vim.g.molten_auto_open_output = false

            -- Don't forget to setup and install the plugin if you want to view image outputs
            vim.g.molten_image_provider = "image.nvim"

            -- optional, I like wrapping. works for virt text and the output window
            vim.g.molten_wrap_output = true

            -- Output as virtual text. Allows outputs to always be shown, works with images, but can
            -- be buggy with longer images
            vim.g.molten_virt_text_output = true

            -- this will make it so the output shows up below the \`\`\` cell delimiter
            vim.g.molten_virt_lines_off_by_1 = true
        end,
    },

    -- Image rendering
    {
        "3rd/image.nvim",
        config = function()
            require("image").setup({
                backend = "kitty",            -- Kitty will provide the best experience, but you need a compatible terminal
                integrations = {},            -- do whatever you want with image.nvim's integrations
                max_width = 200,              -- tweak to preference
                max_height = 100,              -- ^
                max_height_window_percentage = math.huge, -- this is necessary for a good experience
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = true,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            })
        end,
    },

    -- LSP for Jupyter
    {
        "quarto-dev/quarto-nvim",
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local quarto = require("quarto")
            quarto.setup({
                lspFeatures = {
                    -- NOTE: put whatever languages you want here:
                    languages = { "python" },
                    chunks = "all",
                    diagnostics = {
                        enabled = true,
                        triggers = { "BufWritePost" },
                    },
                    completion = {
                        enabled = true,
                    },
                },
                keymap = {
                    -- NOTE: setup your own keymaps:
                    -- hover = "H",
                    -- definition = "gd",
                    -- rename = "<leader>rn",
                    -- references = "gr",
                    -- format = "<leader>gf",
                },
                codeRunner = {
                    enabled = true,
                    default_method = "molten",
                },
                ft = { "quarto", "markdown" },
            })
        end,
    },

    -- Jupytext
    {
        "GCBallesteros/jupytext.nvim",
        config = function()
            require("jupytext").setup({
                style = "markdown",
                output_extension = "md",
                force_ft = "markdown",
            })
        end,
        -- Depending on your nvim distro or config you may need to make the loading not lazy
        -- lazy=false,
    },
}

return plugins
