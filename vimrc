
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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
set statusline=0		

" highlight current line
set cursorline          

" enable mouse
set mouse=a

" no swap files
set noswapfile

" allow hidden buffers
set hidden

" styling and theme
syntax on
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='luna'

" dont show default command line 
set noshowmode
set noshowcmd
