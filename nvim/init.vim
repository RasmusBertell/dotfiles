call plug#begin(stdpath('data').'/pack')
    " Theme & colors
    Plug 'morhetz/gruvbox'
    Plug 'chrisbra/Colorizer'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " Code completion & language syntax
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ledger/vim-ledger'
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'vimwiki/vimwiki'
    Plug 'mattn/emmet-vim'
    Plug 'lervag/vimtex'

    " Motions & actions
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tommcdo/vim-lion'
    Plug 'justinmk/vim-sneak'

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
set foldcolumn =1
set mouse      =nvc
set clipboard  =unnamedplus

" Scrolling & indentation
{{#if tabspace}}set shiftround expandtab{{/if}}
set smartindent
set scrolloff   ={{scrolloff}}
set tabstop     ={{tabwidth}}
set shiftwidth  ={{tabwidth}}
set softtabstop ={{tabwidth}}
set foldmethod  ={{folding}}

" Whitespace & width
set list listchars =tab:«-»,trail:·,nbsp:␣
set colorcolumn    ={{textwidth}}
set textwidth      ={{textwidth}}

" Mappings
noremap <leader>b :Buffers<cr>
noremap <leader>q :wq<cr>
noremap <leader>/ :Rg<cr>
noremap <leader>e :call fzf#run(fzf#wrap({'source': 'fd --type f'}))<cr>

" Goyo
function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set-option status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    set noshowmode noshowcmd
    set signcolumn =no
    set scrolloff  =999
    Limelight
endfunction

function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set-option status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode showcmd
    set signcolumn =yes
    set scrolloff  ={{scrolloff}}
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
