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
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local sources = {
				-- Code actions
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.code_actions.refactoring,

				-- Diagnostics
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.rpmspec,

				-- Formatting
				null_ls.builtins.formatting.astyle,
				null_ls.builtins.formatting.beautysh,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.djlint,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.rustfmt,
			}
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
				sources = sources,
			})
		end,
	},
}

return plugins
