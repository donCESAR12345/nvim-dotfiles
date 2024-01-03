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

			local servers = {
				"bashls",
				"clangd",
				"dockerls",
				"html",
				"lua_ls",
				"pylsp",
				"rust_analyzer",
				"tsserver",
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
		end,
	},
}

return plugins
