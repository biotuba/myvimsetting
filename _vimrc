" ---------------------------------------
"  vimrc for windows
"  Original Author: keelii
"  Editor: YKL
" ---------------------------------------

" Startup {{{
filetype indent plugin on
source $VIMRUNTIME\mswin.vim
behave mswin
" vim fold
augroup ft_vim
	au!
	au FileType vim setlocal foldmethod=marker
augroup END
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
" }}}
" Language & Encoding {{{
set fileencodings=ucs-bom,utf-8,chinese
set encoding=utf-8
set langmenu=zh_TW.utf-8
language messages zh_tw.utf-8 
"
"
" }}}
"  GUI {{{
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" Vim with all enhancements
" source $VIMRUNTIME/vimrc_example.vim
colorscheme darkblue
set cursorline
set hlsearch
set number
set lines=35 columns=140
set splitbelow
set splitright
set rnu
"set ruler
" 不顯示工具列設定
 set guioptions-=T
 set guioptions-=m
 set guioptions-=L
 set guioptions-=r
 set guioptions-=b
 set guioptions-=e
 set nolist
 set guifont=Hack:h14
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
" Plugin {{{
"
call plug#begin('C:/tools/vim/vim81/pluged') 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()
"
" }}}
" Key Mapping {{{
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap setup :tabe c:\tools\vim\_vimrc<cr>
nnoremap tn :tabn<cr>
nnoremap tN :tabN<cr>
"
" }}}
"
"
"
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

