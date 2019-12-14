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

Plug 'scrooloose/nerdcommenter'
Plug 'djoshea/vim-autoread' "auto re-load files from disk
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular'
"Plug 'mileszs/ack.vim' #fzf
"Plug 'Chiel92/vim-autoformat' "ALEFix

"tree view
Plug 'scrooloose/nerdtree'

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
call plug#end()

let mapleader="\<SPACE>"
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
set undofile
set autoread
set autowriteall "auto write on buffer change
set clipboard=unnamed
au FocusLost * silent! wa "auto write on lost focus
"au BufWrite * :Autoformat "auto format on save

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
nnoremap <leader>p :Files<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>; :History:<cr>
nnoremap <Leader>f :Rg<Space>
nnoremap <Leader>q :qa!<CR>
nnoremap <Leader>x :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>d <Plug>(devdocs-under-cursor)
nnoremap <Leader>l :nohlsearch<CR> :ALEFix<CR>
nnoremap <Leader>e :nohlsearch<CR> :ALENextWrap<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gb :GFiles?<CR>
nnoremap <Leader>cp :let @+ = expand("%:p")<CR>
nnoremap <Leader>cr :let @+ = expand("%")<CR>
nnoremap <Leader>ct :!ctags -R .<CR>
nnoremap <Leader>fo :Goyo 140<CR>
nnoremap <Leader>, :e /Users/stefanl/.config/nvim/init.vim<CR>
nnoremap <Leader>. :source /Users/stefanl/.config/nvim/init.vim<CR>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\}

"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'python': ['/usr/local/bin/pyls'],
    "\ }

"command! -bang -nargs=* Rg
  "\ call fzf#vim#grep("rg --column --line-number --hidden --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, <bang>0)

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
