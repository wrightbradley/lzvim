return {
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      { "<leader>gws", "<cmd>Telescope git_worktree git_worktrees<cr>", desc = "Switch git worktrees" },
      {
        "<leader>gwc",
        "<cmd>Telescope git_worktree create_git_worktree<cr>",
        desc = "Create and switch to new worktree",
      },
    },
  },
}
