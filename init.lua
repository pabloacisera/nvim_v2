vim.g.mapleader=" "
-- ~/.config/nvim/init.lua o ~/.config/nvim/after/plugin/nvim-tree.lua

-- Mapeo para abrir el árbol lateral
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


vim.opt.number=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.autoindent=true


require "plugins"
