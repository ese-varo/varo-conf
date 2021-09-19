set number relativenumber           "Line numbers
set history=10000
set showcmd                         "Show incomplete cmds down the bottom
set cursorline
set showmode                        "Show current mode down the bottom
set autoread                        "Reload files changed outside vim
set encoding=UTF-8

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Scrolling ========================
set scrolloff=2         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces visually
set linebreak                       "Wrap lines at convenient points

filetype indent plugin on
let mapleader=" "

" ================ plugin closetag ========================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*html.erb'"

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * 
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

call plug#begin("~/.vim/plugged")
  " Theme
  Plug 'dracula/vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'mhartington/oceanic-next'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'jacoborus/tender'
  Plug 'joshdick/onedark.vim'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " Status bar
  Plug 'bling/vim-airline'

  " Tabs info
  Plug 'mkitt/tabline.vim' 

  " Typing
  Plug 'tpope/vim-commentary' 
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'               " surround trick: 'ysiw(' (You Surround Inner Word)
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-obsession'
  Plug 'junegunn/goyo.vim'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'yggdroot/indentline'

  " Ruby
  Plug 'tpope/vim-endwise'

  " JS
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Autocomplete
  Plug 'sirver/ultisnips'

  " File Search
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'sharkdp/bat'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
syntax on
" colorscheme dracula
" colorscheme tender
" colorscheme onedark
" OceanicNext Theme
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" highlight 81 column and onward
hi ColorColumn ctermbg=237
let &colorcolumn="80,".join(range(120,999),",")
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73
set timeout timeoutlen=1500

" ================ Mappings to move lines ==============
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" nerdtree settings
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" jump to file in nerdtree
map <leader>t :NERDTreeFind<CR>

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" Find files
nnoremap <silent> <C-f> :Files<CR>
" Search inside files
nnoremap <silent> <Leader>f :Rg<CR>
" Don't search by filename when looking inside files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Open a file in fullscreen mode
nnoremap <C-g> :Goyo<CR>

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" resize split windows
nnoremap <leader>h :exe "vertical resize -3"<CR>
nnoremap <leader>l :exe "vertical resize +3"<CR>
nnoremap <leader>j :exe "resize -3"<CR>
nnoremap <leader>k :exe "resize +3"<CR>

