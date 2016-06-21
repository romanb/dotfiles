" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --racer-completer' }
Plug 'rust-lang/rust.vim', { 'for': [ 'rust' ] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Tagbar'
call plug#end()

" Basics
syntax on
filetype plugin indent on

" Highlight trailing whitespace
match Error '\s\+$'

set number
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ignorecase
set splitright
set mouse=a
set nowrap
set linebreak
set ruler
set visualbell
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
let g:netrw_liststyle = 3

set tags=tags;/,codex.tags;/

" Colour scheme
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow

" necoghc (Haskell)
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" Neomake
" let g:neomake_open_list = 2
autocmd! BufWritePost * Neomake

" Resizing Windows
nnoremap <C-Left>  <C-W><
nnoremap <C-Right> <C-W>>
nnoremap <C-Down>  <C-W>+
nnoremap <C-Up>    <C-W>-

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers = {'rust' : ['.', '::']}
let g:ycm_rust_src_path = $HOME . '/dev/rust-src/current/src'
nnoremap <Leader>] :YcmCompleter GoTo<CR>

" CtrlP
nnoremap <Leader>p :CtrlPMRUFiles<CR>
set wildignore+=*.o,*.hi,*.so,*.swp,*.jar,*.class,*.tar*

" Highlighting
nnoremap <Leader>h :nohlsearch<CR>

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" Tagbar - Haskell
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Tagbar - Rust
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \ ]
 \ }

