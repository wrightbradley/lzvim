return {
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        -- you can pin a tool to a particular version
        -- { 'golangci-lint', version = 'v1.47.0' },
        -- you can turn off/on auto_update per tool
        -- { 'bash-language-server', auto_update = true },
        ---------- LSP ----------
        "ansible-language-server",
        "awk-language-server",
        "bash-language-server",
        "diagnostic-languageserver",
        "dockerfile-language-server",
        "eslint-lsp",
        "golangci-lint-langserver",
        "gopls",
        "helm-ls",
        "jq-lsp",
        "json-lsp",
        "jsonnet-language-server",
        "lua-language-server",
        "marksman",
        -- "nixd",
        "python-lsp-server",
        -- "rnix",
        "ruff-lsp",
        "sqlls",
        -- "statix",
        "tailwindcss-language-server",
        "terraform-ls",
        "tflint",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
        -- "pyright",
        ---------- Formatter ----------
        "autoflake",
        "black",
        "jq",
        "luaformatter",
        "shfmt",
        "usort",
        "stylua",
        "yamlfmt",
        -- "autopep8",
        -- "fixjson",
        -- "gofumpt",
        -- "goimports",
        -- "goimports-reviser",
        -- "golines",
        -- "isort",
        -- "prettier",
        -- "prettierd",
        -- "reorder-python-imports",
        -- "sql-formatter",
        -- "sqlfmt",
        -- "yamlfix",
        -- "yapf",
        ---------- Linter ----------
        "ansible-lint",
        "flake8",
        "hadolint",
        "jsonlint",
        "luacheck",
        "pyflakes",
        "ruff",
        "shellcheck",
        "shellharden",
        "tfsec",
        "trufflehog",
        "yamllint",
        -- "codespell",
        -- "commitlint",
        -- "editorconfig-checker",
        -- "gitlint",
        -- "golangci-lint",
        -- "markdownlint",
        -- "pyproject-flake8",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
