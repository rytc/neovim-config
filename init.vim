color NeoSolarized
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

let mapleader = ","

set mouse=a

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap ` :buffers<CR>:b<Space>

nnoremap <Leader>a :noh<CR>

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
command -nargs=1 Rs vimgrep /<args>/gj ./** | cw

set number
set exrc
set secure