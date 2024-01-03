local plugins = {
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
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
			sources = sources,
		})
	end,
}

return plugins
