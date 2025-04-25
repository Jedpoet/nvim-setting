local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim" },
                sync_install = false,
                auto_install = false,
                highlight = { enable = true, },
                indent = { enable = true },
            })
        end
    },
    --[[
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    ]] --

    {
        "RRethy/vim-illuminate",
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },
    {
        'fedepujol/move.nvim',
        opts = {
            char = {
                enable = true,
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    {
        'preservim/tagbar',
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        opts = {
            direction = "float",
        },
    },

    {
        "rcarriga/nvim-notify",
        lazy = true,
        event = "VeryLazy",
        config = function()
            local notify = require("notify")

            notify.setup({
                stages = "fade_in_slide_out",
                timeout = 3000,
                fps = 60,
                render = "default",
                background_colour = "Normal",
                max_width = math.floor(vim.o.columns * 0.5),
                max_height = math.floor(vim.o.lines * 0.25),
                level = "TRACE",
            })

            vim.notify = notify
        end,
    },

    -- 自動切換輸入法
    {
        "Jedpoet/im-switch.nvim",
        -- event = "VimEnter",
        config = function()
            require("im-switch").setup()
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
        },
    },

    -- fzf
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {},
        keys = {
            --     { "<leader>f",  "<cmd>FzfLua grep_curbuf<CR>", desc = "files" },
            { "<leader>fg", "<cmd>FzfLua grep_curbuf<CR>", desc = "files" },
            --     { "<leader>f/", "<cmd>FzfLua <CR>",            desc = "FzfLua self" },
            --     { "<leader>ff", "<cmd>FzfLua files<CR>",       desc = "files" },
            --     { "<leader>fb", "<cmd>FzfLua buffers<CR>",     desc = "files" },
        },
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- {
    --     'nvim-telescope/telescope-fzf-native.nvim',
    --     build =
    --     'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    -- },

    {
        "romgrk/nvim-treesitter-context",
        lazy = true,
    },

    {
        "ethanholz/nvim-lastplace",
        lazy = true,
    },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = "doom", -- 或 hyper，選你喜歡的樣式
                config = {
                    header = {
                        "  ",
                        "  ",
                        "########################################################################",
                        "#                                                                      #",
                        "#       ██╗ █████╗ ██████╗ ███████╗██████╗  ██████╗ ███████╗████████╗  #",
                        "#       ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔════╝╚══██╔══╝  #",
                        "#       ██║███████║██║  ██║█████╗  ██████╔╝██║   ██║█████╗     ██║     #",
                        "#  ██   ██║██╔══██║██║  ██║██╔══╝  ██╔═══╝ ██║   ██║██╔══╝     ██║     #",
                        "#  ╚█████╔╝██║  ██║██████╔╝███████╗██║     ╚██████╔╝███████╗   ██║     #",
                        "#   ╚════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝      ╚═════╝ ╚══════╝   ╚═╝     #",
                        "#                                                                      #",
                        "########################################################################",
                        "  ",
                        "  ",
                        "  ",
                    },
                    center = {
                        {
                            icon = "  ",
                            desc = "Find File",
                            key = "f",
                            action = "Telescope find_files",
                        },
                        {
                            icon = "  ",
                            desc = "Recent Files",
                            key = "r",
                            action = "Telescope oldfiles",
                        },
                        {
                            icon = "  ",
                            desc = "Show Lazy",
                            key = "s",
                            action = "Lazy",
                        },
                        {
                            icon = "󰗼  ",
                            desc = "Quit",
                            key = "q",
                            action = ":q",
                        },
                    },
                    footer = {
                        "Peace cannot be kept by force.",
                        "It can only be achieved by understanding."
                    }
                } -- config
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- markdown table
    {
        'Kicamon/markdown-table-mode.nvim',
        config = function()
            require('markdown-table-mode').setup()
        end
    },
    {
        "bullets-vim/bullets.vim",
        config = function()
            vim.g.bullets_enabled_file_types = { "markdown" }
            vim.g.bullets_outline_levels = { "num", "ABC", "abc", "std-", "std+", "std*", "chk" }
            vim.g.bullets_custom_mappins = {
                { 'nmap', 'o', '<Plug>(bullets-newline)' }
            }
        end
    },

    {
        "nathom/filetype.nvim",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("filetype").setup({
                overrides = {
                    extensions = {
                        h = "cpp",
                    },
                }
            })
        end
    },

    {
        "ibhagwan/smartyank.nvim",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("smartyank").setup()
        end,
    },

    {
        "folke/noice.nvim",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
        config = function()
            require("noice").setup({
                lsp = {
                    hover = {
                        enabled = true,
                        opts = {
                            border = "rounded",                          -- 或 "single" / "double" / "solid"
                            max_width = math.floor(vim.o.columns * 0.6), -- 60% 的螢幕寬度
                            max_height = math.floor(vim.o.lines * 0.3),  -- 30% 的螢幕高度
                        },
                    },
                    signature = {
                        enabled = true,
                        opts = {
                            border = "rounded",
                            max_width = math.floor(vim.o.columns * 0.8), -- 50% 的螢幕寬度
                            max_height = math.floor(vim.o.lines * 0.2),  -- 20% 的螢幕高度
                        },
                    },
                    progress = {
                        enabled = true,
                    },
                    message = {
                        enabled = true,
                    },
                },
                routes = {
                    {
                        filter = {
                            event = "notify",
                            find = "No information available",
                        },
                        opts = { skip = true }, -- 避免某些無意義訊息彈出
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = true,
                },
                messages = {
                    enabled = true,
                    view = "notify",
                    view_error = "popup",
                    view_warn = "mini",
                    view_history = "split",
                    view_search = "virtualtext",
                },
                health = {
                    checker = true,
                },
            })
        end,
    },

    -- rust tool
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },

    -- auto format
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                rust = { "rustfmt" },
                lua = { "stylua" },
                python = { "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        }
    },

    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- theme
    {
        "EdenEast/nightfox.nvim"
    },
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
    },
    {
        'nordtheme/vim',
    },
    {
        "zacanger/angr.vim",
    },

    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("inlay-hints").setup()
        end
    },

    -- AI code
    {
        "joshuavial/aider.nvim",
        opts = {
            -- your configuration comes here
            -- if you don't want to use the default settings
            auto_manage_context = true, -- automatically manage buffer context
            default_bindings = true,    -- use default <leader>A keybindings
            debug = false,              -- enable debug logging
        },
    },

    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",   -- buffer auto-completion
            "hrsh7th/cmp-path",     -- path auto-completion
            "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

    -- Game
    {
        "seandewar/nvimesweeper",
    },

    {
        'jim-fx/sudoku.nvim',
        cmd = "Sudoku",
        config = function()
            require("sudoku").setup({
                -- configuration ...
            })
        end
    },
})


require('move').setup({})

require("ibl").setup()

require("nvim-lastplace").setup({
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = {
        "gitcommit",
        "gitrebase",
        "svn",
        "hgcommit",
    },
    lastplace_open_folds = true,
})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

-- require('telescope').load_extension('fzf')
