local packer = require("packer")
local use = packer.use

-- using { } for using different branch , loading plugin with certain commands etc
return require("packer").startup(
    function()
        use "wbthomason/packer.nvim"

        -- color related stuff
        use "norcalli/nvim-base16.lua"
        use "norcalli/nvim-colorizer.lua"
        use 'sjl/badwolf'
        -- use "ollykel/v-vim" -- v syntax highlighter

        -- lsp stuff
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
        use "hrsh7th/nvim-compe"
        use "onsails/lspkind-nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/lsp-status.nvim"
        use "lewis6991/gitsigns.nvim"
        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"
        use "windwp/nvim-autopairs"
        use "alvan/vim-closetag"

        -- snippet support
        use "hrsh7th/vim-vsnip"
        use "rafamadriz/friendly-snippets"

        -- file managing , picker etc
        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"
        use "ryanoasis/vim-devicons"
        use "nvim-lua/popup.nvim"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"

        -- FZF Related
        -- use
        -- {
          -- 'ojroques/nvim-lspfuzzy',
            -- requires =
            -- {
              -- {'junegunn/fzf'},
              -- {'junegunn/fzf.vim'},  -- to enable preview (optional)
            -- },
        -- }

        -- misc
        use "tweekmonster/startuptime.vim"
        use "907th/vim-auto-save"
        use "folke/which-key.nvim"
        use "terrortylor/nvim-comment"
        use "rmagatti/auto-session"

        -- git
        use "tpope/vim-fugitive"
        use "APZelos/blamer.nvim"

        use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}
    end,
    {
        display = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
        }
    }
)
