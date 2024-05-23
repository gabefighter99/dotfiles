return {
	{ -- Github Copilot
		-- use :Copilot auth signout to sign out
		-- stored in ~/.config/github-copilot/hosts.json
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "VeryLazy",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{ -- Github Copilot CMP integration
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
