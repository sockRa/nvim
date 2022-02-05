set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set winwidth=79
set winheight=50

syntax enable
filetype plugin on

call plug#begin(stdpath('data') . '/plugged')

" telescope setup
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" nerdtree
Plug 'preservim/nerdtree'

" git
Plug 'https://github.com/tpope/vim-fugitive'

" airline
Plug 'vim-airline/vim-airline'

" color schemes
Plug 'EdenEast/nightfox.nvim'
Plug 'gruvbox-community/gruvbox'


call plug#end()

"alternativt nightfox
colorscheme nightfox
"highlight Normal guibg=none

"remaps mode lhs rhs
nnoremap J 5j
nnoremap K 5k

"remap leader key to <space>
let mapleader = " "

"telescope shortcut
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > " )})<CR>

"nerdtree binding
nnoremap <leader>n : NERDTreeToggle<CR>

" AutoCommands
" trailing whitespace
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup buf_write_pre_trim_whitespace
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup end
