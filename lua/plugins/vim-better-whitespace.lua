return {
  {
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.api.nvim_command("augroup vimrc")
      vim.api.nvim_command("autocmd TermOpen * :DisableWhitespace")
      vim.api.nvim_command("augroup END")
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitelines_at_eof = 0
    end,
  },
}
