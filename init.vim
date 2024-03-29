inoremap kj <Esc>
:set tabstop=4
:set shiftwidth=4
:set path=.,,** "current directory search with tabfind
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
:set clipboard=unnamedplus
:set splitright
:set wildignorecase
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
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
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
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ThePrimeagen/harpoon'
Plug 'ronakg/quickr-preview.vim'
Plug 'pechorin/any-jump.vim'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/tagbar'
Plug 'tommcdo/vim-exchange'
Plug 'lambdalisue/suda.vim'
Plug 'SirVer/ultisnips'  "python3 -m pip install --user --upgrade pynvim
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'phaazon/hop.nvim' "easy motion alternative
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'tpope/vim-abolish' " convert into upper,snake case
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gelguy/wilder.nvim' "autocomplete in command line, search :updateremoteplugins if python not worked
Plug 'Bhavesh164/vim-cpp'
Plug 'Bhavesh164/cool-vim'
" Plug 'wellle/context.vim' "sticky function header
Plug 'nvim-treesitter/nvim-treesitter-context' "same as sticky header but only with neovim
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired' " browse quick fix list using [q ]q
Plug 'Bhavesh164/nvim-blame-line'
Plug 'RRethy/vim-illuminate' " highlight vairables
" Plug 'adinapoli/vim-markmultiple' " cntrl+n to select a word
Plug 'AndrewRadev/deleft.vim' "dh keybinding to delete blocks like if/ try,catch, div
Plug 'AndrewRadev/tagalong.vim' "rename a html tag
Plug 'AndrewRadev/multichange.vim' "mark multiple advanced version
Plug 'AndrewRadev/splitjoin.vim'  " bindings are gJ and gS
Plug 'AckslD/nvim-neoclip.lua'
Plug 'm-demare/hlargs.nvim'  " make function arguments color separate
Plug 'brooth/far.vim' "modern find and replace
Plug 'AndrewRadev/switch.vim' " this plugin change true to false with switch statement or with keybinding like '-'
call plug#end()

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
require('neoclip').setup()
require('telescope').setup{ defaults = { file_ignore_patterns = {"vendor"} } }
require('telescope').load_extension "neoclip"
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
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
-- enable lsp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
local servers = { 'intelephense' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
	cmd={"intelephense","--stdio"},
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF
" autocomplted configuration of lsp (new)
set completeopt=menu,menuone,noselect
lua << EOF
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_snipmate").load({ include = { "php" } }) --for snippets to work need to install vim-snippets plugin

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
	{name = 'luasnip', keyword_length = 2},
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})
EOF

lua <<EOF
require'hop'.setup()
EOF

" Harpoon configuration 
" nnoremap <silent><leader>af <cmd>lua require("harpoon.mark").add_file()<cr>
" nnoremap <silent><leader>h <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
" nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
" nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
" nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>fo :lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>

" any jump colors
" Or override all default colors
hi Pmenu guibg=#1b1b1b ctermbg=Black ctermfg=White
hi PmenuSel ctermbg=yellow
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Black",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

"remove trailing white spaces function
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"float term configurations
nnoremap <A-t> :FloatermNew<CR>
tnoremap <silent> <C-Space>  <C-\><C-n>:FloatermToggle<CR>
noremap  <silent> <C-Space>  :FloatermToggle<CR>

" ultisnips configurations
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"c++ templates skelton file
:autocmd BufNewFile *.cpp 0r ~/AppData/Local/nvim/plugged/templates/skeleton.cpp

"workaround of yanking text into clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
nnoremap <leader>h <cmd>HopWord<cr>

"wilder nvim minimal config
call wilder#setup({'modes': [':', '/', '?']})

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

" indentation jumping, sometimes useful
noremap <silent> <M-k> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
noremap <silent> <M-j> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

"function to get new line with semi colon

fun! NewLine()
    let l:save = winsaveview()
	keeppatterns '<,'>s/;/&\r/g | norm dd
    call winrestview(l:save)
endfun

"set color scheme after plugin is initialized
set termguicolors
colorscheme onedark

lua << EOF
require('hlargs').setup()
EOF

let g:quickr_preview_exit_on_enter = 1

"shortcut to find and replace
nnoremap S :%s//g<left><left>

" for nvim wilder menu solving error
if has('python') " if dynamic py|py3, this line already activates python2.                                                                                   
let s:python_version = 2                                                                                                                                   
elseif has('python3')                                                                                                                                        
let s:python_version = 3 
else
let s:python_version = 0
endif

"source abbrevations
source /home/bhavesh/.config/nvim/general/abb.vim

" Make Y yank till end of line
vnoremap y ygv<Esc>

"key mappings
nnoremap <leader>c :!chmod +x %<CR>
nnoremap <leader>v 0y$$
let g:switch_mapping = "-"

"text objects key mappings
onoremap ae :<C-U>silent! normal ggvG<CR>
vnoremap ae :<C-U>silent! normal ggvG<CR>
