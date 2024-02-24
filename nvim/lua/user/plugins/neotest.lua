return {
  'nvim-neotest/neotest',
  dependencies = {
    'V13Axel/neotest-pest'
  },
  keys = {
    { '<leader>tn', function() require('neotest').run.run() end },
    { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end },
    { '<leader>tt', function() require('neotest').run.run({ suite = true }) end }
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-pest')({
          sail_enabled = function ()
            return False
          end
        })
      }
    })
  end
}
