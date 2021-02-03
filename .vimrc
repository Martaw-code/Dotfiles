"Setting up .vimrc


source $VIMRUNTIME/vimrc_example.vim
"vim automatically maximize on Windows
"au GUIEnter * simalt ~x


"Syntax Options

"turn on synax highlighting
syntax enable
"syntax highlighting
syntax on


"Idention & Interface & Search Options

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

augroup ntoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

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

"Vim Color Scheme
colorscheme peachpuff
"flash the screen instead of beeping on errors
set visualbell


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
