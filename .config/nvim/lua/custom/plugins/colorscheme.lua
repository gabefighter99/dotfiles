return {
	{ -- Colorscheme/Theme
		"CodeGradox/onehalf-lush",
		-- "folke/tokyonight.nvim",
		-- "catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here
			-- vim.cmd.colorscheme("tokyonight-night")
			-- vim.cmd.colorscheme("catppuccin-mocha")
			vim.api.nvim_set_option("background", "dark")
			vim.cmd.colorscheme("onehalf-lush-dark")

			-- You can configure highlights by doing something like
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
