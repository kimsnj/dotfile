" Plugin list
" ——————————
call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

Plug 'scrooloose/syntastic'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*binary-*--x86_64-unknown-linux-musl'}
Plug 'rust-lang/rust.vim'

call plug#end()

" Theme setup
" ——————————
set bg=dark
colorscheme nord
let g:nord_italic = 1
set relativenumber

" Usual editors behaviour
" ———————————————————————
set mouse=a
set clipboard+=unnamedplus

" ctrlp - ignore files in .gitignore
" ——————————————————————————————————
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Completion setup
" ————————————————
let g:deoplete#enable_at_startup = 1

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
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
}

nnoremap <silent> T :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Let's get rusty
let g:autofmt_autosave = 1

" NerdTree - Open automatically when no file
" —————————————————————————————————————————
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

source ~/.config/nvim/bepo.vim
