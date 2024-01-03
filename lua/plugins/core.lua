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
			vim.keymap.set("n", "<leader>tg", ":Neotree git_status reveal float<CR>", {})
			vim.keymap.set("n", "<leader>ts", ":Neotree document_symbols reveal float<CR>", {})
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
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
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
			require("which-key").register({
				e = { "Open filesystem sidebar" },
				E = { "Close filesystem sidebar" },
				b = { "Show buffers" },
				h = { "Disable search highlight" },
				t = {
					name = "Neo-tree",
					g = { "Show git status" },
					s = { "Show document symbols" },
				},
				f = {
					name = "Telescope",
					f = { "Find files by name" },
					g = { "Find files using content (grep)" },
					c = { "Select colorscheme" },
				},
				l = {
					name = "LSP",
					e = { "Open floating diagnostic" },
					d = { "Go to definition" },
					D = { "Go to declaration" },
					r = { "Search references" },
					R = { "Rename symbol" },
					a = { "Code action" },
					f = { "Format" },
				},
			}, { prefix = "<leader>" })
		end,
	},
}

return plugins
