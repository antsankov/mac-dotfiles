syntax on
set noerrorbells
set novisualbell
set visualbell t_vb=
set number
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set nowrap

autocmd! GUIEnter * set vb t_vb=

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
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

"http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start


" Color
set background=dark
colorscheme solarized

