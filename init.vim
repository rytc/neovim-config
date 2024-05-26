
call plug#begin('~\AppData\Local\nvim-data\plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'rytc/jai.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'posva/vim-vue'

call plug#end()

colorscheme NeoSolarized

set guifont=Berkeley\ Mono:h9
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set mouse=a
set clipboard^=unnamed,unnamedplus
set nowrap

let g:fzf_preview_window = []
let g:fzf_layout = { 'down': '~25%' }


let mapleader = ","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap ` :Buffers<CR>
nnoremap <Leader>a :noh<CR>
nnoremap <Leader>o :GFiles<CR>
nnoremap <Leader>f :Rg<CR>

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F5> :ToggleTerm<CR>
command -nargs=1 Rs vimgrep /<args>/gj ./** | cw
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 


set number
set exrc
set secure
set ff=unix
