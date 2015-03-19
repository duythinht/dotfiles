set nocompatible               " be iMproved
set hidden
filetype off                   " required!
set omnifunc=syntaxcomplete#Complete

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Plugin 'duythinht/inori'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
"Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tfnico/vim-gradle'
" Github repos of the user 'vim-scripts'
" => can omit the username part
Plugin 'L9'

" non github repos
" ...

call vundle#end()

filetype plugin indent on     " required!

" Hide MacVim scrollbar
set guioptions-=r
set guioptions-=L

" Change the key
let mapleader=","
nnoremap ; :

" stop using arrow key
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Re-map move around for wrapping line
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Setting for quick copy & paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>yy "+yy
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Binding paste mode
set pastetoggle=<F2>
" Generic setings

set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=2   " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set cindent		  " copy the previous indentation on autoindenting
set smartindent   " smart indent
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2 " tabstap is 4
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch     " show search matches as you type
set nobackup	  " no backup
set noswapfile	  " no swap files
syntax enable     " enable syntax hightlight

" Personal settings

colorscheme inori " using inori colorscheme
hi LineNr ctermbg=None

" Tabs
"hi TabLine      guifg=208 guibg=None gui=None ctermfg=11 ctermbg=None cterm=None
"hi TabLineFill  guifg=None guibg=None gui=None ctermfg=None ctermbg=None cterm=None
"hi TabLineSel   guifg=100 guibg=None gui=bold ctermfg=160 ctermbg=None cterm=bold

" Indent for FileType
autocmd FileType python setl sw=4 sts=4 et
"autocmd FileType html setl sw=4 sts=4 et

" Airline
set laststatus=2
let g:airline_theme="bubblegum"

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = 'Ξ'


" Command-T
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o,*.obj,.git,*/vendor/*,*/target/*,*/build/*,*/node_modules/*

" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
let g:pymode_options_max_line_length = 999
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting


let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" Don't show preview
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0

map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"Remove trailling

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>t :call DeleteTrailingWS()<CR>
inoremap {<CR>  {<CR>}<Esc>O
inoremap [<CR>	[<CR>]<Esc>O<Tab>
