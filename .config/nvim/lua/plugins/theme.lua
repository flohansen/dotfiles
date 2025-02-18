return {
  -- Core Plugins
  {
      'neovim/nvim-lspconfig',
      config = function()
          require('lspconfig').gopls.setup({})
          require('lspconfig').clangd.setup({
              filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          })
          require('lspconfig').terraformls.setup({})
          require('lspconfig').jsonnet_ls.setup({})
          require('lspconfig').tsserver.setup({})
          require('lspconfig').bufls.setup({})
      end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup({
            open_mapping = [[<leader>t]],
        })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup()
    end
  },
  {
    "mellow-theme/mellow.nvim", 
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme mellow]])
      vim.cmd [[
        highlight Normal guibg=none
        highlight NormalNC guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
      ]]
    end
  },
  {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
          "LazyGit",
          "LazyGitConfig",
          "LazyGitCurrentFile",
          "LazyGitFilter",
          "LazyGitFilterCurrentFile",
      },
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
      keys = {
          { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
  },
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
            ensure_installed = { 'go', 'terraform', 'jsonnet', 'yaml', 'proto' },
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
      'williamboman/mason.nvim',
      dependencies = { 'williamboman/mason-lspconfig.nvim' },
      config = function()
          require('mason').setup()
          require('mason-lspconfig').setup({
            ensure_installed = { 'gopls', 'clangd', 'terraformls', 'jsonnet_ls', 'tsserver', 'bufls' },
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
