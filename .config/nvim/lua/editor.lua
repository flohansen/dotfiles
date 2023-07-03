vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.cmd[[colorscheme rose-pine]]
vim.cmd[[highlight Normal ctermbg=none guibg=none]]
vim.cmd[[highlight NormalNC ctermbg=none guibg=none]]
vim.cmd[[highlight NvimTreeNormal ctermbg=none guibg=none]]

vim.g.airline_theme = 'deus'
vim.g.airline_powerline_fonts = 1
vim.g.prettier_autoformat = 1
vim.g.prettier_autoformat_require_pragma = 0

vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')
vim.keymap.set('n', '<leader>gd', '<Plug>(coc-rename)')
vim.keymap.set('n', '<leader>gD', '<Plug>(coc-implementation)')
vim.keymap.set('n', '<leader>gr', '<Plug>(coc-references)')

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
