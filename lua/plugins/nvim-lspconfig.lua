return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false },
                pycodestyle = {
                  maxLineLength = 119,
                  enabled = false,
                },
                flake8 = {
                  maxLineLength = 119,
                  enabled = false,
                },
                ruff = {
                  enabled = true, -- Enable the plugin
                  -- executable = "<path-to-ruff-bin>",  -- Custom path to ruff
                  -- config = "<path_to_custom_ruff_toml>",  -- Custom config for ruff to use
                  extendSelect = { "I" }, -- Rules that are additionally used by ruff
                  extendIgnore = { "C90" }, -- Rules that are additionally ignored by ruff
                  format = { "I" }, -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                  severities = { ["D212"] = "I" }, -- Optional table of rules where a custom severity is desired
                  unsafeFixes = false, -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action
                  -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                  lineLength = 119, -- Line length to pass to ruff checking and formatting
                  exclude = { "__about__.py" }, -- Files to be excluded by ruff checking
                  select = { "F" }, -- Rules to be enabled by ruff
                  ignore = { "D210" }, -- Rules to be ignored by ruff
                  perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
                  preview = true, -- Whether to enable the preview style linting and formatting.
                  targetVersion = "py312", -- The minimum python version to target (applies for both linting and formatting).
                },
              },
            },
          },
        },
      },
    },
  },
}
