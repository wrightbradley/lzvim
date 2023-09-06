return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "hcl",
          "ninja",
          "python",
          "rst",
          "terraform",
          "toml",
          "yaml"
        })
      end
    end,
  },
}

