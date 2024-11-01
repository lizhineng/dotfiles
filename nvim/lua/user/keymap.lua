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

-- Clear the highlighting with escape key
map('n', '<Esc>', ':nohl<CR>')

-- Easy switching windows
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('t', '<C-j>', '<C-\\><C-n><C-w><C-j>')
map('t', '<C-k>', '<C-\\><C-n><C-w><C-k>')
map('t', '<C-h>', '<C-\\><C-n><C-w><C-h>')
map('t', '<C-l>', '<C-\\><C-n><C-w><C-l>')

-- Quick switch between buffers
map('n', '[b', ':bprevious<cr>')
map('n', ']b', ':bnext<cr>')
map('n', '[B', ':bfirst<cr>')
map('n', ']B', ':blast<cr>')

-- Open a terminal in a split
map('n', '<Leader>st', ':split | terminal<CR>')
map('n', '<Leader>vst', ':vsplit | terminal<CR>')
