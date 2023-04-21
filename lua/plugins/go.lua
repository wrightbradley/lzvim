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
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      require("go").setup({
        goimport = "gopls", -- Use gopls for imports
        max_line_len = 120, -- Max line length for formatting
        -- tag_transform = "snakecase", -- Use snake_case for tags
        verbose = false,
        lsp_cfg = {
          capabilities = capabilities,
          -- other setups
        },
        lsp_gofumpt = true, -- Use gofumpt with LSP formatting
        -- lsp_on_attach = false, -- Disable LSP on attach
        -- dap_debug = false, -- Disable DAP debugger
      })
      require("go.format").goimport()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
