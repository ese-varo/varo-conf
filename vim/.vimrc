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

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

set encoding=UTF-8
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
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
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

" ================ Enable tab for emmet =============

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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

" enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1

" remap call to fzf file search
nnoremap <silent> <C-p> :FZF<CR>

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-N> :NERDTreeToggle<CR>
map <leader>t :NERDTreeFind<cr>      " this is the key to jump to the nerdtree

" vim airline 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_theme='minimalist' "papercolor powerlineish fruit_punch
let g:airline_theme='oceanicnext'
" let g:airline_theme='tender' "papercolor powerlineish fruit_punch

" vim-css-color plugin conf
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Automatically comb your CSS on save
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

" Highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" coc configuration
let g:coc_global_extensions = [
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-emmet'
  \]

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>do <Plug>(coc-codeaction)

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
" commentary.vim
" vim-devicons
" endwise.vim
" vim-ruby
" vim-surround
" vim-indent-guides (colors) / vim-indendguides (chars)
" vim-css-color
" html5
" pangloss/vim-javascript'
" leafgarland/typescript-vim'
" peitalin/vim-jsx-typescript'
" styled-components/vim-styled-components', { 'branch': 'main' }
" jparise/vim-graphql'
" coc.nvim
" rails.vim

