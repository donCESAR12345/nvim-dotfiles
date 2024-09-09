local plugins = {
    -- AutoPairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Commenter
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },

    -- Neogit
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("neogit").setup({})
            -- Mappings
            vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", {})
        end
    },

    -- Neo-Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    hijack_netrw_behavior = "open_default",
                },
                sources = {
                    "filesystem",
                    "buffers",
                    "git_status",
                    "document_symbols",
                },
            })

            -- Mappings
            vim.keymap.set("n", "<leader>e", ":Neotree<CR>", {})
            vim.keymap.set("n", "<leader>E", ":Neotree filesystem close<CR>", {})
            vim.keymap.set("n", "<leader>ts", ":Neotree document_symbols reveal float<CR>", {})

            -- Git Mappings
            vim.keymap.set("n", "<leader>gs", ":Neotree git_status reveal float<CR>", {})
        end,
    },

    -- Telescope UI select
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            -- Mappings
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>b", builtin.buffers, {})
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fm", builtin.marks, {})
            vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})

            require("telescope").load_extension("ui-select")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = true,
                autotag = { enable = true },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- Which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
        config = function()
            local wk = require("which-key")
            wk.add({
                { "<leader>E",   desc = "Close filesystem sidebar" },
                { "<leader>b",   desc = "Show buffers" },
                { "<leader>d",   group = "DAP" },
                { "<leader>db",  desc = "Toggle breakpoint" },
                { "<leader>dc",  desc = "Continue" },
                { "<leader>dr",  desc = "Open REPL" },
                { "<leader>ds",  group = "Step operations" },
                { "<leader>dsO", desc = "Step out" },
                { "<leader>dsi", desc = "Step into" },
                { "<leader>dso", desc = "Step over" },
                { "<leader>e",   desc = "Open filesystem sidebar" },
                { "<leader>f",   group = "Telescope" },
                { "<leader>fc",  desc = "Select colorscheme" },
                { "<leader>ff",  desc = "Find files by name" },
                { "<leader>fg",  desc = "Find files using content (grep)" },
                { "<leader>fh",  desc = "Open recent files" },
                { "<leader>fm",  desc = "Jump to bookmarks" },
                { "<leader>g",   group = "NeoGit" },
                { "<leader>gg",  desc = "Run NeoGit" },
                { "<leader>gs",  desc = "Git Status" },
                { "<leader>h",   desc = "Disable search highlight" },
                { "<leader>l",   group = "LSP" },
                { "<leader>lD",  desc = "Go to declaration" },
                { "<leader>lR",  desc = "Rename symbol" },
                { "<leader>la",  desc = "Code action" },
                { "<leader>ld",  desc = "Go to definition" },
                { "<leader>le",  desc = "Open floating diagnostic" },
                { "<leader>lf",  desc = "Format" },
                { "<leader>lr",  desc = "Search references" },
                { "<leader>t",   group = "Neo-tree" },
                { "<leader>tg",  desc = "Show git status" },
                { "<leader>ts",  desc = "Show document symbols" },
            })
        end,
    },
}

return plugins
