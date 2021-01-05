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
{{#if tabspace}}set shiftround expandtab{{/if}}
set smartindent
set scrolloff   =4
set tabstop     ={{tabwidth}}
set shiftwidth  ={{tabwidth}}
set softtabstop ={{tabwidth}}
set foldmethod  =syntax

" Whitespace & width
set list listchars =tab:«-»,trail:·,nbsp:␣
set colorcolumn    ={{textwidth}}
set textwidth      ={{textwidth}}

" Mappings
noremap <leader>b :Buffers<cr>
noremap <leader>q :wq<cr>
noremap <leader>/ :Rg<cr>
noremap <leader>e :call fzf#run(fzf#wrap({'source': 'fd --type f'}))<cr>