-- [[ Basic Keymaps ]]
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Quick Actions
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open [E]xplorer" })

-- Find and Replace word under cursor
vim.keymap.set("n", "<leader>S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Search and replace word under cursor" })

-- Redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Esc Keymaps
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keybinds to move vertically
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page" })

-- Keybinds to move between wrapped lines
vim.keymap.set("n", "j", "v:count ? 'j' : 'gj'", { expr = true, desc = "Move down wrapped lines" })
vim.keymap.set("n", "k", "v:count ? 'k' : 'gk'", { expr = true, desc = "Move up wrapped lines" })

-- Keybinds to yank to and paste from system clipboard
vim.keymap.set("n", "<leader>y", '"*y', { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>Y", '"*Y', { desc = "Yank Line to System Clipboard" })
vim.keymap.set("v", "<leader>y", '"*y', { desc = "Yank to System Clipboard in Visual Mode" })
vim.keymap.set("v", "<leader>Y", '"*Y', { desc = "Yank Line to System Clipboard in Visual Mode" })
vim.keymap.set("n", "<leader>p", '"*p', { desc = "Paste from System Clipboard" })
vim.keymap.set("n", "<leader>P", '"*P', { desc = "Paste before cursor from System Clipboard" })
vim.keymap.set("v", "<leader>p", '"*p', { desc = "Paste from System Clipboard in Visual Mode" })
vim.keymap.set("v", "<leader>P", '"*P', { desc = "Paste before cursor from System Clipboard in Visual Mode" })

-- Go Errors
vim.keymap.set(
	"n",
	"<leader>ee",
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
	{ desc = "Golang quick [E]rror handling" }
)

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
