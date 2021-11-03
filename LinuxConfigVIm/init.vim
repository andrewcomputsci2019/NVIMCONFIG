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
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = true,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when you run `:cd` usually)
  update_cwd          = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 30,
    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,
    -- Hide the root path of the current folder on top of the tree 
    hide_root_folder = false,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    auto_resize = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}
EOF
"LSP Configs and Installer
luafile ~/.config/nvim/completion.lua
luafile ~/.config/nvim/lsp-installer-setup.lua
"out of date check file above^
lua << EOF
		--require'lspconfig'.clangd.setup{}
EOF
lua << EOF
		--require'lspconfig'.jdtls.setup{}
EOF
lua << EOF
--		require'lspconfig'.rust_analyzer.setup{}
EOF
lua << EOF
--		require'lspconfig'.gopls.setup{}						
EOF
lua << EOF
--		require'lspconfig'.bashls.setup{}
EOF
lua << EOF
--		require'lspconfig'.html.setup{}
EOF
lua << EOF
--		require'lspconfig'.pyright.setup{}
EOF
"color schemes
lua <<EOF
	vim.g.neon_style = "dark"
	vim.g.neon_italic_comment = true
EOF
set termguicolors
colorscheme neon
highlight Normal guibg=none
highlight NvimTreeNormal guibg=none
"colorscheme blue-moon

"Keybinds
nnoremap <C-n> :NvimTreeToggle<CR>
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
