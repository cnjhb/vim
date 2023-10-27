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
 Plug 'skywind3000/asyncrun.vim'
 Plug 'skywind3000/asynctasks.vim'
call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup{
ensure_installed = {"c","c","vim","vimdoc","python","bash","fish","make","lua","vala","json","cmake","javascript","java","kotlin","yaml","xml"},
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
set tags=./.tags;,.tags

let g:ctrlp_root_markers = ['.ctrlp_root','.root']

let g:clang_format#code_style = "webkit"

let g:apc_enable_ft ={'*':1}

let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.root']
noremap <silent><s-f9> :AsyncTask project-build<cr>
noremap <silent><s-f10> :AsyncTask project-rebuild<cr>

color dracula
