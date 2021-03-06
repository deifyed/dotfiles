" Set leader key
let mapleader=","

" Hides the 'you have unsaved changes, are you sure' prompt
set hidden

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
"
"
call plug#begin('~/.vim/plugged')

set pyxversion=3
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

let g:deoplete#enable_at_startup = 1


" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

""" UI
set number 	        " Line numbers
set background=dark " Better solarized compatibility in dark mode
set textwidth=80 	" Line width

let g:solarized_termcolors=16
colorscheme solarized

""" Syntax
syntax enable
filetype plugin indent on
"au BufReadPost,BufNewFile *.vue setlocal filetype=javascript syntax=html

" FZF
set rtp+=/usr/bin/fzf
map ; :GFiles<CR>

" netrw tree :Explore
let g:netrw_banner = 0
let g:netrw_browse_split = 4 " Use previous window to open file
let g:netrw_winsize = -28
let g:netrw_liststyle = 3 " Tree view

" showing invisible chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Lexplore
"	autocmd VimEnter * :wincmd w
"augroup END
map <leader>t :Lexplore<CR>

abbrev clog console.log(')<esc>hi

execute pathogen#infect()
