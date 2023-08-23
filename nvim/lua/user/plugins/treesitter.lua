return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSUpdateSync' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = 'all',
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      }
    })
  end
}
