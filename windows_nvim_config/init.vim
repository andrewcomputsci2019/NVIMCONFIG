call plug#begin('~/.vim/plugged')
"Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Tree sitter and nvim Tree
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
"LSP installer
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"cmp completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

"Tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"rust","c","cpp","go","python","html","javascript","json","css","typescript"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
"NVIM Tree setup lua script
lua <<EOF
require'nvim-tree'.setup()
EOF
"normal mode remap to open nvim tree
nnoremap <C-n> <cmd>NvimTreeToggle<cr>
"LSP completion
luafile ~\AppData\Local\nvim\completion.lua
luafile ~\AppData\Local\nvim\lsp-installer-setup.lua
"telescope
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
"Sets for nvim
set relativenumber
set nu
set hidden
set nowrap
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set noswapfile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=120
