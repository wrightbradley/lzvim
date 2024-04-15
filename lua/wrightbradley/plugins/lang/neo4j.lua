return {
  {
    "neo4j-contrib/cypher-vim-syntax",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cypher_ls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cypher-language-server",
      })
    end,
  },
}
