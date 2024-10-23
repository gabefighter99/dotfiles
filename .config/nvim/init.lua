vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.USE_SYSTEM_GO = 1
-- [[ basic options ]]
require("options")

-- [[ basic keymaps ]]
require("keymaps")

-- [[ install `lazy.nvim` plugin manager ]]
--    see `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ configure and install plugins ]]
--
--  to update plugins, you can run
--    :lazy update
require("lazy").setup({
	"tpope/vim-sleuth", -- detect tabstop and shiftwidth automatically

	"maxmellon/vim-jsx-pretty",

	require("custom/plugins/comment"),

	require("custom/plugins/nohlsearch"),

	require("custom/plugins/gitsigns"),

	require("custom/plugins/which-key"),

	require("custom/plugins/telescope"),

	require("custom/plugins/lsp"),

	require("custom/plugins/auto-conform"),
	-- require("custom/plugins/nvim-lint"),
	-- require("custom/plugins/none-ls"),

	require("custom/plugins/cmp"),

	require("custom/plugins/colorscheme"),

	require("custom/plugins/dressing"),

	-- highlight todo, notes, etc in comments
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = { signs = false } },

	--require("custom/plugins/copilot"),

	require("custom/plugins/mini"),

	require("custom/plugins/treesitter"),

	require("custom/plugins/wilder"),

	require("custom/plugins/obsidian"),

	require("custom/plugins/oil"),

	-- Or just:
	-- { import = 'custom.plugins' },
})
