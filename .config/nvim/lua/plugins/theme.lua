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
      require('lspconfig').rust_analyzer.setup({
        cargo = {
            buildScripts = {
                enable = true,
            },
        },
      })
      require('lspconfig').gopls.setup({})
      require('lspconfig').bufls.setup({})
      require('lspconfig').clangd.setup({
          filetypes = {'c', 'cpp', 'objc', 'cuda'},
      })
      require('lspconfig').glslls.setup({})
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
        ensure_installed = { 'rust_analyzer', 'gopls', 'clangd', 'bufls' },
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
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup()
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup()
    end
  },
  {
      'nvim-treesitter/nvim-treesitter'
  },
  {
      'ray-x/go.nvim',
      config = function()
          require('go').setup()
      end,
      event = {'CmdlineEnter'},
      ft = {"go", "gomod"},
      build = ':lua require("go.install").update_all_sync()'
  }
}
