return {
  { 
      "morhetz/gruvbox",
      config = function()
        vim.g.gruvbox_contrast_dark = 'soft'
        vim.cmd [[ colorscheme gruvbox ]]
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
      'neovim/nvim-lspconfig',
      config = function()
          require('lspconfig').gopls.setup({})
          require('lspconfig').terraformls.setup({})
          require('lspconfig').jsonnet_ls.setup({})
          require('lspconfig').ts_ls.setup({})
          require('lspconfig').buf_ls.setup({})
      end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup()
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
      'williamboman/mason.nvim',
      dependencies = { 'williamboman/mason-lspconfig.nvim' },
      config = function()
          require('mason').setup()
          require('mason-lspconfig').setup({
            ensure_installed = { 'gopls', 'terraformls', 'jsonnet_ls', 'ts_ls', 'buf_ls' },
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
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(lp, opts)
      require("go").setup({})
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
        require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
