if true then
  return {}
end
return {
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      pyenv_path = "/home/cado/.pyenv/versions",
    },
    config = function()
      local home = vim.fn.expand("$HOME")
      -- local pwd = vim.fn.expand("$PWD")
      require("venv-selector").setup({
        pyenv_path = home .. "/.pyenv/versions",
        auto_refresh = true,
        name = { "venv", ".venv", ".direnv/python-3.11" },
      })
    end,
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
