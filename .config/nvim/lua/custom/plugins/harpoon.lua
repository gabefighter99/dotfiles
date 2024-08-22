return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "[A]dd Buffer to Harpoon" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "List Harpoon Buffers" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon Select Buffer 1" })
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon Select Buffer 2" })
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon Select Buffer 3" })
		vim.keymap.set("n", "<C-;>", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon Select Buffer 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon Select Previous Buffer" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Harpoon Select Next Buffer" })
	end,
}
