return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSUpdateSync' },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { 'lua', 'php', 'phpdoc' },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      }
    }
  end
}
