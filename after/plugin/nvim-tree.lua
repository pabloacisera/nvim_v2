-- ~/.config/nvim/after/plugin/nvim-tree.lua

-- Cargar el plugin
local nvim_tree = require('nvim-tree')

-- Configuración básica de nvim-tree
nvim_tree.setup({
  -- Mostrar archivo en el árbol
  view = {
    width = 30,
    side = 'left',
  },
  -- Otras configuraciones, como el comportamiento de los archivos
  git = {
    enable = true,
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folders = true,
        files = true,
      },
    },
  },
})

-- Mapeo para mover el cursor entre ventanas con Ctrl + j y Ctrl + k
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


