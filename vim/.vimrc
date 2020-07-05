" ================ General Config ====================

execute pathogen#infect()
set number relativenumber       "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=10000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
" set spelllang=en_us,es
" set spell

" color novum
" color ambient
" color molokai
" color onehalfdark
" color atom-dark


" ============ colorscheme plugins configuration ================
if (has("termguicolors"))
 set termguicolors
endif

syntax enable

"turn on syntax highlighting
syntax on

" Theme
colorscheme OceanicNext

set hidden

" highlight 81 column and onward
" let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=237
let &colorcolumn="80,".join(range(120,999),",")
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

let mapleader=" "
set timeout timeoutlen=1500

" ================ Mappings to move lines ==============

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" ================ plugin closetag ========================

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*html.erb'

" ================ Custom Settings ========================

" Window pane resizing
" nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>
" resize split windows
nnoremap <leader>h :exe "vertical resize -3"<CR>
nnoremap <leader>l :exe "vertical resize +3"<CR>
nnoremap <leader>j :exe "resize -3"<CR>
nnoremap <leader>k :exe "resize +3"<CR>

" remap call to fzf file search
nnoremap <silent> <C-p> :FZF<CR>

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-N> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>      " this is the key to jump to the nerdtree

" vim airline 
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='minimalist' "papercolor powerlineish fruit_punch
" let g:airline_theme='tender' "papercolor powerlineish fruit_punch

" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

" ^[ is an alternative shorcut for escape key

" Plugins to install 
" First install pathogen plugin manager, then visit vimawesome and install next plugins
" auto-pairs
" fzf
" nerdtree
" nord-vim
" oceanic-next
" palenight.vim
" tender
" vim-airline
" vim-airline-themes
" vim-closetag
" vim-commentary
" vim-devicons
" vim-endwise
" vim-ruby
" vim-surround
