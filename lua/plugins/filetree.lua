-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts opts = {},
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '\\', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ['P'] = {
              'toggle_preview',
              config = {
                use_float = true,
                use_snacks_image = true,
                use_image_nvim = true,
              },
            },
          },
        },
      },
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        event_handlers = {
          {
            event = 'neo_tree_buffer_enter',
            handler = function(arg)
              vim.cmd [[
          setlocal relativenumber
        ]]
            end,
          },
        },
      }
    end,
  },
}
