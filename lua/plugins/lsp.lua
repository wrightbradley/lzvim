return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- a list of all tools you want to ensure are installed upon
      -- start; they should be the names Mason uses for each tool
      ensure_installed = require("plugins.extras.lsp.mason.installer"),
      -- if set to true this will check each tool for updates. If updates
      -- are available the tool will be updated. This setting does not
      -- affect :MasonToolsUpdate or :MasonToolsInstall.
      -- Default: false
      auto_update = true,
      -- automatically install / update on startup. If set to false nothing
      -- will happen on startup. You can use :MasonToolsInstall or
      -- :MasonToolsUpdate to install tools and check for updates.
      -- Default: true
      run_on_start = false,
      -- set a delay (in ms) before the installation starts. This is only
      -- effective if run_on_start is set to true.
      -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
      -- Default: 0
      start_delay = 3000, -- 3 second delay
    },
    lazy = true,
    event = "VeryLazy",
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
    end,
  },

  -- null-ls custom config.
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local nls_diagnostics = nls.builtins.diagnostics
      local nls_formatting = nls.builtins.formatting
      local diagnostics = {
        -- The linter that needs to be added is loaded here
        nls_diagnostics.golangci_lint.with(require("plugins.extras.lsp.null-ls.diagnostics.golangci_lint")),
        -- nls_diagnostics.buf.with(require("plugins.extras.lsp.null-ls.diagnostics.buf")),
      }
      local formatting = {
        -- The formatter that needs to be added is loaded here
        nls_formatting.goimports.with(require("plugins.extras.lsp.null-ls.formatting.goimports")),
        -- nls_formatting.buf.with(require("plugins.extras.lsp.null-ls.formatting.buf")),
      }
      if type(opts.sources) == "table" then
        opts.sources = vim.list_extend(opts.sources, diagnostics)
        opts.sources = vim.list_extend(opts.sources, formatting)
      end
      opts.debug = true
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local server_opts = {
        -- The LSP server configuration that needs to be configured is loaded here
        gopls = require("plugins.extras.lsp.server.gopls"),
        -- bufls = require("plugins.extras.lsp.server.bufls"),
        -- clangd = require("plugins.extras.lsp.server.clangd"),
      }
      if type(opts.servers) == "table" then
        opts.servers = vim.list_extend(opts.servers, server_opts)
      end
    end,
  },
}
