return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to change yaml schema
      { "<leader>sy", "<cmd>Telescope yaml_schema<cr>", desc = "Select YAML schema" },
    },
  },
}
