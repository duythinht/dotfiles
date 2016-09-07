" Automatically reload vim config(s)
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set nocompatible               " be iMproved
set hidden
set modeline
setlocal completeopt-=preview
set autoread
set ruler
set foldmethod=syntax
set foldlevel=17
set omnifunc=syntaxcomplete#Complete
filetype off                   " required!
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
Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'klen/python-mode'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'l3nkz/ycmconf'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tfnico/vim-gradle'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mkitt/tabline.vim'
Plugin 'luochen1990/rainbow'
Plugin 'fatih/vim-go'
Plugin 'fatih/vim-hclfmt'
" Github repos of the user 'vim-scripts'
" => can omit the username part
Plugin 'L9'

" non github repos
" ...

call vundle#end()

filetype plugin indent on     " required!
filetype on

" Hide MacVim scrollbar
set guioptions-=r
set guioptions-=L

" Change the key
let mapleader=","
nnoremap ; :

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

set nowrap          " don't wrap lines
set expandtab			  " tab by spaces
set autoindent      " always set autoindenting on
set cindent		      " copy the previous indentation on autoindenting
set smartindent     " smart indent
set number          " always show line numbers
set relativenumber  " enter relativenumber mode
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch       " set show matching parenthesis
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop


set noswapfile	    " no swap files
syntax enable       " enable syntax hightlight

" Personal settings

silent! colorscheme inori " using inori colorscheme
"hi LineNr ctermbg=None

" Tabs
"hi TabLine      guifg=208 guibg=None gui=None ctermfg=11 ctermbg=None cterm=None
"hi TabLineFill  guifg=None guibg=None gui=None ctermfg=None ctermbg=None cterm=None
"hi TabLineSel   guifg=100 guibg=None gui=bold ctermfg=160 ctermbg=None cterm=bold

set tabstop=2     " a tab is two spaces
set backspace=2   " allow backspacing over everything in insert mode
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2 "

" Indent for FileType
autocmd FileType python setl sw=2 sts=2 et
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.o,*.obj,.git,*/vendor/*,*/target/*,*/build/*,*/node_modules/*,*.a

" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"Remove trailling

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
noremap <leader>DT :call DeleteTrailingWS()<CR>

" open new tab
noremap <leader>t <Esc>:tabnew<CR>

" auto insert end block
inoremap {<CR>  {<CR>}<Esc>O
inoremap [<CR>	[<CR>]<Esc>O<Tab>

" Silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" Rainbow settings
let g:rainbow_active = 0
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['red', '172', 'brown', 'lightyellow', 'lightmagenta', 'darkgreen'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

noremap <leader>R :RainbowToggle<CR>
