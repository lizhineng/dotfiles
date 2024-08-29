return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = '^1.0.0'
    }
  },
  keys = {
    { '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]] },
    { '<leader>F', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = "All Files" })<cr>]] },
    { '<leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>]] },
    { '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]] },
    { '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]] },
    { '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]] },
  },
  config = function()
    local actions = require('telescope.actions')
    local lga = require('telescope-live-grep-args.actions')

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
      },
      extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ['<C-k>'] = lga.quote_prompt(),
              ['<C-i>'] = lga.quote_prompt({ postfix = ' --iglob ' }),
              ['<C-n>'] = actions.cycle_history_next,
              ['<C-p>'] = actions.cycle_history_prev,
            }
          }
        }
      }
    })
  end
}
