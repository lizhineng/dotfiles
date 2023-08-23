return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]] },
    { '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = "All Files" })<cr>]] },
    { '<leader>g', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]] },
    { '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]] },
    { '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]] },
    { '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]] },
  },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = actions.close
          }
        }
      },
      pickers = {
        buffers = {
          previewer = false,
          layout_config = {
            width = 80
          }
        },
        oldfiles = {
          prompt_title = 'History',
          cwd_only = true
        }
      }
    })
  end
}
