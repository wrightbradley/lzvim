return {
  {
    "towolf/vim-helm",
    dependencies = { -- optional packages
      "mrjosh/helm-ls",
    },
  },
  -- {
  --   "mrjosh/helm-ls",
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        helm_ls = {},
      },
    },
  },
}
