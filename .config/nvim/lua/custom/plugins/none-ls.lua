return {
	{ -- Linters and Formatters
		-- The alternative to this is using conform for formatting
		-- and nvim-lint for linters
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					require("none-ls.diagnostics.eslint_d"),
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "[G]o [F]ormatting" })
		end,
	},
}
