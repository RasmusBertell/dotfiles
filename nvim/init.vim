call plug#begin(stdpath('data').'/pack')
    " Theme & colors
    Plug 'morhetz/gruvbox'
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'

    " Language syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'StanAngeloff/php.vim', {'for': 'php'}

    " Code completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'w0rp/ale'

    " IDE
    Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
    Plug 'vim-vdebug/vdebug'

    " Motions & actions
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Filesystem & multiplexer integration
    Plug 'tpope/vim-eunuch'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'melonmanchan/vim-tmux-resizer'
call plug#end()

" Theme
set termguicolors
colorscheme gruvbox

" Settings
set lazyredraw cursorline
set ignorecase smartcase
set splitright splitbelow
set number relativenumber
set signcolumn     =yes
set foldcolumn     =1
set foldlevelstart =1
set mouse          =nvc
set clipboard      =unnamedplus

" Scrolling & indentation
set {{#if tabspace}}shiftround expandtab {{/if}}smartindent
set scrolloff   ={{scrolloff}}
set tabstop     ={{tabwidth}}
set shiftwidth  ={{tabwidth}}
set softtabstop ={{tabwidth}}
set foldmethod  ={{folding}}

" Whitespace & width
set list listchars =tab:«-»,trail:·,nbsp:␣
set colorcolumn    ={{textwidth}}
set textwidth      ={{textwidth}}

" Airline
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Denite
autocmd FileType denite call s:denite_settings()
function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

" Deoplete
let g:deoplete#enable_at_startup  = 1
let g:deoplete#enable_ignore_case = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" omnifuncs
augroup omnifuncs
    au!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

" linting
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error         = ' '
let g:ale_sign_warning       = ' '
