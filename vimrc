" Set leader key
let mapleader=","

" Use system clipboard
"set clipboard+=unnamedplus

""" Indentation
"set expandtab 		" Spaces instead of tab characters
set tabstop=2 		" Amount of columns one tab should take
set softtabstop=2 	" Amount of spaces one tab represents
set shiftwidth=2 	" Vim indentation needs to know softtabstop length
set autoindent
set smartindent

" Center screen on input
"autocmd InsertEnter * norm zz

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

""" UI
set number 	        " Line numbers
set background=dark " Better solarized compatibility in dark mode
set textwidth=81 	" Line width

let g:solarized_termcolors=16
colorscheme solarized

""" Syntax
syntax enable
filetype plugin indent on
au BufReadPost,BufNewFile *.vue setlocal filetype=javascript syntax=html

" FZF
set rtp+=/usr/local/opt/fzf
map ; :Files<CR>

" netrw tree :Explore
let g:netrw_banner = 0
let g:netrw_browse_split = 4 " Use previous window to open file
let g:netrw_winsize = -28
let g:netrw_liststyle = 3 " Tree view

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Lexplore
	autocmd VimEnter * :wincmd w
augroup END
map <leader>t :Lexplore<CR>

execute pathogen#infect()
