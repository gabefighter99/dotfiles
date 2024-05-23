return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			delete_to_trash = true,

			-- skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in current window" }),
			vim.keymap.set(
				"n",
				"<leader>-",
				require("oil").toggle_float,
				{ desc = "Open parent directory in floating window" }
			),
		})
	end,
}
