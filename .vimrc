" Begin {
  set nocompatible
  source ~/.vimrc.fn
" }

" VIM bundles {
  filetype off
  call plug#begin('~/.vim/plugged')
  source ~/.vimrc.bundles
  call plug#end()
  filetype plugin indent on     " required!
" }

" Mapping keys {
  let mapleader=','
  nnoremap ; :
" }
"
" Basic settings {
  set hidden
  set modeline
  set ruler
  set autoread
  set completeopt-=preview
  set nostartofline   " do not jump to 1st charactor with page commands
  set nowrap          " don't wrap lines
  set autoindent      " always set autoindenting on
  set smartindent     " smart indent
  set relativenumber  " enter relativenumber mode
  set number          " always show line numbers
  set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
  set showmatch       " set show matching parenthesis
  set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
  set cindent		      " copy the previous indentation on autoindenting
  set noswapfile	    " no swap files
  set signcolumn=yes
  syntax enable       " enable syntax hightlight
" }
"

" Tabs, ident and width {
  set tabstop=2     " a tab is two spaces
  set backspace=2   " allow backspacing over everything in insert mode
  set shiftwidth=2  " number of spaces to use for autoindenting
  set softtabstop=2 "
  set expandtab
  set textwidth=99
" }

" UI, colorscheme {
  set background=dark
  silent! colorscheme inori

  highlight ColorColumn ctermbg=233 guibg=#212121
  let &colorcolumn="".join(range(100,999), ",")
" }
"

" Keyboard && remapping mapping {

  " Fix sometime stupid key moving
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
  " open new tab
  noremap <leader>t <Esc>:tabnew<CR>
  " yank from cursor to end of line
  nnoremap Y y$
  " Toggle between normal and relative numbering.
  nnoremap <leader>r :call Numbers_toggle()<cr>
  " auto insert end block
  inoremap {<CR>  {<CR>}<Esc>O
  inoremap [<CR>	[<CR>]<Esc>O<Tab>
  " Close other
  noremap <leader>o :on<CR>
  " Use jj for esc
  imap jj <Esc>
  " remap for auto complete
  "inoremap <leader>, <C-x><C-o>

" }

" Search and text replace {
  set ignorecase          " Make searching case insensitive
  set smartcase           " ... unless the query has capital letters.
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).
  set nohlsearch

  " Search and Replace
  nmap <Leader>s :%s//g<Left><Left>
" }


" Load Plugins settings {
  if !empty(glob('~/.vimrc.plugins.settings'))
    source ~/.vimrc.plugins.settings
  endif
" }

" Auto cmd {
  autocmd BufWritePre <buffer> call Delete_trailing()
" }
