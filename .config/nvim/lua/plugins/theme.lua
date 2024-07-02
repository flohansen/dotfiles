return {
  -- the colorscheme should be available when starting Neovim
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').rust_analyzer.setup({})
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'rust_analyzer' },
	automatic_installation = true,
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
	  { name = 'nvim_lsp' },
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }),
	})
      })
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>')
      require('nvim-tree').setup()
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup()

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action)
    end
  }
}
