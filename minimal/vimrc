
"""""""""""""""""""""""""""""""""
"  vimrc config
"""""""""""""""""""""""""""""""""

" basic settings
set nocompatible	" don't be like vi
set encoding=utf8


"""""""""""""""""""""""""""""""""
"  Vundle setup
"""""""""""""""""""""""""""""""""

filetype off 		" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""
" Configurations
"""""""""""""""""""""""""""""""""
" basic (must do)
set number
set ruler
set backspace=indent,eol,start
set visualbell
set title

" text rendering
set display+=lastline
set scrolloff=2
set sidescrolloff=5
set nowrap

" tabs
set autoindent
set tabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab

" searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" always display status line
set statusline=2		

" highlight current line
set cursorline          

" enable mouse
set mouse=a

" allow hidden buffers
set hidden

" styling and theme
syntax on
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

