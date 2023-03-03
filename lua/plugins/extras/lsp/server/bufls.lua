local lspconfig = require("lspconfig")
return {
  cmd = { "bufls", "serve" },
  filetypes = { "proto" },
  root_dir = lspconfig.util.root_pattern("buf.work.yaml", ".git"),
}
