local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('kyazdani42/nvim-tree.lua')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('lukas-reineke/indent-blankline.nvim')
Plug('prettier/vim-prettier')
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })
Plug('rose-pine/neovim')
Plug('morhetz/gruvbox')
Plug('rust-lang/rust.vim')
Plug('neovim/nvim-lspconfig')
Plug('mfussenegger/nvim-dap')
Plug('leoluz/nvim-dap-go')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.2' })
Plug('mustache/vim-mustache-handlebars')
Plug('tpope/vim-fugitive')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('hashivim/vim-terraform')
vim.call('plug#end')
