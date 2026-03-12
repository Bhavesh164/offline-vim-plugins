--------------------------------------------------------------------
-- LEADER
--------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------
-- LAZY.NVIM BOOTSTRAP
--------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------
-- PLUGINS
--------------------------------------------------------------------
require("lazy").setup(
    {
        -- Core editing plugins
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
        "tpope/vim-surround",
        "tpope/vim-abolish",
        "AndrewRadev/splitjoin.vim",
        -- Hop for quick navigation
        {
            "phaazon/hop.nvim",
            config = function()
                require("hop").setup {keys = "etovxqpdygfblzhckisuran"}
            end
        },
        -- Which-key for keybinding hints
        {"folke/which-key.nvim", opts = {}},
        -- Theme
        {
            "navarasu/onedark.nvim",
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("onedark")
            end
        },
        -- Statusline
        {
            "nvim-lualine/lualine.nvim",
            opts = {
                options = {
                    icons_enabled = false,
                    theme = "onedark",
                    component_separators = "|",
                    section_separators = ""
                }
            }
        },
        -- Indent guides
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {}
        },
        -- Commenting
        {"numToStr/Comment.nvim", opts = {}},
        ------------------------------------------------------------------
        -- TELESCOPE
        ------------------------------------------------------------------
        {
            "nvim-telescope/telescope.nvim",
            version = "*",
            dependencies = {
                "nvim-lua/plenary.nvim",
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    build = "make",
                    cond = function()
                        return vim.fn.executable("make") == 1
                    end
                }
            },
            config = function()
                require("telescope").setup(
                    {
                        defaults = {
                            mappings = {
                                i = {
                                    ["<C-u>"] = false,
                                    ["<C-d>"] = false
                                }
                            }
                        }
                    }
                )
                pcall(require("telescope").load_extension, "fzf")
            end
        },
        ------------------------------------------------------------------
        -- LSP (Pure Neovim 0.11 - No plugins needed!)
        ------------------------------------------------------------------
        -- LSP progress indicator
        {"j-hui/fidget.nvim", opts = {}},
        ------------------------------------------------------------------
        -- COMPLETION
        ------------------------------------------------------------------
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "rafamadriz/friendly-snippets"
            },
            config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")

                require("luasnip.loaders.from_vscode").lazy_load()

                cmp.setup(
                    {
                        snippet = {
                            expand = function(args)
                                luasnip.lsp_expand(args.body)
                            end
                        },
                        mapping = cmp.mapping.preset.insert(
                            {
                                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                ["<C-Space>"] = cmp.mapping.complete(),
                                ["<C-e>"] = cmp.mapping.abort(),
                                ["<CR>"] = cmp.mapping.confirm({select = true}),
                                ["<Tab>"] = cmp.mapping(
                                    function(fallback)
                                        if cmp.visible() then
                                            cmp.select_next_item()
                                        elseif luasnip.expand_or_jumpable() then
                                            luasnip.expand_or_jump()
                                        else
                                            fallback()
                                        end
                                    end,
                                    {"i", "s"}
                                ),
                                ["<S-Tab>"] = cmp.mapping(
                                    function(fallback)
                                        if cmp.visible() then
                                            cmp.select_prev_item()
                                        elseif luasnip.jumpable(-1) then
                                            luasnip.jump(-1)
                                        else
                                            fallback()
                                        end
                                    end,
                                    {"i", "s"}
                                )
                            }
                        ),
                        sources = cmp.config.sources(
                            {
                                {name = "nvim_lsp"},
                                {name = "luasnip"},
                                {name = "path"}
                            },
                            {
                                {name = "buffer"}
                            }
                        )
                    }
                )
                ------------------------------------------------------------------
                -- CMDLINE COMPLETION
                ------------------------------------------------------------------

                -- `/ and ?` search (buffer words)
                local search_cmdline_opts = {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = {
                        {name = "buffer", keyword_length = 2}
                    }
                }

                for _, cmd in ipairs({"/", "?"}) do
                    cmp.setup.cmdline(cmd, search_cmdline_opts)
                end
            end
        },
        ------------------------------------------------------------------
        -- FFF Search
        ------------------------------------------------------------------
        {
            "dmtrKovalenko/fff.nvim",
            build = function()
                -- this will download prebuild binary or try to use existing rustup toolchain to build from source
                -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
                require("fff.download").download_or_build_binary()
            end,
            -- if you are using nixos
            -- build = "nix run .#release",
            opts = {
                -- (optional)
                debug = {
                    enabled = true, -- we expect your collaboration at least during the beta
                    show_scores = true -- to help us optimize the scoring system, feel free to share your scores!
                }
            },
            -- No need to lazy-load with lazy.nvim.
            -- This plugin initializes itself lazily.
            lazy = false,
            keys = {
                {
                    "ff", -- try it if you didn't it is a banger keybinding for a picker
                    function()
                        require("fff").find_files()
                    end,
                    desc = "FFFind files"
                },
                {
                    "fg",
                    function()
                        require("fff").live_grep()
                    end,
                    desc = "LiFFFe grep"
                },
                {
                    "fz",
                    function()
                        require("fff").live_grep(
                            {
                                grep = {
                                    modes = {"fuzzy", "plain"}
                                }
                            }
                        )
                    end,
                    desc = "Live fffuzy grep"
                },
                {
                    "fc",
                    function()
                        require("fff").live_grep({query = vim.fn.expand("<cword>")})
                    end,
                    desc = "Search current word"
                }
            }
        }
    },
    {}
)

