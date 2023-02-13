return {
  {
    "github/copilot.vim",
    config = function()
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.g.copilot_no_tab_map = true
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
}
