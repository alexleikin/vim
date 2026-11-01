let mapleader=' '
syntax on
set belloff=all
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set background=dark
set showcmd
set incsearch
set hlsearch
set smartcase
set ignorecase
set mouse=v
filetype indent on
syntax enable
set encoding=UTF-8
set laststatus=2
" set showtabline=2

call plug#begin("~/.vim/plugged")

Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme catppuccin_macchiato

" Set some setting for python and yaml
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 nu expandtab
autocmd FileType python setlocal tabstop=2 softtabstop=2 shiftwidth=2 nu rnu
autocmd Filetype yaml,python let g:indentLine_char = '|'

" Execute Python script
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* loadview

" Draw the indentLine only for Yaml files
let g:indentLine_color_term = 255
let g:indentLine_fileTypeExclude = ['help', 'man', 'text', 'txt', '']

" Toggle Paste/NoPaste
set pastetoggle=<F3>

" Map split Horiz and Vert
nnoremap <leader>h :split<Space><CR>
nnoremap <leader>v :vsplit<Space><CR>
nnoremap <leader>k :ColorToggle<CR>
nnoremap <leader>i :tabn<CR>
nnoremap <leader>I :tabp<CR>
nnoremap <F6> :tab new<CR>
nnoremap <leader>r :RainbowToggle<CR>
nnoremap <leader>L :vertical resize +5<CR>
nnoremap <leader>l :vertical resize -5<CR>
nnoremap <leader>m :tabm +1<CR>
nnoremap <leader>M :tabm -1<CR>
nnoremap q :nohlsearch<CR>

" Toggle Auto Pairing
nnoremap <leader>P :let b:autopairs_enabled=1<CR>
nnoremap <leader>p :let b:autopairs_enabled=0<CR>
nnoremap <F2> :ColorToggle<CR>

map <leader>n :bnext<cr>
map <leader>o :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>e :Ex<cr>
map <leader>f <C-W>w
map <leader>s <C-W>r

" Toggle Insert/Remote Comments in Visual Mode
vnoremap <leader>c :s/^/# /<CR>:nohlsearch<CR>
vnoremap <leader>a :s/^#.//<CR>:nohlsearch<CR>

let g:lightline = {'colorscheme': 'catppuccin_mocha'}
let g:vim_json_conceal=0

let g:rainbow_active = 0
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
command! V normal! <C-v>
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

map <leader>b :Buffers<cr>
nnoremap <C-s> :Files<CR>
let g:fzf_vim = {}
let g:fzf_layout = { 'down': '40%' }

