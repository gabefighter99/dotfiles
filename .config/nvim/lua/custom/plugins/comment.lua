return {
	-- use `opts = {}` to force a plugin to be loaded.
	--
	--  this is equivalent to:
	--    require('comment').setup({})

	-- "gc" to comment visual regions/lines
	{ "numtostr/comment.nvim", opts = {} },
}
