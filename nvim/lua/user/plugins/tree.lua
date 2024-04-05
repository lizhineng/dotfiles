local HEIGHT_RATIO = 0.8  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

local function tree_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local mappings = {
    ['<CR>'] = { api.node.open.edit, "Open" },
    ['a'] = { api.fs.create, "Create" },
    ['d'] = { api.fs.remove, "Delete" },
    ['g?'] = { api.tree.toggle_help, "Help" },
    ['gJ'] = { api.node.navigate.sibling.last, "Last Sibling" },
    ['gj'] = { api.node.navigate.sibling.next, "Next Sibling" },
    ['gK'] = { api.node.navigate.sibling.first, "First Sibling" },
    ['gk'] = { api.node.navigate.sibling.prev, "Previous Sibling" },
    ['gp'] = { api.node.navigate.parent, "Go to Parent Directory" },
    ['h'] = { api.node.navigate.parent_close, "Collapse" },
    ['H'] = { api.tree.collapse_all, "Collapse All" },
    ['o'] = { api.node.open.edit, "Open" },
    ['q'] = { api.tree.close, "Close" },
    ['r'] = { api.fs.rename, "Rename" },
    ['R'] = { api.tree.reload, "Refresh" },
    ['y'] = { api.fs.copy.filename, "Copy Name" },
  }

  for keys, mapping in pairs(mappings) do
    vim.keymap.set('n', keys, mapping[1], opts(mapping[2]))
  end
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader><leader>', '<cmd>NvimTreeFindFileToggle<cr>' },
  },
  config = function()
    require('nvim-tree').setup {
      on_attach = tree_attach,
      view = {
        centralize_selection = true,
        float = {
          enable = true,
          open_win_config = function ()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                             - vim.opt.cmdheight:get()

            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int
            }
          end,
        },
        width = function ()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
    }
  end
}
