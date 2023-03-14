set nocompatible              " be iMproved, required
set laststatus=2
filetype off                  " required

" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'adimit/prolog.vim'          " prolog
Plugin 'adimit/prolog.vim'
Plugin 'valloric/youcompleteme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/syntastic'
Plugin 'rakr/vim-one'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'bfrg/vim-cpp-modern'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let $LANG = 'en'
"Setting up .vimrc

source $VIMRUNTIME/vimrc_example.vim
"vim automatically maximize on Windows
"au GUIEnter * simalt ~x

"swap files saved on .vimbackup"
"au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

"Syntax Options

"turn on synax highlighting
syntax enable
"syntax highlighting
syntax on

set termwinscroll=100
set scrolloff=10


filetype plugin on
set omnifunc=syntaxcomplete#Complete

"autoComplete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complet


"Idention & Interface & Search Options

"Line
set cursorline
"auto-identation kicks in 4 spaces
set shiftwidth=4
"tabs are 4 spaces wide
set softtabstop=4
"auto-identation improves
set si
"swap tabs out for spaces
set expandtab
"auto identing
set ai
"show cursor position
set ruler
"display line numbers
set number
"force text to 80 columns"
set tw=80
"stop creating undo file ".un~"
set noundofile

"set nobackup
"set noswapfile

augroup ntoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

" quit preview window ycm
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 1 "adeu hightlight
let g:airline_theme='one'
"let g:airline_theme='simple'

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_concepts_highlight = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

colorscheme one
"set background=dark " for the dark version
set background=light " for the light version

"guifont  font=Fixedsys  height(h)=10
set gfn=Fixedsys:h10
"clipboard default register
set cb=unnamed
"incremental seach that shows partial matches
set is
"enable seach highlighting
set hls
"switch search to case-sensitive when search query contains an uppercase letter
set smartcase


"More Interface Options


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"Comments on Vim
highlight Comment ctermfg=green

autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F6> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $


inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}


set diffexpr=MyDiff()
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
