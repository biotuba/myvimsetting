" ---------------------------------------
"  vimrc for windows
"  Original Author: keelii
"  Editor: YKL
" ---------------------------------------

" Startup {{{
filetype indent plugin on
colo desert
" vim fold
"augroup ft_vim
"	au!
"	au FileType vim setlocal foldmethod=marker
"augroup END
" }}}	
" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
set clipboard+=unnamed
set winaltkeys=no
set ignorecase
set incsearch
source $VIMRUNTIME\mswin.vim
behave mswin
" }}}
" Language & Encoding {{{
setglobal fileencodings=ucs-bom,utf-8,chinese
set encoding=utf8
set langmenu=zh_TW.utf8
language messages zh_tw.utf8 
"
"
" }}}
"  GUI {{{
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Vim with all enhancements
" source $VIMRUNTIME/vimrc_example.vim
set guifont=Hack:h12
set cursorline
set hlsearch
set nu rnu
set lines=35 columns=140
set splitbelow
set splitright
" 不顯示工具列設定
" set guioptions-=T
" set guioptions-=m
" set guioptions-=L
" set guioptions-=r
" set guioptions-=b
set guioptions-=e
set nolist
"
"  }}}
" Format {{{
set autoindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set foldmethod=indent
set shiftwidth=4
syntax on
" }}}
" Key Mapping {{{
let mapleader=";"
" Toggles
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F4> :TableModeToggle<CR>

nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tN :tabN<CR>
nnoremap <leader>todo :wall<CR>:vimgrep /\[ \]/g *.*<CR>:copen<CR>
nnoremap <leader>setup :wall<CR>:tabe c:\tools\vim\_vimrc
nnoremap <leader>bm :wall<CR>:tabe D:\temp\log\常用網站.md<CR>
noremap <leader>apply :w<cr>:so c:\tools\vim\_vimrc<CR>
nnoremap <F3> "=strftime("%c")<CR>p
nnoremap <leader>q :q
nnoremap <leader>w :w
inoremap <F3> <Esc>"=strftime("%c")<CR>pa
inoremap img<Tab> ![]()<esc>F("*pF[a
nnoremap ;lnk i[]()<esc>F("*pF[a
inoremap lnk<Tab> []()<esc>F("*pF[a
" 新任務
inoremap nj<tab> <esc>0I# [ ] () <esc>"=strftime("%c")<cr>pF)a 
nnoremap nj 0I# [ ] () <esc>"=strftime("%c")<cr>pF)a 

" 視窗移動
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l
nnoremap <leader>ww <c-w>w
nnoremap <leader>wp <c-w>p
nnoremap <leader>wJ <c-w>J
nnoremap <leader>w< <c-w>20<
nnoremap <leader>w> <c-w>20>
" visual block mode
nnoremap <leader>vb <c-s-q> 

"
" }}}
" Plugin {{{
call plug#begin('C:\tools\vim\vim81\pluged')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'powerline/powerline'
"Plug 'nelstrom/vim-markdown-folding'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()
" }}}

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" vim-markdown-folding
set nocompatible
if has("autocmd")
        filetype plugin indent on
endif

" NERDTree {{{
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
"


