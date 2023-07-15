return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "terraform",
          "hcl",
        })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {},
        tflint = {},
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        local null_ls = require("null-ls")
        vim.list_extend(opts.sources, {
          null_ls.builtins.formatting.terraform_fmt,
          null_ls.builtins.diagnostics.terraform_validate,
        })
      end
    end,
  },
  {
    "hashivim/vim-terraform",
    config = function()
      vim.cmd([[let g:terraform_fmt_on_save=1]])
      vim.cmd([[let g:terraform_align=1]])
    end,
  },
}
