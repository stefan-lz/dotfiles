execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=" "

set t_Co=256
colorscheme jellybeans
"set gfn=Melno:h15

set nocompatible " Disable vi-compatibility

" yank into the global clipboard
set clipboard=unnamed

set mouse=a

" Setup tabs to 2, and expand with spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set scrolloff=10 "keep 10 lines above and below cursor if possible

" smartcase
" If you search for something containing uppercase characters, it will do a
" case sensitive search; if you search for something purely lowercase, it will
" do a case insensitive search. You can use \c and \C to override this:
" smartcase must be used with ignorecase
set ignorecase
set smartcase

" don't waste time or pollute the fs with backups
set nobackup
set noswapfile

" dont save file marks
set viminfo=f0,'50

"augroup CursorLine
  "au!
  "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "au WinLeave * setlocal nocursorline
"augroup END
set cursorline
set number
set relativenumber
set listchars=tab:▸\ ,eol:¬
set incsearch
set hlsearch

" Highlight trailing whitespace
" highlight ExtraWhitespace ctermbg=red guibg=red
match Error /\s\+\%#\@<!$/

" When searching ignore these files (command-t)
set wildignore+=*.o,*.obj,.git,tmp/**,bin/**,*.log,vendor/rails/**,node_modules/**,bundle/**,angular/node_modules/**,angular/app/components/**

" Save all on lost focus
" :au FocusLost * :wa
:au FocusLost * silent! wa
:au WinLeave * silent! wa
set autowrite

" disable auto commenting, its annoying
:au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" edit vimrc
nnoremap <Leader>vrc :e $MYVIMRC<CR>
" apply vimrc
nnoremap <Leader>arc :source $MYVIMRC<CR>

" insert timestamp
nnoremap <F8> "=strftime("%b %e %H:%M:%S")<CR>P
inoremap <F8> <C-R>=strftime("%b %e %H:%M:%S")<CR>

" run ctags
nnoremap <Leader>tag :!ctags -e -R lib app spec public config<CR>

" copy filename
nnoremap <Leader>cf :let @*=expand("%")<CR>
" copy path
nnoremap <Leader>cp :let @*=expand("%:p")<CR>
" copy path & line number
nmap <leader>cv :let @*=expand("%:p") . ':' . line(".")<CR>

" vim-rspec
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rn :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"
"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" vim-dash
"nmap <leader>d <Plug>DashSearch
"nmap <leader>d <Plug>DashGlobalSearch

" google
" vim-g
let g:vim_g_command = "G"
nmap <leader>g :G<cr>
let g:vim_g_f_command = "Gf"

" Don't Auto load NERDTree when no files are present
let g:NERDTreeHijackNetrw=0

" Setup syntax on files where it may be missing
" Set erb files to use html and erb snippets
au BufNewFile,BufRead *.html.erb setlocal ft=html.eruby
au BufNewFile,BufRead *.scss setlocal ft=css
au BufNewFile,BufRead Jakefile setlocal ft=javascript
au BufNewFile,BufRead *.mc setlocal ft=maxima

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>s :SyntasticToggle<CR>
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>
" nnoremap <Leader>j :BufExplorer<CR>

" Command-T
" map <D-t> :CtrlP<CR>
" nnoremap <silent> <leader>p :CtrlP<CR>
" let g:ctrlp_map = '<leader>p'
let g:CommandTFileScanner="find"
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>k :CommandT<CR>
" nnoremap <silent> <C-Space> :CommandT<CR> " this is my tmux leader key
nnoremap <silent> <Leader>i :CommandTTag<CR>

" nnoremap <silent> <Leader>y :CommandTBuffer<CR>
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

vmap <Leader>a <Plug>(EasyAlign)

" use ; instead of :
map ; :

" use q instead of :q
nmap q :q<CR>
nnoremap <Leader>q q

" last file
nnoremap <Leader>l :update<CR>:e#<CR>
map <Leader>j :BufExplorer<CR>

" previous and next files
"map <S-j> :bprevious<CR>
"map <S-k> :bnext<CR>

" jump between windows using ctrl
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>

" resize windows with < and >
"map <C-[> <C-W><
"map <C-]> <C-W>>

" emacs bindings
" normal mode, visual mode & insert mode
map <C-a> ^
map <C-e> $
map <C-b> <Left>
map <C-f> <Right>
map <C-p> <Up>
map <C-n> <Down>

" other emacs bindings in insert mode
imap <C-e> <Esc>A
imap <C-a> <Esc>I
" map <C-k> C "this is go to window above
imap <C-k> <Esc>C
imap <C-d> <Esc><Right>xi
imap <C-o> <Esc>o

" command-line mode
" plugin: vim-emacscommandline takes care of this for me
"cmap <C-a> <Home>
"cmap <C-e> <End>
"cmap <C-f> <Right>
"cmap <C-b> <Left>
"cmap <C-n> <Down>
"cmap <C-p> <Up>

"nmap 2 @
"nmap 3 #
"nmap 4 $
"nmap 5 %
"nmap 6 ^
"nmap 7 &
"nmap 8 *
"nmap 9 (
"nmap 0 )

"let g:Powerline_symbols = 'fancy'
"set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


"vim-textobj-rubyblock dependency
"runtime macros/matchit.vim

" ycm stuff
let g:ycm_confirm_extra_conf = 0

" Syntastic stuff
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" let g:syntastic_rb_checkers = ['ruby']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

