return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,    --   config = function()    --     vim.cmd.colorscheme 'catppuccin'    --   end,
  -- },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'gruvbox'
  --   end,
  -- },
  {
    'savq/melange-nvim',
    config = function()
      vim.cmd.colorscheme 'melange'
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'kiennt63/harpoon-files.nvim',
    dependencies = {
      { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
      {
        'nvim-lualine/lualine.nvim',
      },
    },
    config = function()
      local harpoon_files = require 'harpoon_files'

      require('lualine').setup {
        sections = {
          lualine_c = {
            { harpoon_files.lualine_component },
          },
        },
      }
    end,
  },
}
