return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]parenthen
			--  - vib  - [V]isually select [I]nside [B]rackets (I think any)
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			local gen_spec = require("mini.ai").gen_spec
			require("mini.ai").setup({
				custom_textobjects = {
					-- Tweak argument to be recognized only inside `()`
					a = gen_spec.argument({
						brackets = { "%b()" },
						-- separator = ';' -- and between ';'
					}),
					-- Function definition (needs treesitter queries with these captures)
					f = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					-- Conditional/Loop definition
					o = gen_spec.treesitter({
						a = { "@conditional.outer", "@loop.outer" },
						i = { "@conditional.inner", "@loop.inner" },
					}),
					-- Make `|` select both edges in non-balanced way
					["|"] = gen_spec.pair("|", "|", { type = "non-balanced" }),
				},
				n_lines = 500,
			})

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			local statusline = require("mini.statusline")
			statusline.setup()

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we disable the section for
			-- cursor information because line numbers are already enabled
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return ""
			end

			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
