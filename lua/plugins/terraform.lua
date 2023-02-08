-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add hcl
      vim.list_extend(opts.ensure_installed, {
        "hcl",
      })
    end,
  },
  -- add any tools you want to have installed below
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "terraformls",
  --       "tflint",
  --     },
  --   },
  -- },
  -- add terraformls to lspconfig
  -- add tflint to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        terraformls = {},
        tflint = {},
      },
    },
  },
}
