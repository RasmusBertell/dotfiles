call plug#begin(stdpath('data').'/pack')
    " Theme & colors
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'

    " Language syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'StanAngeloff/php.vim', {'for': 'php'}

    " Code completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
    Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
    Plug 'phpactor/phpactor', { 'do': ':call phpactor#Update()', 'for': 'php'}
    Plug 'SirVer/ultisnips'
    Plug 'phux/vim-snippets'
    Plug 'w0rp/ale'

    " IDE
    Plug 'mhinz/vim-startify'
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-vdebug/vdebug'

    " Motions & actions
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-abolish'

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
set cmdheight      =2
set updatetime     =300
set shortmess     +=c
let g:php_folding  = 2

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
let g:airline_theme                        = "gruvbox"
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"

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
let g:deoplete#enable_at_startup          = 1
let g:deoplete#enable_ignore_case         = 1
let g:neosnippet#enable_completed_snippet = 1

inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

augroup omnifuncs
    au!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

" ALE
let g:ale_lint_on_text_changed  = "never"
let g:ale_lint_on_enter         = 0
let g:ale_echo_msg_format       = "[%linter%] %s [%severity%]"
let g:ale_open_list             = 1
let g:ale_keep_list_window_open = 0
let g:ale_set_quickfix          = 0
let g:ale_list_window_size      = 5
let g:ale_php_phpcbf_standard   = "PSR2"
let g:ale_php_phpcs_standard    = "phpcs.xml.dist"
let g:ale_php_phpmd_ruleset     = "phpmd.xml"
let g:ale_completion_enabled    = 1
let g:ale_sign_column_always    = 1
let g:ale_fix_on_save           = 1
let g:ale_sign_error            = " "
let g:ale_sign_warning          = " "
let g:ale_fixers                = {
    \ "*"  : [ "remove_trailing_lines", "trim_whitespace" ],
    \ "php": [ "phpcbf", "php_cs_fixer", "remove_trailing_lines", "trim_whitespace" ],
\}

" Ultisnip
let g:UltiSnipsExpandTrigger        = "<c-j>"
let g:UltiSnipsJumpForwardTrigger   = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-b>"
let g:ultisnips_php_scalar_types    = 1

" PHP Code Sniffer
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=symfony<cr>

" PHP Refactoring
let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility   = 'private'
let g:vim_php_refactoring_auto_validate_visibility    = 1
let g:vim_php_refactoring_phpdoc                      = "pdv#DocumentCurrentLine"
let g:vim_php_refactoring_use_default_mapping         = 0

nnoremap <leader>rlv :call PhpRenameLocalVariable()<CR>
nnoremap <leader>rcv :call PhpRenameClassVariable()<CR>
nnoremap <leader>rrm :call PhpRenameMethod()<CR>
nnoremap <leader>reu :call PhpExtractUse()<CR>
vnoremap <leader>rec :call PhpExtractConst()<CR>
nnoremap <leader>rep :call PhpExtractClassProperty()<CR>
nnoremap <leader>rnp :call PhpCreateProperty()<CR>
nnoremap <leader>rdu :call PhpDetectUnusedUseStatements()<CR>
nnoremap <leader>rsg :call PhpCreateSettersAndGetters()<CR>

" PHPActor
let g:phpactorPhpBin      = "/usr/bin/php7.3"
let g:phpactor_executable = '~/.config/nvim/plugged/phpactor/bin/phpactor'

nnoremap <m-m> :call phpactor#ContextMenu()<cr>
nnoremap gd :call phpactor#GotoDefinition()<CR>
nnoremap gr :call phpactor#FindReferences()<CR>
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
nnoremap <silent><Leader>rei :call phpactor#ClassInflect()<CR>

" NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" FZF
noremap <leader>b :Buffers<cr>
noremap <leader>q :wq<cr>
noremap <leader>/ :Rg<cr>
noremap <leader>e :call fzf#run(fzf#wrap({'source': 'fd --type f'}))<cr>
