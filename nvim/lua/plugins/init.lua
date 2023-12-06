return {
    {
        "nvim-telescope/telescope.nvim", 
        version = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    {
        "killer29018/template.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        }
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            {
                'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
            },

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    'nvim-treesitter/playground',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    'nvim-tree/nvim-web-devicons',

    'norcalli/nvim-colorizer.lua',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },

    {
        'mg979/vim-visual-multi',
        branch = 'master'
    },

    'karb94/neoscroll.nvim',

    'echasnovski/mini.comment',

    'echasnovski/mini.move',

    'echasnovski/mini.pairs',

    'derekwyatt/vim-fswitch',

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        tag = 'nightly'
    },

    'sheerun/vim-polyglot',

    'chentoast/marks.nvim',

    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn["mkdp#util#install"]()
        end
    },

    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    'lervag/vimtex',

    'stevearc/vim-arduino',

    {
        'kylechui/nvim-surround',
        version = "*"
    },

    -- Themes
    -- {
    --     'rose-pine/neovim',
    --     name = 'rose-pine',
    -- },

    -- {
    --     'folke/tokyonight.nvim',
    --     name = 'tokyonight'
    -- },

    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme carbonfox]])
        end
    },

    -- {
    --     'uloco/bluloco.nvim',
    --     name = 'bluloco',
    --     dependencies = {
    --         'rktjmp/lush.nvim'
    --     }
    -- },

    -- {
    --     'sainnhe/everforest',
    --     name = 'everforest'
    -- },

    -- {
    --     'sainnhe/sonokai',
    --     name = 'sonokai'
    -- },
}
