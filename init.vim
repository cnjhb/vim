call plug#begin()
 Plug 'dracula/vim'
 Plug 'skywind3000/vim-terminal-help'
 Plug 'vim-airline/vim-airline'
 Plug 'kana/vim-textobj-user'
 Plug 'kana/vim-textobj-entire'
 Plug 'kana/vim-textobj-function'
 Plug 'kana/vim-operator-user'
 Plug 'mhinz/vim-startify'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'nvim-treesitter/nvim-treesitter'
 Plug 'rhysd/vim-clang-format'
 Plug 'skywind3000/vim-auto-popmenu'
 Plug 'skywind3000/vim-dict'
call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup{
    highlight = {
	enable = true,
    }
}
EOF

set relativenumber
set scrolloff=999
set cursorline
set termguicolors
set fileencodings=ucs-bom,utf-8,gb2312,default,latin1
set encoding=UTF-8
set shiftwidth=4
set lazyredraw
set splitright
set splitbelow
set complete=.,k,w,b
set completeopt=menu,menuone,noselect
set shortmess+=c

let g:ctrlp_root_markers = ['.root']

let g:clang_format#code_style = "webkit"

let g:apc_enable_ft ={'c':1}

color dracula
