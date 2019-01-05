" Avoid clashes with fish
set shell=/bin/bash

" Plugin list
" ——————————
call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'

Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'rust-lang/rust.vim'

call plug#end()

" Theme setup
" ——————————
set bg=dark
colorscheme nord
let g:nord_italic = 1
set cursorline
set relativenumber
set colorcolumn=100
set termguicolors
let g:nord_comment_brightness = 12

" Airline
" ––––––––
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Usual editors behaviour
" ———————————————————————
set mouse=a
set clipboard+=unnamedplus

" Completion setup
" ——————————— —————
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Warning display
" ——————————————
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" LSP setup
" ————————
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \}

nnoremap <silent> T :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

let g:autofmt_autosave = 1

map <C-n> :NERDTreeToggle<CR>

" General
" ———————
let mapleader=" "
let g:mapleader=" "

set history=500

filetype plugin on
filetype indent on

set encoding=utf8
set ffs=unix,dos,mac

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" search behaviour
set ignorecase " case insensitive ...
set smartcase  " ... except when mixing case in input
set hlsearch   " highlight result
set incsearch  " go to results while typing

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Fuzzy find shortcuts
nmap <leader>ff :Files<CR>
nmap <leader>fr :Rg<CR>
nmap <leader>bb :Buffers<CR>

" Extra leader bindings
" remove highlighting:
map <silent> <leader><cr> :noh<cr>
" quick save
nmap <leader>fs :w<CR>
" buffer navigation
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bd :bdelete<CR>

" be quiet
set noerrorbells
set novisualbell

" Autoreads when file change from the outside
set autoread

" Return to last edit position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

inoremap ,, <esc>
vnoremap ,, <esc>
source ~/.config/nvim/bepo.vim

" Default tabs: 4 spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai "autoident
set si "smartident

" Sometimes, I only want 2 spaces
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType hpp setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab

" Persistent undo
try
    set undodir=~/.cache/nvim/undodir
    set undofile
catch
endtry

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
