call plug#begin('~\AppData\Local\nvim-data\plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()

color NeoSolarized

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set mouse=a

let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '~25%' }

let mapleader = ","


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ` :Buffers<CR>
nnoremap <Leader>a :noh<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>f :Rg<CR>


map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
command -nargs=1 Rs vimgrep /<args>/gj ./** | cw

set number
set exrc
set secure