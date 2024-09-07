local map = vim.api.nvim_set_keymap
DefaultOptions = { noremap = true, silent = true }
ExprOptions = { noremap = true, expr = true, silent = true }

-- hack for microsoft terminal
vim.cmd("command! Vblock normal! <C-v>")
map("n", "tv", ":Vblock<CR>", DefaultOptions)

-- center search results
map("n", "n", "nzz", DefaultOptions)
map("n", "N", "Nzz", DefaultOptions)

-- Deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", ExprOptions)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", ExprOptions)

-- better indenting
map("v", "<", "<gv", DefaultOptions)
map("v", ">", ">gv", DefaultOptions)

-- paste over currently selected text without yanking it
map("v", "p", '"_dP', DefaultOptions)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", DefaultOptions)

-- Switch tab
map("n", "<C-Left>", ":tabprevious<CR>", DefaultOptions)
map("n", "<C-Right>", ":tabnext<CR>", DefaultOptions)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", DefaultOptions)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", DefaultOptions)
map("x", "J", ":move '>+1<CR>gv-gv", DefaultOptions)

function EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

map("i", "<C-l>", "<cmd>lua EscapePair()<CR>", DefaultOptions)

function GitLinesHistory()
	local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
	local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
	vim.api.nvim_command(string.format("vertical Git log --oneline --no-patch -L%d,%d:%%", start_row, end_row))
end

map("v", "x", ":lua git_lines_history()<CR>", DefaultOptions)

-- don't paste in select mode when press 'p'
map("s", "p", "p", DefaultOptions)

function OpenHelp()
	local cword = vim.fn.expand("<cword>")
	vim.cmd("h " .. cword)
end

map("n", "<C-h>", "<cmd>lua open_help()<CR>", DefaultOptions)
