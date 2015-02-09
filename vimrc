set sessionoptions-=options

""" vundle begin {{{
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
" PluginInstall to install plugins
Plugin 'gmarik/vundle'

" My Plugins here:
"
" original repos on github
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'tpope/vim-rails.git'
" vim-scripts repos
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Plugin 'file:///Users/gmarik/path/to/plugin'
" ...

" split plugin
" usage: gS to split and use gJ to merge, GREAT
Plugin 'AndrewRadev/splitjoin.vim'

" tag plugin, instead of Taglist
Plugin 'majutsushi/tagbar'
":map  <F9>  :TlistToggle<CR>
:nnoremap <F9> :TagbarToggle<CR>

" ack plugin;)
" :Ack [options] {pattern} [{directory}]
"
Plugin 'mileszs/ack.vim'

" enable . repeat for surround
Plugin 'tpope/vim-repeat'

" surround change
" cs'"    : change ' to "
" cs'<q>  : change ' to <q>
" ds'     : delete '
" ysiw'   : add ' (ys mean add, iw mean a word)
" yss"    : add entire line with " (s mean whole line)
" cs'[    : '[' contain space and ']' don't contain space
Plugin 'tpope/vim-surround'

" great for write xml/html/rails/jsp/php
" mapping
"
"<C-X>=        foo<%= ^ %>                               *ragtag-CTRL-X_=*
"<C-X>+        <%= foo^ %>                               *ragtag-CTRL-X_+*
"<C-X>-        foo<% ^ %>                                *ragtag-CTRL-X_-*
"<C-X>_        <% foo^ %>                                *ragtag-CTRL-X__*
"<C-X>'        foo<%# ^ %>                               *ragtag-CTRL-X_'*
"              (mnemonic: ' is a comment in ASP VBS)
"<C-X>"        <%# foo^ %>                               *ragtag-CTRL-X_quote*
"<C-X><Space>  <foo>^</foo>                              *ragtag-CTRL-X_<Space>*
"<C-X><CR>     <foo>\n^\n</foo>                          *ragtag-CTRL-X_<CR>*
"<C-X>/        Last HTML tag closed                      *ragtag-CTRL-X_/*
"<C-X>!        <!DOCTYPE...>/<?xml ...?> (menu)          *ragtag-CTRL-X_!*
"<C-X>@        <link rel="stylesheet" ...>               *ragtag-CTRL-X_@*
"              (mnemonic: @ is used for importing in a CSS file)
"<C-X>#        <meta http-equiv="Content-Type" ... />    *ragtag-CTRL-X_#*
"<C-X>$        <script src="/javascripts/^.js"></script> *ragtag-CTRL-X_$*
"              (mnemonic: $ is valid in javascript identifiers)
"
" encode/decode
"
"                                                 *ragtag-CTRL-V_%*
"<Plug>ragtagUrlV        URL encode the next character.
"<C-V>%
"
"                                                *ragtag-CTRL-V_&*
"<Plug>ragtagXmlV        XML encode the next character.
"<C-V>&
"
"                                                *ragtag-CTRL-X_%*
"<Plug>ragtagUrlEncode   Toggle a mode that automatically URL encodes unsafe
"<C-X>%                  characters.
"
"                                                *ragtag-CTRL-X_&*
"<Plug>ragtagXmlEncode   Toggle a mode that automatically XML encodes unsafe
"<C-X>&                  characters.
Plugin 'ragtag.vim'
let g:ragtag_global_maps = 1

" file management
" <C-p> to startup
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
:nnoremap <F7> :NERDTreeToggle<CR>

Plugin 'kchmck/vim-coffee-script'

Plugin 'bling/vim-airline'
:nnoremap <F5> :AirlineToggle<CR>

Plugin 'tpope/vim-rails'

Plugin 'elixir-lang/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" vundle end }}}


" common settings
syntax on
set nu
set ruler  
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set cindent
"set autoindent
set incsearch
set smarttab
set expandtab

" always show status
set laststatus=2

" fdm
set fdm=marker
set fdls=99

"set iskeyword+=>
"set iskeyword+=:

" for buffer
:let bclose_multiple = 0

" for cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    endif
    set csverb
endif


" who call this function
:nnoremap <leader>cc :cs find c <cword><cr>

" where define the symbol
:nnoremap <leader>cg :cs find g <cword><cr>

" this function calls what
:nnoremap <leader>cd :cs find d <cword><cr>

" find the symbol
:nnoremap <leader>cs :cs find s <cword><cr>

" egrep the word
:nnoremap <leader>ce :cs find e <cword><cr>


" cscope end


"if has("autocmd")
"    filetype plugin indent on
"endif

:let mapleader = "\\"

" avoid #
:autocmd FileType c     set cindent

" ruby better use 2 space
:autocmd FileType ruby  set tabstop=2
:autocmd FileType ruby  set shiftwidth=2
:autocmd FileType ruby  set softtabstop=2

:autocmd FileType html set tabstop=2
:autocmd FileType html set shiftwidth=2
:autocmd FileType html set softtabstop=2

:autocmd FileType eruby set tabstop=2
:autocmd FileType eruby set shiftwidth=2
:autocmd FileType eruby set softtabstop=2

:autocmd FileType coffee set tabstop=2
:autocmd FileType coffee set shiftwidth=2
:autocmd FileType coffee set softtabstop=2

:iabbrev @@ aka.why

"grep! is better than grep, shellescape to escape shell special chars
"slient not to out put message
:nnoremap <leader>g :silent exe "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:cw<cr>

:nnoremap <leader>l :echom len(expand("<cword>"))<cr>

"dp eq di(, dq eq di"
":onoremap p i(    
":onoremap q i"
"

"check the code syntax
:nnoremap <leader><C-g> :!gcc -fsyntax-only -c % -Wall -g -W -Wpointer-arith -Wno-unused-parameter -Werror<cr>
:nnoremap <leader><C-p> :!perl -c %<cr>
:nnoremap <leader><C-b> :!bash -n %<cr>
:nnoremap <leader><C-r> :!ruby -c %<cr>
:nnoremap <leader><C-l> :!luac -p %<cr>

:nnoremap <leader>ev :vsp  $MYVIMRC<cr>
:nnoremap <leader>sv :so   $MYVIMRC<cr>

":nnoremap <F1> ngt<cr>
":nnoremap <C-1><C-1> 1gt<cr>
":nnoremap <C-2><C-2> 2gt<cr>
":nnoremap <C-A-3> 3gt<cr>
":nnoremap <C-A-4> 4gt<cr>
":nnoremap <C-A-5> 5gt<cr>

set pastetoggle=<F8>

" charactor encoding settings
set fileencodings=ucs-bom,utf-8,gbk,latin1
