-- if true then
--   return {}
-- end
return {
  --- languages config ---
  -- golang
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        goimport = "gopls", -- Use gopls for imports
        max_line_len = 120, -- Max line length for formatting
        verbose = false,
        lsp_cfg = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        },
        lsp_gofumpt = true, -- Use gofumpt with LSP formatting
      })
      -- require("go.format").goimport()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },
}
