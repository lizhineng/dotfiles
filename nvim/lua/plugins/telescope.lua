return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>f", [[<cmd>lua require('telescope.builtin').find_files()<cr>]] },
    { "<leader>F", [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = "All Files" })<cr>]] },
    { "<leader>b", [[<cmd>lua require('telescope.builtin').buffers()<cr>]] },
    { "<leader>h", [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]] },
    { "<leader>s", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]] },
  },
}
