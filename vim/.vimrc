" Sane UI stuff
syntax enable
set relativenumber
set number
set colorcolumn=80
set cursorline
set background=dark
set termguicolors
set ruler
set showmatch
set so=10
set clipboard=unnamedplus
colorscheme solarized
"highlight ColorColumn ctermbg=234
"highlight CursorLine ctermbg=234
highlight SignColumn ctermbg=0

" Enable heresy :)
set mouse=a

" No error bell sound? I've never heard it, but OK :)
set noerrorbells

" Tab stuff
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent

" Don't highlight stuff when I look for it
set nohlsearch
set incsearch

" Misc
set hidden
set noswapfile
set nobackup
set nowrap
set smartcase
set updatetime=50
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Status line
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Remaps!
" Slower than PgUp/Down, faster than mashing j/k
noremap <C-j> 10j
noremap <C-k> 10k
vnoremap <C-j> 10j
vnoremap <C-k> 10k

" Better searches
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Disable arrow keys :)
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj


" Selecting the entire file is sometimes useful when you want to delete it
noremap <C-a> ggVG

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Extra helper functions I stole from a template vimrc
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

