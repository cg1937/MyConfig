require('nvim-file-location').setup({
	keymap = '<leader>cl',
	mode = 'absolute', -- options: workdir | absolute
	add_line = true,
	add_column = false,
	default_register = '*',
})
