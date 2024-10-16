require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		sh = { 'shfmt' },
	},
	format_on_save = {
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	},
})

vim.keymap.set({ 'n', 'v' }, '<leader>fp', function()
	require('conform').format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = 'Format file or range (in visual mode)' })
