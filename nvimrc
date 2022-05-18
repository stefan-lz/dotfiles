call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"Git support
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' "fugitive github
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdcommenter'
Plug 'djoshea/vim-autoread' "auto re-load files from disk
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular'
"Plug 'mileszs/ack.vim' #fzf
"Plug 'Chiel92/vim-autoformat' "ALEFix

"tree view
Plug 'scrooloose/nerdtree'

"tab rename
Plug 'gcmt/taboo.vim'

"distraction free
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"status line
Plug 'vim-airline/vim-airline'

"fuzzy finder support
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"linter support
Plug 'w0rp/ale'

"autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'rust-lang/rust.vim'
"Plug 'rizzatti/dash.vim'
Plug 'rhysd/devdocs.vim'
"Plug 'tonchis/vim-to-github'
Plug 'jparise/vim-graphql'

Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'plasticboy/vim-markdown' "slow
Plug 'lifepillar/pgsql.vim'

call plug#end()

let mapleader="\<SPACE>"
set timeoutlen=500
let base16colorspace=256  " Access colors present in 256 colorspace

"colorscheme base16-irblack
"colorscheme base16-default-light
"colorscheme base16-greenscreen
colorscheme base16-monokai

set hidden "Required for operations modifying multiple buffers like rename.
set ignorecase
set smartcase
set number
set nowrap
set virtualedit=all "Keep scroll position
set nostartofline "Keep scroll position
set undofile
set autoread
set autowriteall "auto write on buffer change
set clipboard=unnamed
" set foldmethod=syntax "folding bigger files is way too slow
" set foldlevelstart=99 "folding bigger files is way too slow
au FocusLost * silent! wa "auto write on lost focus
"au BufWrite * :Autoformat "auto format on save

" 1 space after commenting out
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:sql_type_default = 'pgsql'

"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 1

"autocmd BufWritePre * %s/\s\+$//e "remove trailing whitespace
let g:deoplete#enable_at_startup = 1
"let g:neosnippet#enable_completed_snippet = 1

"some emacs/terminal bindings
nnoremap <c-a> ^
vnoremap <c-a> ^
cnoremap <C-a> <C-b>
nnoremap <c-e> $
vnoremap <c-e> $
nnoremap <c-f> l
vnoremap <c-f> l
nnoremap <c-b> h
vnoremap <c-b> h

"leader key bindings
xmap <Leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
"nnoremap <leader>af :Autoformat<cr>
nnoremap <leader>p :Files<CR>
nnoremap <Leader>o :Files %:p:h<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>; :History:<CR>
nnoremap <Leader>f :Rg<Space>
nnoremap <Leader>q :qa!<CR>
nnoremap <Leader>x :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>d <Plug>(devdocs-under-cursor)
nnoremap <Leader>l :nohlsearch<CR> :ALEFix<CR>
nnoremap <Leader>e :nohlsearch<CR> :ALENextWrap<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gp :Git pull<CR>
nnoremap <Leader>gg :GFiles?<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gl :Git log -- %<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>cp :let @+ = expand("%:p")<CR>
nnoremap <Leader>cr :let @+ = expand("%")<CR>
nnoremap <Leader>cf :let @+ = expand("%:t")<CR>
nnoremap <Leader>sfo :setlocal foldmethod=syntax<CR>
nnoremap <Leader>nfo :setlocal nofoldenable<CR>
nnoremap <Leader>sp :setlocal spell<CR>
nnoremap <Leader>yo :Goyo 140<CR>
nnoremap <Leader>, :e /Users/stefanl/.config/nvim/init.vim<CR>
nnoremap <Leader>. :source /Users/stefanl/.config/nvim/init.vim<CR>

"tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'graphql': ['prettier'],
\   'sql': ['pgformatter'],
\   'ruby': ['rubocop'],
\}

"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" This will perform an Rg search for whole words only
command! -bang -nargs=* WRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --word-regexp ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" This will perform an Rg search from the project root of the current buffer
command! -bang -nargs=* PRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'dir': expand('%:p:h')}, <bang>0)

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" current work projects
nnoremap <Leader>zz :tabnew<CR>
\ :lcd /Users/stefanl/projects/orchestrated/people-mapper-ui<CR>
\ :TabooRename ui-app<CR>
\ :NERDTreeToggle<CR>
\ :Git<CR>
\ :tabnew<CR>
\ :lcd /Users/stefanl/projects/orchestrated/team-directory<CR>
\ :TabooRename ui-td<CR>
\ :NERDTreeToggle<CR>
\ :Git<CR>
\ :tabnew<CR>
\ :lcd /Users/stefanl/projects/orchestrated/orchestrated-graphql<CR>
\ :TabooRename api<CR>
\ :NERDTreeToggle<CR>
\ :Git<CR>
\ :tabnew<CR>
\ :lcd /Users/stefanl/projects/orchestrated/orchestrated-auth0<CR>
\ :TabooRename auth0<CR>
\ :NERDTreeToggle<CR>
\ :Git<CR>
\ :tabnew<CR>
\ :lcd /Users/stefanl/projects/orchestrated/orca-design-system<CR>
\ :TabooRename design-system<CR>
\ :NERDTreeToggle<CR>
\ :Git<CR>
\ :tabnew<CR>
\ :lcd /Users/stefanl/projects/orchestrated/orchestrated-graphql/scripts/queries<CR>
\ :TabooRename queries<CR>
\ :NERDTreeToggle<CR>
\ :1gt<CR>

