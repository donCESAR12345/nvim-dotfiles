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
