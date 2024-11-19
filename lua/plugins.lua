vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Telescope para búsquedas avanzadas
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.8',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Treesitter para resaltado de sintaxis avanzado
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'nvim-treesitter/playground'

	-- LSP Config y Mason para gestionar servidores LSP
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig'
	}

	-- Complementos adicionales
	use 'hrsh7th/nvim-cmp' -- Autocompletado
	use 'hrsh7th/cmp-nvim-lsp' -- Fuente de autocompletado para LSP
	use 'onsails/lspkind.nvim' -- Iconos en autocompletado
    use 'kyazdani42/nvim-tree.lua'
end)

