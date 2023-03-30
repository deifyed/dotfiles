-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- Navigation
	use({ -- Navigate project files
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})
	use('ThePrimeagen/harpoon') -- Mark and navigate buffers

    -- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

    -- Colors
	use({ -- Colorscheme
		'morhetz/gruvbox',
		as = 'gruvbox',
		config = function()
			vim.cmd('colorscheme gruvbox')
		end
	})
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) -- Syntax highlighting
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })

    -- Div
    use('editorconfig/editorconfig-vim') -- EditorConfig support
	use('mbbill/undotree') -- Treat undo history as git
	use('tpope/vim-fugitive') -- Git interface
    use('FooSoft/vim-argwrap') -- Multiline / singleline arguments
    use({ -- Github Copilot
        'zbirenbaum/copilot.lua',
        requires = {
            {'zbirenbaum/copilot-cmp'},
        }
    })
    use({
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
    })

    -- Personal
	use({ -- Organize information
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {{
                path = os.getenv("HOME") .. "/life/wiki",
            }}
        end
    })
    use('itchyny/calendar.vim')

    -- Languages
    use({
        'fatih/vim-go',
        run = ':GoUpdateBinaries'
    })
end)
