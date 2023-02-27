return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- opts will be merged with the parent spec
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return require("yaml-companion").get_buf_schema(0)
        end,
        cond = function()
          local schema = require("yaml-companion").get_buf_schema(0)
          if schema.result[1].name == "none" then
            return ""
          end
          return schema.result[1].name
        end,
      })
      table.insert(opts.sections.lualine_z, "😄")
    end,
  },
}
