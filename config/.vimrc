"##############################################################" 
"
" DD Vim Configuration
"
" Danilo Dellaquila K-Gigas Computers S.L.
"
" This is the personal Vim configuration of Danilo Dellaquila.
"
" File: vimrc
"
"##############################################################"

" General Settings {

    " We use Vim settings
    set nocompatible        " Must be the first line

    " Set DD Vim Configuration path
    let $DDPATH=$HOME."/.dd-vim"
    " Uncomment the next 4 lines if you use GVim in Windows
    "if has('gui_running')
    "    " Set DD Vim Configuration path
    "    let $DDPATH="H:\.dd-vim"
    "endif

    " Disable backup
    set nobackup
    set nowritebackup

    " Set some search options
    "set incsearch
    set ignorecase
    set hlsearch
    " remap space to clear highlight
    nmap <SPACE> <SPACE>:noh<CR>

    " Spell Checking
    set nospell
    set spelllang=en,es,it
    set spellsuggest=5

    " Setup Vundle Support {

        filetype off            " Required by Vundle
        "  set the runtime path to include Vundle and initialize
        set rtp+=$DDPATH/bundle/Vundle.vim
        " Uncomment this if you use GVim in Windows
        "if has('gui_running')
        "    set rtp+=H:\.dd-vim\bundle\Vundle.vim
        "    let path='H:\.dd-vim\bundle'
        "    call vundle#begin(path)
        "else
            call vundle#begin()
        "endif

        " Let Vundle manage Vundle, this is required
        Plugin 'gmarik/Vundle.vim'

    " }

" }

" Formatting {

    " Set maximum width of text line
    set textwidth=72

    " Tabs settings
    set expandtab
    set tabstop=4
    set shiftwidth=4

    " Automatic Indentation
    set autoindent
    set shiftwidth=4

" }

" Programming Settings {

    " Set backspace key working properly
    set backspace=indent,eol,start

    " Set folding method and leave all folds open
    set fdm=indent
    set foldlevel=99

    " Enconding text
    set encoding=utf8

    " Syntax
    syntax on

" }

" Vim UI {

    " Color Scheme and Background
    colorscheme default
    "set background=light
    set background=dark

    " Statusline
    set laststatus=2
    set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASCII=\%03.3b\ HEX=\%02.2B]\ [POS=%04l,%04v\ %p%%\ %L]

    " Line numbers
    set number

    " Set visual bell
    set vb

    " Disable mouse in a terminal
    set mouse=

" }

" GVim GUI {

    " Set useful settings for GVim in case .gvimrc is missing
    " Note that gvimrc file is always sourced after the vimrc file.
    if has('gui_running')

        " Color Scheme and Background
        colorscheme default
        set background=light
        "set background=dark

        " Enable mouse in a windows
        set mouse=a

    endif

" }

" External Configurations {

    " Load Plugins
    source $DDPATH/plugins.vim
    "
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    "
    " Brief help
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ

    " Key Mappings
    source $DDPATH/mappings.vim

    " File Types
    source $DDPATH/filetypes.vim

    " Abbreviations
    source $DDPATH/abbreviations.vim

    " Customizations
    source $DDPATH/custom.vim

" }

" Uncomment this if you use GVim in Windows
" Vundle fix to load bundles
"if has('gui_running')
"   call vundle#config#require(g:bundles)
"endif

if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" End of vimrc
