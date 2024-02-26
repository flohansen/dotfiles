vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.cmd[[colorscheme catppuccin]]
vim.cmd[[highlight Normal ctermbg=none guibg=none]]
vim.cmd[[highlight NormalNC ctermbg=none guibg=none]]
vim.cmd[[highlight NvimTreeNormal ctermbg=none guibg=none]]
vim.cmd[[autocmd FileType xml setlocal expandtab tabstop=2 shiftwidth=2]]

vim.g.airline_theme = 'deus'
vim.g.airline_powerline_fonts = 1
vim.g.prettier_autoformat = 1
vim.g.prettier_autoformat_require_pragma = 0

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)')

vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gD', '<Plug>(coc-implementation)')
vim.keymap.set('n', 'gr', '<Plug>(coc-references)')

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)

vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)

vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end)

require('nvim-tree').setup {
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("indent_blankline").setup {
}

require("lspconfig").pyright.setup {
}

require("dap-go").setup {
}
