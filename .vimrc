"sourcing / editing this file
map ,sv :source ~/.vimrc<CR>
map ,ev :tabnew ~/.vimrc<CR>
map ,eb :tabnew ~/.bashrc<CR>

"map ,sg :source ~/.gvimrc<CR>
"map ,eg :tabnew ~/.gvimrc<CR>
map ,, :tabfind

"""""""""""""""""""""""""""""""""""""""""
" Searching, mostly from: http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches 
set incsearch ignorecase hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

colorscheme evening
"show line numbers relative to current
set relativenumber

"expand tabs and make them 4 spaces instead of 8
set tabstop=4 shiftwidth=4 expandtab
set autoindent

"""""""""""""""""""""""""""""""""""""""""
" Tabbing
map <C-M-Right> :tabnext<CR>
map <C-M-Left> :tabprev<CR>
map <C-t> :tabnew<CR>
map <C-w> :tabclose<CR>
"map <C-M-1> :tabfirst<CR>
"map <C-M-9> :tablast<CR>

"commenting in visual mode - select some lines and then press '-' to comment and '_' (i.e. <shift>-'-') to uncomment
vmap - :s/^/\/\//<CR>:noh<CR>
vmap _ :s/^\/\///<CR>:noh<CR>
