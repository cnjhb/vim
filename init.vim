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
 Plug 'cnjhb/vim-dict'
 Plug 'easymotion/vim-easymotion'
call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup{
ensure_installed = {"c","cpp","vim","vimdoc","python","bash","fish","make","lua","vala","json","cmake","javascript","java","kotlin","yaml","xml"},
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

let g:ctrlp_root_markers = ['.root']

let g:clang_format#code_style = "webkit"

let g:apc_enable_ft ={'*':1}

let g:vim_dict_config= {'html':'html,javascript,css','c':'c,glib'}

map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <C-s> :w<cr>
nmap <M-q> :q<cr>

color dracula
