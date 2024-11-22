return {
	-- consider changing to nvim-dap and making this a generic debug config
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local ui = require("dapui")

		require("dap-go").setup()
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({
			display_callback = function(variable)
				if #variable.value > 75 then
					return " " .. string.sub(variable.value, 1, 75) .. "... "
				end

				return " " .. variable.value
			end,
		})

		vim.keymap.set("n", "<leader>b", "<CMD> DapToggleBreakpoint <CR>", { desc = "Toggle Debugger [B]reakpoint" })
		vim.keymap.set("n", "<leader>bc", "<CMD> DapContinue <CR>", { desc = "Debugger [B]reakpoint [C]ontinue" })
		vim.keymap.set("n", "<leader>bso", "<CMD> DapStepOver <CR>", { desc = "Debugger [B]reakpoint [S]tep [O]ver" })
		vim.keymap.set("n", "<leader>bsi", "<CMD> DapStepInto <CR>", { desc = "Debugger [B]reakpoint [S]tep [I]nto" })

		-- Eval var under cursor
		vim.keymap.set("n", "<space>?", function()
			ui.eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<leader>dus", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open [D]ebug [U]i [S]idebar" })
		vim.keymap.set("n", "<leader>dgt", function()
			require("dap-go").debug_test()
		end, { desc = "[D]ebug [G]o [T]est" })

		---@diagnostic disable-next-line: undefined-field
		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		---@diagnostic disable-next-line: undefined-field
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		---@diagnostic disable-next-line: undefined-field
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		---@diagnostic disable-next-line: undefined-field
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end
	end,
}