--------------------------------------------------------------------
-- OPTIONS
--------------------------------------------------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.updatetime = 250
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"

--------------------------------------------------------------------
-- LSP SETUP (Pure Neovim 0.11)
--------------------------------------------------------------------
-- Setup lua_ls
vim.lsp.config(
    "lua_ls",
    {
        cmd = {"lua-language-server"},
        root_markers = {".git", ".luarc.json", "init.lua"},
        filetypes = {"lua"},
        settings = {
            Lua = {
                runtime = {version = "LuaJIT"},
                diagnostics = {globals = {"vim"}},
                workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file("", true)
                },
                telemetry = {enable = false}
            }
        }
    }
)

vim.lsp.enable("lua_ls")

-- Setup pylsp (Python)
vim.lsp.config(
    "pylsp",
    {
        cmd = {"pylsp"},
        root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git"},
        filetypes = {"python"},
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {enabled = true},
                    pyflakes = {enabled = true},
                    pylint = {enabled = false}
                }
            }
        }
    }
)

vim.lsp.enable("pylsp")
-- in orfer to work poython lsp server
-- first install pylsp using pip3 install python-lsp-server
-- for this to work we need to check which pylsp
-- if pylsp shows nothing, find where pip installed it:
-- pip3 show python-lsp-server | grep Location
-- open your .bashrc and then add following Command
-- export PATH="$HOME/Library/Python/3.9/bin:$PATH"

--------------------------------------------------------------------
-- KEYMAPS
--------------------------------------------------------------------
vim.keymap.set("i", "kj", "<Esc>", {desc = "Exit insert mode"})
vim.keymap.set("n", "tt", ":", {desc = "Command mode"})
vim.keymap.set("n", "<leader>h", "<cmd>HopWord<CR>", {desc = "Hop to word"})
vim.keymap.set("n", "<leader>t", vim.cmd.Ex, {desc = "File explorer"})

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Find files"})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Live grep"})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "Buffers"})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {desc = "Help tags"})

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition"})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {desc = "Go to references"})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Hover documentation"})
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename"})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code action"})

--------------------------------------------------------------------
-- AUTOCMDS
--------------------------------------------------------------------
vim.api.nvim_create_autocmd(
    "TextYankPost",
    {
        callback = function()
            vim.highlight.on_yank()
        end
    }
)

vim.cmd("set nofoldenable")

