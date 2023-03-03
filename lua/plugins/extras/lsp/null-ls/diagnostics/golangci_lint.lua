return {
  filetypes = { "go" },
  command = "golangci-lint",
  args = {
    "run",
    "-c",
    vim.fn.expand(vim.fn.stdpath("config") .. "/configs/linter/golangci.yaml"),
    "--fix=false",
    "--fast",
    "--out-format=json",
    "$DIRNAME",
    "--path-prefix",
    "$ROOT",
  },
}
