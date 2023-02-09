return {
  -- You must install glow globally
  -- https://github.com/charmbracelet/glow
  {
    "ellisonleao/glow.nvim",
    ft = { "markdown" },
    config = function()
      require("glow").setup()
    end,
  },
}
