source $VIMRUNTIME/mswin.vim

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required 

"source $VIMRUNTIME/macmap.vim

"""""""""""""""""""""""""""""""""""""""""
" sourcing / editing this file
map ,sv :source ~/_vimrc<CR>
map ,ev :tabnew ~/_vimrc<CR>
map ,sg :source ~/_gvimrc<CR>
map ,eg :tabnew ~/_gvimrc<CR>
map ,, :tabfind 

" set current working directory to directory of current file
map ,sc :cd %:p:h<CR>

"""""""""""""""""""""""""""""""""""""""""
" Searching, mostly from: http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches 
set incsearch ignorecase hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" F8 highlights occurences of word under cursor
"vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>

" make the tab-completion of filenames more like bash
set wildmode=longest,list,full
set wildmenu

" Enter to highlight word under selection - why is this so different
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
"nnoremap <silent> <expr> <CR> Highlighting()

" Search for gui selected text (press F8), multiple all occurences will be highlighted
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>


" In .vimrc, for example:
autocmd BufRead,BufNewFile *.c,*.xcpj,*.xcws,*.xcpp set filetype=c

" Replace the current word (in word) with the last yanked or deleted word.  
" also replace visual selection.  From http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
" Note, yanking a word with yiw (yank in word) which gets the whole word from any part of the word
" is helpful from this context
nnoremap S "_diwP
vnoremap S "_dP

"""""""""""""""""""""""""""""""""""""""""
" Tabbing
map <C-tab> :tabnext<CR>
map <C-S-tab> :tabprev<CR>
map <C-t> :tabnew<CR>
map <C-w> :tabclose<CR>
map <C-1> :tabfirst<CR>
map <D-1> :tabfirst<CR>
map <S-D-1> :tablast<CR>

"""""""""""""""""""""""""""""""""""""""""
" Commenting - uses EnhancedCommentify Script. http://www.vim.org/scripts/script.php?script_id=23
" see :help EnhancedCommentify
"vmap co :call EnhancedCommentify('','guess')<CR>
"vmap cc :call EnhancedCommentify('','comment')<CR>
"vmap cd :call EnhancedCommentify('','decomment')<CR>
vmap - :s/^/\/\//<CR>:noh<CR>
vmap _ :s/^\/\///<CR>:noh<CR>
