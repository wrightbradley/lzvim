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
                },
                flake8 = {
                  maxLineLength = 119,
                },
              },
            },
          },
        },
      },
    },
  },
}
