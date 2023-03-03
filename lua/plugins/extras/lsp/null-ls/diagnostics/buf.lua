-- https://docs.buf.build/lint/usage
return {
  filetypes = { "proto" },
  command = "buf",
  args = {
    "lint",
    "--config",
    vim.fn.expand(vim.fn.stdpath("config") .. "/configs/linter/buf.yaml"),
    "--error-format=json",
    "--path",
    "$DIRNAME",
  },
}
