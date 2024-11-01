vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true

-- Tree-sitter based folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.fillchars = {
  fold = ' ',
  foldopen = '',
  foldclose = '',
  foldsep = ' '
}

vim.opt.wrap = false

vim.opt.title = true

vim.opt.number = false
vim.opt.cmdheight = 0

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- use system clipboard
vim.opt.clipboard:append { 'unnamedplus' }

vim.opt.wildmode = 'longest:full,full'
vim.opt.completeopt = 'menuone,longest,preview'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = 'yes:1'

-- persistent undo
vim.opt.undofile = true

-- automatically save a backup file
vim.opt.backup = true

-- keep backups out of the current directory
vim.opt.backupdir:remove('.')

-- Enter insert mode when opening or switching back to a terminal
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
  pattern = 'term://*',
  command = 'startinsert'
})
