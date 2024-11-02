return {
  {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').gopls.setup({})
      require('lspconfig').clangd.setup({})
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
        ensure_installed = { 'gopls', 'clangd' },
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
      'mfussenegger/nvim-dap',
  },
  {
      'rcarriga/nvim-dap-ui',
      dependencies = {
          'mfussenegger/nvim-dap',
          'nvim-neotest/nvim-nio',
          'theHamsta/nvim-dap-virtual-text',
          'ray-x/guihua.lua',
      },
      config = function()
          require('nvim-dap-virtual-text').setup()
          require('guihua.maps').setup()
      end,
  },
  {
      'ray-x/go.nvim',
      dependencies = {
          'nvim-treesitter/nvim-treesitter'
      },
      config = function()
          require('go').setup()
          require('nvim-treesitter.configs').setup({
              ensure_installed = { 'go' },
              highlight = {
                  enable = true,
              },
          })
      end,
      event = {'CmdlineEnter'},
      ft = {"go", "gomod"},
      build = ':lua require("go.install").update_all_sync()'
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        require('ibl').setup()
    end
  }
}
