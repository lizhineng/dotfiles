vim.g.mapleader = ','

-- Make it easy to edit VIM config file
vim.keymap.set('n', '<Leader>ev', ':tabedit $MYVIMRC<cr>')

-- Toggle the display of line number
vim.keymap.set('n', '<c-n>', ':set number!<cr>')

-- Easy switching windows
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

-- Quick switch between buffers
vim.keymap.set('n', '[b', ':bprevious<cr>', { silent = true, noremap = true })
vim.keymap.set('n', ']b', ':bnext<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '[B', ':bfirst<cr>', { silent = true, noremap = true })
vim.keymap.set('n', ']B', ':blast<cr>', { silent = true, noremap = true })
