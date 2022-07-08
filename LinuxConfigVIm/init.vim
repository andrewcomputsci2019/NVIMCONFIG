call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rafamadriz/neon'
Plug 'kyazdani42/blue-moon'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"Autocomplte cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup{
	ensure_installed = {"rust","c","cpp","go","java","python","html","javascript","json","css","typescript"},
	highlight ={
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
}
EOF
"NVIM TREE Setup script
lua <<EOF
require'nvim-tree'.setup()
EOF
"LSP Configs and Installer
luafile ~/.config/nvim/completion.lua
luafile ~/.config/nvim/lsp-installer-setup.lua
"color schemes
lua <<EOF
	vim.g.neon_style = "dark"
	vim.g.neon_italic_comment = true
EOF
set termguicolors
colorscheme neon
highlight Normal guibg=none "comment this line off if you do not use a photobackground or transparent background
highlight NvimTreeNormal guibg=none "comment line this off if you do not use a photobackground or transparent background
"colorscheme blue-moon

"Keybinds
nnoremap <C-n> :NvimTreeToggle<CR>
inoremap <C-s> <cmd>w<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>

"sets
set relativenumber
set nu
set hidden
set nowrap 
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set noswapfile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120
