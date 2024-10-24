"""" Enable Vundle: vim plugin manager

" required before Vundle initialization
set nocompatible        " disable compatibility mode with vi
filetype off            " disable filetype detection (but re-enable later, see below)

" set the runtime path to include Vundle, and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" nerdtree
Plugin 'preservim/nerdtree'
Plugin 'itchyny/vim-gitbranch'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'wsdjeg/vim-fetch'
" Plugin 'wting/rust.vim' " enable syntax highlighting for rust
call vundle#end()


"""" Basic Behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping


"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
" colorscheme murphy      " good colorschemes: murphy, slate, molokai, badwolf, solarized
:colorscheme molokai

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on


"""" Tab settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>


"""" Miscellaneous settings that might be worth enabling

"set cursorline         " highlight current line
"set background=dark    " configure Vim to use brighter colors
"set autoread           " autoreload the file in Vim if it has been changed outside of Vim

""" Show white spaces as red
:highlight RedundantSpaces ctermbg=red guibg=red
:match RedundantSpaces /\s\+$/

"""" Use GDB under VIM
" :packadd termdebug
:set mouse=a
let g:termdebug_popup = 0
" Use vertical split
let g:termdebug_wide = 163
" Remap C-y to C-t to jump to a tag - ctags
" nnoremap <C-y> <C-]>

""" NERDTree plugin configurations
noremap <F6> :NERDTreeToggle<CR>

" Start NERDTree and put the cursos back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" Show lines of files on NERDTree
let g:NERDTreeFileLines = 1

""" Fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :Gfiles<CR>
nnoremap <silent> <C-b> :Buffers<CR>

