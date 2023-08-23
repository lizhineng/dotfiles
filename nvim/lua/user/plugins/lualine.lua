return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = require('kanagawa.colors').setup()
    local theme = colors.theme

    require('lualine').setup {
      options = {
        theme = {
          normal = {
            a = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
            b = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
            c = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
          }
        },
        section_separators = '',
        component_separators = '',
        globalstatus = true
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' }
      }
    }
  end
}
