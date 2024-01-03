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
}

return plugins
