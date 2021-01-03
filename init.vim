call plug#begin(stdpath('data').'/pack')
    " Theme & colors
    Plug 'morhetz/gruvbox'
    Plug 'chrisbra/Colorizer'

    " Code completion & language syntax
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ledger/vim-ledger'
    Plug 'vimwiki/vimwiki'

    " Motions & actions
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tommcdo/vim-lion'

    " Navigation & filesystem
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-eunuch'
    Plug 'romainl/vim-qf'
call plug#end()

" Theme
set termguicolors
colorscheme gruvbox

" Settings
set lazyredraw
set ignorecase smartcase
set splitright splitbelow
set number relativenumber
set signcolumn =yes
set mouse      =nvc

" Scrolling & indentation
set expandtab shiftround smartindent
set scrolloff   =4
set tabstop     =4
set shiftwidth  =4
set softtabstop =4
set foldmethod  =syntax

" Whitespace & width
set list listchars =tab:«-»,trail:·,nbsp:␣
set colorcolumn    =80
set textwidth      =80

" Mappings
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>b :Buffers<cr>
noremap <leader>q :wq<cr>
noremap <leader>e :call fzf#run(fzf#wrap({'source': 'fd --type f'}))<cr>
noremap <leader>/ :Rg<cr>

" VimWiki
let g:vimwiki_list = [{"path": "~/documents/wiki/"}]
