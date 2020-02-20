" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" My plugins
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-rake'
"Plugin 'tpope/vim-bundler'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'tpope/vim-projectionist'
"Plugin 'jlanzarotta/bufexplorer'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
call vundle#end()            " required
filetype on
filetype indent on
filetype plugin indent on    " required

" see :h vundle for more details or wiki for FAQ
" reasign <leader> to ' ' blank space key
let mapleader = ' '

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd BufWinEnter * NERDTreeFind

map <F2> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>      " this is the key to jump to the nerdtree
set expandtab tabstop=2 shiftwidth=2
" Put your non-Plugin stuff after this line

set number 
syntax on

