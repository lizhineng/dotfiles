return {
  "NvChad/nvterm",
  keys = {
    { '<F1>', function () require('nvterm.terminal').toggle('float') end, mode = {'n', 't'} },
  },
  opts = {
    terminals = {
      type_opts = {
        float = {
          row = 0,
          col = 0,
          width = 1,
          height = 1,
          border = 'none'
        }
      }
    }
  }
}
