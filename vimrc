set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required!
syntax enable                 " Enable syntax highlighting

""" Setup Vundle automatically. Taken from timss/vimconf
    call system("mkdir -p $HOME/.vim/{plugin,undo}")
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

""" Syntastic
" syntastic checking mode
let g:syntastic_mode_map = { 'mode': 'active',                              
      \ 'active_filetypes': ['puppet', 'shell', 'ruby'],           
      \ 'passive_filetypes': ['php', 'html'] }

" check syntax on file open
let g:syntastic_check_on_open=1

" enable puppet module detection
let g:puppet_module_detect=1


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

" Options for statusline
highlight StatusLine   cterm=NONE ctermbg=blue ctermfg=white
highlight StatusLineNC cterm=NONE ctermbg=black ctermfg=white
highlight VertSplit    cterm=NONE ctermbg=black ctermfg=white

" Macros
nmap \e :NERDTreeToggle<CR>
nmap \l :setlocal number!<CR>:setlocal number?<CR>
nmap \o :set paste!<CR>:set paste?<CR>
nmap \q :nohlsearch<CR>

" Toggle the latest 2 buffers
nmap <C-e> :e#<CR>

" Move between open buffers.
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>

