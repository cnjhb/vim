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
" Plug 'rhysd/vim-clang-format'
" Plug 'skywind3000/vim-auto-popmenu'
 Plug 'cnjhb/vim-dict'
 Plug 'easymotion/vim-easymotion'
" Plug 'junegunn/fzf.vim'
" Plug 'junegunn/fzf'
" Plug 'github/copilot.vim'
" Plug 'dense-analysis/ale'
" Plug 'chrisbra/unicode.vim'
 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/nvim-cmp'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/vim-vsnip'
 Plug 'p00f/clangd_extensions.nvim'
call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup{
ensure_installed = {"c","cpp","vim","vimdoc","python","bash","fish","make","lua","vala","json","cmake","javascript","java","kotlin","yaml","xml"},
    highlight = {
	enable = true,
	disable = {
	    "c",
	    "cpp",
	}
    },
}

local cap = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.clangd.setup{
    cmd = { 'clangd' },
    capabilities = cap
}

local cmp = require'cmp'
local feedkeys = require'cmp.utils.feedkeys'

local t = function (str)
    return vim.api.nvim_replace_termcodes(str,true,true,true)
end

cmp.setup{
    snippet = {
	expand = function(args)
	    vim.fn["vsnip#anonymous"](args.body)
	end,
    },
    mapping = cmp.mapping.preset.insert{
	['<CR>'] = cmp.mapping.confirm{ select = true },
	['<C-j>'] = cmp.mapping(function (fallback)
	    if vim.fn['vsnip#jumpable'](1) == 1 then
		feedkeys.call(t"<Plug>(vsnip-jump-next)", "")
	    else
		fallback()
	    end
	end, { 'i', 's', 'c' }),
	['<C-h>'] = cmp.mapping(function (fallback)
	    if vim.fn['vsnip#jumpable'](-1) == 1 then
		feedkeys.call(t"<Plug>(vsnip-jump-prev)", "")
	    else
		fallback()
            end
	end, { 'i', 's', 'c' }),
    },
    sources = cmp.config.sources({
	{ name = 'vsnip' },
	{ name = 'nvim_lsp' },
	{ name = 'buffer' },
	{ name = 'path' },
    }),
}

vim.api.nvim_create_autocmd('LspAttach',{
    group = vim.api.nvim_create_augroup('UserLspConfig',{}),
    callback = function(ev)
	vim.keymap.set('n','<space>f',function()
	    vim.lsp.buf.format { async = true }
	end,opts)
	vim.keymap.set('n','<space>r',vim.lsp.buf.references,opts)
	vim.keymap.set('i','<C-n>',function()
	    if cmp.visible() then
		cmp.select_next_item()
	    else
		return "<C-n>"
	    end
	end,opts)
	vim.keymap.set('i','<C-p>',function()
	    if cmp.visible() then
		cmp.select_prev_item()
	    else
		return "<C-p>"
	    end
	end,opts)
	require("clangd_extensions.inlay_hints").setup_autocmd()
	require("clangd_extensions.inlay_hints").set_inlay_hints()
    end,
})
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
if 0
set complete=.,k,w,b
set completeopt=menu,menuone,noselect
set shortmess+=c
endif
set tags=./.tags;,.tags

let g:ctrlp_root_markers = ['.root']

"let g:clang_format#code_style = "webkit"

"let g:clang_format#style_options = {'BasedOnStyle':'WebKit','IndentCaseLabels':'true'}

let g:apc_enable_ft ={'*':1}

let g:vim_dict_config= {'html':'html,javascript,css','c':'c,glib'}

"let g:ale_c_cc_executable = "gcc"
"let g:ale_c_cc_options = "-std=gnu99"

"let g:copilot_ignore_node_version = v:true
"let g:copilot_no_tab_map = v:true
"imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")

map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <C-s> :w<cr>
nmap <M-q> :q<cr>

color dracula
