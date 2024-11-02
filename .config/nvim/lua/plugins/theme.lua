return {
  -- Core Plugins
  {
      'neovim/nvim-lspconfig',
      config = function()
          require('nvim-lspconfig').gopls.setup({})
          require('nvim-lspconfig').clangd.setup({})
      end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
      'hrsh7th/nvim-cmp',
      config = function()
          local cmp = require('cmp')
          cmp.setup({
            sources = { { name = 'nvim_lsp' } },
            mapping = cmp.mapping.preset.insert({
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            })
          })
      end,
  },
  {
      'nvim-telescope/telescope.nvim',
      config = function()
          require('telescope').setup()
      end
  },
  {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
          require('nvim-tree').setup()
      end
  },
  {
      'lukas-reineke/indent-blankline.nvim',
      main = "ibl",
      config = function()
          require('ibl').setup()
      end
  },
  {
      'nvim-treesitter/nvim-treesitter',
      config = function()
          require('nvim-treesitter.configs').setup({
            ensure_installed = { 'go' },
            highlight = { enable = true },
          })
      end
  },
  {
      'ray-x/go.nvim',
      config = function()
          require('go').setup()
      end
  },
  { 
      'rose-pine/neovim',
      priority = 1000,
      config = function()
          vim.cmd([[colorscheme rose-pine]])
      end
  },
  {
      'williamboman/mason.nvim',
      dependencies = { 'williamboman/mason-lspconfig.nvim' },
      config = function()
          require('mason').setup()
          require('mason-lspconfig').setup({
            ensure_installed = { 'gopls', 'clangd' },
            automatic_installation = true,
          })
      end
  },
  {
      'mfussenegger/nvim-dap',
      dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio', 'theHamsta/nvim-dap-virtual-text', 'ray-x/guihua.lua' },
      config = function()
          require('nvim-dap-virtual-text').setup()
          require('guihua.maps').setup()
      end
  },
}
