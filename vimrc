set sessionoptions-=options

""" vundle begin {{{
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
" BundleInstall to install plugins
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

" split plugin
" usage: gS to split and use gJ to merge, GREAT
Bundle 'AndrewRadev/splitjoin.vim'

" tag plugin, instead of Taglist
Bundle 'majutsushi/tagbar'
":map  <F9>  :TlistToggle<CR>
:nnoremap <F9> :TagbarToggle<CR>

" ack plugin;)
" :Ack [options] {pattern} [{directory}]
"
Bundle 'mileszs/ack.vim'

" surround change
" cs'"    : change ' to "
" cs'<q>  : change ' to <q>
" ds'     : delete '
" ysiw'   : add ' (ys mean add, iw mean a word)
" yss"    : add entire line with " (s mean whole line)
" cs'[    : '[' contain space and ']' don't contain space
Bundle 'tpope/vim-surround'

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
Bundle 'ragtag.vim'
let g:ragtag_global_maps = 1

" file management
" <C-p> to startup
Bundle 'kien/ctrlp.vim'

Bundle 'scrooloose/nerdtree'
:nnoremap <F7> :NERDTreeToggle<CR>

Bundle 'fholgado/minibufexpl.vim'

:nnoremap <F6> :MBEToggle<CR>
"
":nnoremap <C-TAB>   :MBEbn<CR>
":nnoremap <C-S-TAB> :MBEbp<CR>

Bundle 'kchmck/vim-coffee-script'

Bundle 'bling/vim-airline'
:nnoremap <F5> :AirlineToggle<CR>

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

""" vundle end }}}




" common settings
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
    set csprg=/bin/cscope
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

":autocmd FileType c     :iabbrev iff if( )<left>
:autocmd FileType c     set cindent
":autocmd FileType perl  :iabbrev iff if( )<left>

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
