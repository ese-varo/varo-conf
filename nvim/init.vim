set number relativenumber           "Line numbers
set history=10000
set showcmd                         "Show incomplete cmds down the bottom
set cursorline
set showmode                        "Show current mode down the bottom
set autoread                        "Reload files changed outside vim
set encoding=UTF-8
let mapleader=" "

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

  " syntax
  Plug 'sheerun/vim-polyglot'

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
  Plug 'alvan/vim-closetag'
  " surround trick: 'ysiw(' (You Surround Inner Word)
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-obsession'
  Plug 'junegunn/goyo.vim'
  Plug 'nelstrom/vim-visual-star-search'

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
colorscheme dracula

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

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

