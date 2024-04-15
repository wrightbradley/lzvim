return {
  -- codeium cmp source
  {
    "nvim-cmp",
    dependencies = {
      -- codeium
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      -- vim.api.nvim_out_write("This message will be printed to the message area.\n")
      -- vim.api.nvim_out_write(opts)
      -- opts.sources = opts.sources or {}
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, Util.lualine.cmp_source("codeium"))
    end,
  },
}
