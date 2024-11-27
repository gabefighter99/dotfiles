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

			-- Deactivate Copilot by default
			vim.cmd("Copilot disable")

			local copilot_on = false
			vim.api.nvim_create_user_command("CopilotToggle", function()
				if copilot_on then
					vim.cmd("Copilot disable")
					print("Copilot OFF")
				else
					vim.cmd("Copilot enable")
					print("Copilot ON")
				end
				copilot_on = not copilot_on
			end, { nargs = 0 })
			vim.keymap.set("", "<M-\\>", ":CopilotToggle<CR>", { noremap = true, silent = true })
		end,
	},

	{ -- Github Copilot CMP integration
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
