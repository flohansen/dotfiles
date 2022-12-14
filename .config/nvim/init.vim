call plug#begin('~/.config/nvim/pack')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'prettier/vim-prettier'
    Plug 'shaunsingh/moonlight.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-test/vim-test'
    Plug 'projekt0n/github-nvim-theme'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'martinsione/darkplus.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

syntax on
filetype plugin indent on

set number        " show line numbers
set expandtab     " replace tabs with spaces
set tabstop=4     " make one tab be 4 spaces
set shiftwidth=4  " make one tab be 4 spaces
set nowrap
set termguicolors

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ===== colorscheme
colorscheme darkplus

" ===== vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" ===== vim-airline
let g:airline_powerline_fonts = 1 " enable powerline fonts inside nvim
let g:airline_theme = 'deus'

" ===== ctrlp.vim
let g:ctrlp_working_mode = 0
let g:ctrlp_map = '<C-f>'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'venv\|node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
map <leader>j :CtrlP<cr>
map <C-b> :CtrlPBuffer<cr>

" ===== nvimtree
map <leader>nn :NvimTreeToggle<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ====" ===== coc.nvim
set updatetime=300

lua << EOF
require'nvim-tree'.setup {
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
