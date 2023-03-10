-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme melange')
    end
})

-- parsers for color highlighting
use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
 --
use { "ellisonleao/gruvbox.nvim" }
use ("savq/melange")
use ("sainnhe/sonokai")

-- Git
use('tpope/vim-fugitive')


-- all these plugins are related to LSP
use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

use({
    "sbdchd/neoformat",
    config = function()
      vim.api.nvim_create_autocmd({ "BufWritePre", "TextChanged" }, {
        pattern = {
          "*.json",
          "*.yml",
          "*.yaml",
          "*.js",
          "*.ts",
          "*.lua",
          "*.cpp",
          "*.hpp",
          "*.cxx",
          "*.hxx",
          "*.cc",
          "*.c",
          "*.h",
          "*.rs",
          "*.py",
        },
        command = "Neoformat",
      })
    end,
  })




  -- Status line ----
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}


--- chatGPT
use({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})

-- indentation line
use ("lukas-reineke/indent-blankline.nvim")

end)
