return {
  -- https://www.reddit.com/r/neovim/comments/sk70rk/using_github_copilot_in_neovim_tab_map_has_been/
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      vim.api.nvim_set_keymap("i", "<C-I>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      -- Other Maps
      -- *copilot-i_CTRL-]*
      -- <C-]>                   Dismiss the current suggestion.
      -- <Plug>(copilot-dismiss)
      -- *copilot-i_ALT-]*
      -- <M-]>                   Cycle to the next suggestion, if one is available.
      -- <Plug>(copilot-next)
      -- *copilot-i_ALT-[*
      -- <M-[>                   Cycle to the previous suggestion.
      -- <Plug>(copilot-previous)
      -- *copilot-i_ALT-\*
      -- <M-\>                   Explicitly request a suggestion, even if Copilot
      -- <Plug>(copilot-suggest) is disabled.
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
