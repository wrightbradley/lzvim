-- Show context of the current function
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  enabled = true,
  opts = { mode = "cursor", max_lines = 3 },
  keys = {
    {
      "<leader>ut",
      function()
        local tsc = require("treesitter-context")
        tsc.toggle()
        if Util.inject.get_upvalue(tsc.toggle, "enabled") then
          Util.info("Enabled Treesitter Context", { title = "Option" })
        else
          Util.warn("Disabled Treesitter Context", { title = "Option" })
        end
      end,
      desc = "Toggle Treesitter Context",
    },
  },
}
