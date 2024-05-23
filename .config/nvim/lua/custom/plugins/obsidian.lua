return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- Use below if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Desktop/Obsidian/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Desktop/Obsidian/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Desktop/Obsidian",
			},
		},
	},
}
