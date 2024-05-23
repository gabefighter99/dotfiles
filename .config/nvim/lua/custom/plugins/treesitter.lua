return {
	{ -- highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":tsupdate",
		config = function()
			-- [[ configure treesitter ]] see `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "bash", "c", "html", "lua", "markdown", "markdown_inline", "vim", "vimdoc" },
				-- autoinstall languages that are not installed
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<c-backspace>",
					},
				},
			})

			-- there are additional nvim-treesitter modules that you can use to interact with:
			--
			--    - show current context (function name/inited vars/etc): https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
}
