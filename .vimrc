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
  syntax on       " enable syntax hightlight
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
  " set mono world
  set background=dark
  silent! colorscheme inori
  hi Normal ctermbg=235 ctermfg=255
  "hi ColorColumn ctermbg=236
  "hi Search ctermbg=241
  "hi SignColumn ctermbg=237
  "hi LineNr ctermfg=250
  "hi CursorLineNr ctermfg=250
  "hi Tabline cterm=none ctermbg=236 ctermfg=254
  "hi TabLineFill cterm=none ctermbg=236
  ""hi StatusLine cterm=none ctermbg=238
  ""hi StatusLineNC cterm=none ctermbg=250
  "hi CursorLine cterm=bold ctermbg=236
  "hi MatchParen ctermbg=250
  "hi Pmenu ctermbg=238 ctermfg=254

  "let &colorcolumn="".join(range(100,999), ",")
" }

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
  vnoremap Y "+y
  vnoremap D "+d
  nnoremap YY "+yy
  nnoremap P "+p
  vnoremap P "+p

  " tab
  noremap tn :tabnew<CR>
  noremap tc :tabclose<CR>
  noremap tt gt.

  noremap qq :q<CR>
  noremap wq :wq<CR>
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
