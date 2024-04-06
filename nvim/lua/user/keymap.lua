--- Adds a new keymap
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Redefine the leader key
vim.g.mapleader = ','

-- Make it easy to edit VIM config file
map('n', '<Leader>ev', ':tabedit $MYVIMRC<cr>')

-- Toggle the display of line number
map('n', '<c-n>', ':set number!<cr>')

-- Easy switching windows
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')

-- Quick switch between buffers
map('n', '[b', ':bprevious<cr>')
map('n', ']b', ':bnext<cr>')
map('n', '[B', ':bfirst<cr>')
map('n', ']B', ':blast<cr>')
