return {
	{
		"gelguy/wilder.nvim",
		config = function()
			local wilder = require("wilder")

			wilder.setup({
				modes = { ":" },
				next_key = "<Tab>",
				previous_key = "<S-Tab>",
			})

			-- Enable fuzzy matching for commands and buffers
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({
						-- 0 turns off fuzzy matching
						-- 1 turns on fuzzy matching
						-- 2 partial fuzzy matching (match does not have to begin with the same first letter)
						fuzzy = 1,
					}),
					wilder.python_search_pipeline({
						-- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
						pattern = wilder.python_fuzzy_pattern(),
						-- omit to get results in the order they appear in the buffer
						sorter = wilder.python_difflib_sorter(),
						-- can be set to 're2' for performance, requires pyre2 to be installed
						-- see :h wilder#python_search() for more details
						engine = "re",
					})
				),
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					-- 'single', 'double', 'rounded' or 'solid'
					-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
					border = "rounded",
					min_height = "25%",
					max_height = "25%",
					pumblend = 20,
					highlighter = wilder.basic_highlighter(),
					highlights = {
						border = "Normal",
						--- accent
						accent = wilder.make_hl(
							"WilderAccent",
							"Pmenu",
							{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
						),
					},
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}))
			)
		end,
	},
}
