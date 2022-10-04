inoremap kj <Esc>
:set tabstop=4
:set shiftwidth=4
:set autoindent
:set smartindent
:set number
:set hidden
:set foldmethod=indent   
:set foldnestmax=10
:set nofoldenable
:set foldlevel=10 " if not set it will fold entire region first time
:set ignorecase
:set mouse=a
:set splitright
:set wildignorecase
set clipboard=unnamedplus
set iskeyword+=-
set iskeyword+=_
" Paste system clipboard with Ctrl + v
inoremap <C-v> <ESC>"+gPi    
"nnoremap <C-v> "+gP<ESC>
vnoremap <C-v> d"+gP<ESC>
cnoremap <C-v> <C-r>+

" Cut to system clipboard with Ctrl + x
vnoremap <C-x> "+d
"nnoremap <C-x> "+dd
inoremap <C-x> <ESC>"+ddi

" Copy to system clipboard with Ctr + c
vnoremap <C-c> "+y
nnoremap <C-c> "+yy
inoremap <C-c> <ESC>"+yyi
vmap y y`]

nnoremap tt :
imap <C-BS> <C-W>
" auto close brackets
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
filetype plugin indent on
"autocmd BufWritePre * :normal gg=G''
" auto close brackets end

:set backspace=indent,eol,start
" create file in current directory command 
" :e %:h/filename

let mapleader=" "
" color slate
" if has("gui_running")
" 	" Set a nicer font.
" 	set guifont=Consolas:h11:cDEFAULT
" endif

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag':'nvim-0.6' }
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'easymotion/vim-easymotion'
""Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter' " We recommend updating the parsers on update
Plug 'sbdchd/neoformat'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'tomtom/tcomment_vim'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'php'] }
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'joshdick/onedark.vim'

Plug 'neovim/nvim-lspconfig', { 'tag': 'v0.1.2'}
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp', {'commit':'e23de1f2b4e32bc6d9a37ad3458f2924973df628'}

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ThePrimeagen/harpoon'
Plug 'dylanaraps/fff.vim'
Plug 'pechorin/any-jump.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/tagbar'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-repeat'
Plug 'phaazon/hop.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'tpope/vim-abolish' " convert into upper,snake case
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'gelguy/wilder.nvim' "autocomplete in command line, search :updateremoteplugins if python not worked
Plug 'Bhavesh164/vim-cpp'
Plug 'Bhavesh164/cool-vim'
"Plug 'wellle/context.vim' " sticky function header
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired' " browse quick fix list using [q ]q
Plug 'Bhavesh164/nvim-blame-line'
Plug 'RRethy/vim-illuminate' " highlight vairables
Plug 'williamboman/mason.nvim' "modern lsp installer
Plug 'adinapoli/vim-markmultiple' " cntrl+n to select a word
Plug 'AndrewRadev/deleft.vim' "dh keybinding to delete blocks like if/ try,catch, div
call plug#end()

" fff file manager hot key
nnoremap <leader>fi f :F<CR>  

" fzf ripgrep
nnoremap <leader>g :Rg! 

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>o <cmd>Telescope current_buffer_fuzzy_find<cr>

"copy funciton remap key
nnoremap <leader>fd Vj%y

let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

"copy file path 
nnoremap <Leader>fc :let @+=expand('%:p')<CR> 
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"vendor"} } }
EOF
" subertab change configuration
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 1
lua << EOF
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})
EOF
vmap <Tab> >gv
vmap <S-Tab> <gv
" TO format HTML
" :%s/></>\r</g
" gg=G
" when running at every change you may want to disable quickfix
let b:prettier_ft_default_args = {
            \ 'parser': 'php',
            \ }
syntax on
":'<,'>s/\v%Vfind_text/replace_text/g  -- replace text in visual mode
" lsp config
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
-- require'lspconfig'.intelephense.setup{}
 local servers = { 'intelephense' }
 for _, lsp in ipairs(servers) do
   nvim_lsp[lsp].setup {
	 capabilities =capabilities,
     on_attach = on_attach,
     cmd={"intelephense","--stdio"},
     flags = {
       debounce_text_changes = 150,
     }
   }
 end
EOF
" autocomplted configuration of lsp
set completeopt=menu,menuone,noselect
lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
EOF

lua <<EOF
require'hop'.setup()
EOF
" Harpoon configuration 
nnoremap <silent><leader>af <cmd>lua require("harpoon.mark").add_file()<cr>
" nnoremap <silent><leader>h <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>fo :lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>

" Or override all default colors
hi Pmenu guibg=#1b1b1b ctermbg=55 ctermfg=White

"remove trailing white spaces function
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"float term configurations
nnoremap <A-t> :FloatermNew --height:1.0 --width=1.0<CR>
tnoremap <silent> <C-Space>  <C-\><C-n>:FloatermToggle<CR>
noremap  <silent> <C-Space>  :FloatermToggle<CR>

" tag bar configuartions
nmap <F8> :TagbarToggle<CR>

"coolvim for disable highlilght
"text expander in vim
source $HOME/.config/nvim/general/abb.vim
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!xdg-open '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap <silent> gx :call HandleURL()<cr>
nnoremap <silent> <leader>h <cmd>HopWord<cr>

" visaul yanking only one time
vnoremap p "_dP

"wilder nvim minimal config
call wilder#setup({'modes': [':', '/', '?']})

nnoremap <silent> <f2> :CompileAndRun<cr>

" center the cursor 
autocmd CursorMoved,CursorMovedI * call Center_cursor()

function! Center_cursor()
    let pos = getpos(".")
    normal! zz
    call setpos(".", pos)
endfunction

"nvim-treesitter-context methods
lua <<EOF
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            'for', -- These won't appear in the context
            'foreach',
            'while',
            'if',
			'else if',
			'else',
            'switch',
            'case',
        },
    },
}
EOF

lua << EOF
require("mason").setup()
EOF
