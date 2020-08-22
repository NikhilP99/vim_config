"""""""""""""""""""""""""""""""""
"  vimrc config
"""""""""""""""""""""""""""""""""

" basic settings
set nocompatible	" don't be like vi
set encoding=utf8
let mapleader = ','

"""""""""""""""""""""""""""""""""
"  Vundle setup
"""""""""""""""""""""""""""""""""

filetype off 		" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'   

" Utility
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'neoclide/coc.nvim'
Plugin 'alvan/vim-closetag'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'tpope/vim-surround'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'

" fzf
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install()  }  }

" javascript specfic plugins
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'mattn/emmet-vim'

" Markdown specfic plugins
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Typing freely
Plugin 'junegunn/goyo.vim'

" Interface/themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'

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

" markdown preview settings
let g:mkdp_browser = 'firefox'

" styling and theme
syntax on
set t_Co=256
set background=dark

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

let g:gruvbox_contrast_dark='hard'
colorscheme one

" Airline configurations
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='luna'

" dont show default command line
set noshowmode
set noshowcmd

" NERDTree configurations
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
" exit vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" disable warnings for vim-visual-multi
let g:VM_show_warnings = 0

"""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""

" NERDTree
map <C-f> :NERDTreeToggle<CR>

" FZF
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" closing buffers with leader c
nnoremap <leader>c :bp\|bd #<CR>

" moving through buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" nvim.coc key mappings
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" autoclose html tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
" hack for jsx: Press tab after closing a tag
autocmd FileType javascript inoremap <buffer> ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O
