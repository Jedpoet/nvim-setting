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

    --[[
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    ]]--
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
        'fedepujol/move.nvim',
        opts = {
            char = {
                enable = true;
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
        'akinsho/toggleterm.nvim', version = "*", config = true
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
            { "<leader>f", "<cmd>FzfLua grep_curbuf<CR>", desc = "files" },
            { "<leader>fg", "<cmd>FzfLua grep_curbuf<CR>", desc = "files" },
            { "<leader>f/", "<cmd>FzfLua <CR>", desc = "FzfLua self" },
            { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "files" },
            { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "files" },
        },
    },

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
                -- config
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}},
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
        "plasticboy/vim-markdown",
        dependencies = { "godlygeek/tabular" },  -- 確保表格對齊功能可用
        ft = { "markdown" },  -- 只有開啟 Markdown 檔案時才載入
        config = function()
            vim.g.vim_markdown_folding_disabled = 1  -- 不要自動折疊標題
            vim.g.vim_markdown_conceal = 0  -- 顯示標準的 Markdown 符號，不隱藏
            vim.g.vim_markdown_new_list_item_indent = 0  -- 列表對齊
            vim.g.vim_markdown_math = 1  -- 支援 LaTeX 數學模式
            vim.g.vim_markdown_toc_autofit = 1  -- 自動調整 TOC（目錄）的寬度
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
        "ggandor/leap.nvim",
        lazy = true,
        keys = { "E", "R", "W", "dE", "dR", "yE", "yR", "cE", "cR" },
        config = function()
            require("leap").opts.highlight_unlabeled_phase_one_targets = true
            -- leap.add_default_mappings()
            vim.keymap.set({ "x", "o", "n" }, "E", "<Plug>(leap-forward-to)")
            vim.keymap.set({ "x", "o", "n" }, "R", "<Plug>(leap-backward-to)")
            vim.keymap.set({ "x", "o", "n" }, "W", "<Plug>(leap-from-window)")
        end,
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
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
    },

    {
        "rcarriga/nvim-notify",
        lazy = true,
        event = "VeryLazy",
        config = function()
            vim.notify = require("notify")
        end
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- theme
    {
        "gbprod/nord.nvim",
    },

    {
        "zacanger/angr.vim",
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
            "hrsh7th/cmp-buffer", -- buffer auto-completion
            "hrsh7th/cmp-path", -- path auto-completion
            "hrsh7th/cmp-cmdline", -- cmdline auto-completion
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

--[[
require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
})
--]]

