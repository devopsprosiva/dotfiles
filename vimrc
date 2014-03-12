set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required!
syntax enable                 " Enable syntax highlighting
set t_Co=256                  " Enable 256 colors
scriptencoding utf-8
set encoding=utf-8

""" Setup Vundle automatically. Taken from timss/vimconf
    call system("mkdir -p $HOME/.vim/{plugin,undo,colors}")
    if !filereadable($HOME . "/.vimrc.bundles") | call system("touch $HOME/.vimrc.bundles") | endif
        let has_vundle=1
        if !filereadable($HOME."/.vim/bundle/vundle/README.md")
            echo "Installing Vundle..."
            echo ""
            silent !mkdir -p $HOME/.vim/bundle
            silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
            let has_vundle=0
        endif

set rtp+=$HOME/.vim/bundle/vundle/          " include vundle
call vundle#rc()                            " init vundle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Bundles
"
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Syntastic for syntax checking
Bundle 'scrooloose/syntastic'

" Nerdtree to browse filesystem from vim
Bundle 'scrooloose/nerdtree'

" Puppet
Bundle 'rodjek/vim-puppet'

" Tabular to align text
Bundle 'godlygeek/tabular'

" Git wrapper for vim
Bundle 'tpope/vim-fugitive'

" status line light as air
Bundle 'bling/vim-airline'
Bundle 'paranoida/vim-airlineish'

" Lightline status line
"Bundle itchyny/lightline.vim"

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" Autocompletion
Bundle 'Valloric/YouCompleteMe'

" Show git diff in the gutter
Bundle 'airblade/vim-gitgutter'

" VIM Color schemes
Bundle 'flazz/vim-colorschemes'
call system("cp -a $HOME/.vim/bundle/vim-colorschemes/colors/* $HOME/.vim/colors/")

" Show list of buffers in the command bar
Bundle 'bling/vim-bufferline'

" Undotree
Bundle 'mbbill/undotree'

" Nerd commenter
Bundle 'scrooloose/nerdcommenter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Syntastic
" syntastic checking mode
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['puppet', 'shell', 'ruby'],
      \ 'passive_filetypes': ['php', 'html', 'python'] }

" Open the :Errors window automatically when an errors occurs
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1

" Check syntax at file open and close
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Generic options
set number                      " Show line numbers
set autoindent                  " Carry over indenting from previous line
set autoread                    " Auto reload a file when there are changes outside of vi
set cindent                     " Automatic program indenting
set hlsearch                    " Highlight searching
set ignorecase                  " Case insensitive
set incsearch                   " Search as you type
set infercase                   " Completion recognizes capitalization
set laststatus=2                " Always show the status bar
set linebreak                   " Break long lines by word, not char
set ruler                       " ruler at the bottom
set showmatch                   " Hilight matching braces/parens/etc.
set cursorline                  " Show a line where the cursor is
set history=20000               " How many lines of history to save
set wildmenu                    " Show possible completions on command line
set wildmode=list:longest,full  " List all options and complete
set nobackup                    " disable backups
set backspace=indent,eol,start  " Allow backspace beyond insertion point
set expandtab               	" No tabs
set ttimeoutlen=50              " Remove the pause after exiting insert mode in vim-airline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Macros
nmap \e :NERDTreeToggle<CR>
nmap \l :setlocal number!<CR>:setlocal number?<CR>
nmap \o :set paste!<CR>:set paste?<CR>
nmap \q :nohlsearch<CR>
nmap \u :UndotreeToggle<CR>

" Toggle the latest 2 buffers
nmap <C-e> :e#<CR>

" Move between open buffers.
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>


" airline 
let g:airline_powerline_fonts=1
let g:airline_theme='airlineish'
let g:airline_section_x=""
let g:airline_section_y="%{strlen(&ft)?&ft:'none'}"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1 " enable/disable fugitive/lawrencium integration 
let g:airline#extensions#syntastic#enabled = 1

" remove trailing whitespace in puppet files
autocmd FileType puppet autocmd BufWritePre <buffer> :%s/\s\+$//e

" Open nerdtree windows on the right
let g:NERDTreeWinPos = "right"

" Set highlight for cursor line
hi CursorLine ctermfg=NONE ctermbg=237 cterm=NONE guifg=NONE guibg=#2e373b gui=NONE

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Enable file type detection

" Set up puppet file type and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet

au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the colorscheme
set background=dark
color molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Lightline configuration
" Powerline font
"let g:Powerline_symbols = 'fancy'

"function! MyFugitive()
"  if exists("*fugitive#head")
"    let _ = fugitive#head()
"    return strlen(_) ? "\ue0a0 "._ : ''
"  endif
"  return ''
"endfunction


"let g:lightline = {
"        \ 'active': {
"        \       'left': [ [ 'mode', 'paste'],
"        \                 [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"        \ },
"        \ 'component': {
"        \       'readonly': '%{&readonly?"\ue0a2":""}',
"        \       'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"        \ },
"        \ 'component_visible_condition': {
"        \       'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"        \ },
"        \ 'component_function': {
"        \       'fugitive': 'MyFugitive',
"        \ },
"        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
"        \ }

