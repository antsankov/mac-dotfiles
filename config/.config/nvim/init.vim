set noerrorbells
set novisualbell
set number
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set nowrap
set mouse=a

" flake8 on py save
autocmd BufWritePost *.py call Flake8()

" remove extra whitespace on python
autocmd BufWritePre *.py %s/\s\+$//e

" run gofmt on save
au BufWritePost *.go !gofmt -w %


" vim-plug
call plug#begin('~/.config/nvim/plugins')
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'jordwalke/flatlandia'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-airline/vim-airline'
Plug 'neovimhaskell/haskell-vim', { 'for': 'hs' }
" Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/ConradIrwin/vim-bracketed-paste'
call plug#end()

" NERDtree
" CTRL-n open
map <C-n> :NERDTreeToggle<CR>
" close vim if nerdtree is only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-go
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" elm-vim
let g:elm_format_autosave = 1

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Color
syntax on
filetype plugin indent on
" colorscheme solarized

set mouse=

vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
