
" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'rust-lang/rust.vim', { 'for': [ 'rust' ] }
Plug 'majutsushi/tagbar'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'chrisbra/unicode.vim'
Plug 'idris-hackers/idris-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
" Plug 'leafgarland/typescript-vim'
Plug 'joukevandermaas/vim-ember-hbs'
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
set textwidth=80
set guicursor=i-ci-ve:block-blinkon250
let g:netrw_liststyle=3
set tags=tags;/,codex.tags;/

" Colour scheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  colorscheme base16-tomorrow-night
  " source ~/.vimrc_background
endif

" Unicode symbols
inoremap <Leader>uproves  <C-v>u22a2
inoremap <Leader>uimplies <C-v>u2192
inoremap <Leader>uiff     <C-v>u2194
inoremap <Leader>uand     <C-v>u2227
inoremap <Leader>uor      <C-v>u2228
inoremap <Leader>umodels  <C-v>u22a8
inoremap <Leader>unot     <C-v>u00ac
inoremap <Leader>uforall  <C-v>u2200
inoremap <Leader>uexists  <C-v>u2203
inoremap <Leader>uequals  <C-v>u2250
inoremap <Leader>ualpha   <C-v>u03b1
inoremap <Leader>uelem    <C-v>u2208

" Resizing Windows
nnoremap <C-Left>  <C-W><
nnoremap <C-Right> <C-W>>
nnoremap <C-Down>  <C-W>+
nnoremap <C-Up>    <C-W>-

" coc
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-ember'
\ ]
nmap <silent> <leader>,d <Plug>(coc-definition)
nmap <silent> <leader>,y <Plug>(coc-type-definition)
nmap <silent> <leader>,i <Plug>(coc-implementation)
nmap <silent> <leader>,r <Plug>(coc-references)

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeMouseMode=3
let g:NERDTreeIgnore = [
    \'\.aux$',
    \'\.fls$',
    \'\.fdb_latexmk',
    \'\.log',
    \'\.out',
    \'\.ods',
    \'rusty-tags'
    \]

" fzf
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :Rg<CR>
set wildignore+=*.o,*.hi,*.so,*.jar,*.class,*.tar*

" Highlighting
nnoremap <Leader>h :nohlsearch<CR>

" LanguageClient
set hidden " Required for operations modifying multiple buffers like rename.
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'haskell': ['hie-wrapper']
    \ }
nnoremap <silent> <C-[> :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <C-h> :call LanguageClient#textDocument_hover()<CR>

" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

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

" Prolog dominates Perl
autocmd BufNewFile,BufRead *.pl setfiletype prolog syntax=prolog
let g:filetype_pl = "prolog"

" rusty-tags generation and update
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

