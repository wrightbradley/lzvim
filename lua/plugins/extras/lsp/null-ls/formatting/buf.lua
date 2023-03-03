-- https://docs.buf.build/format/usage
return {
  filetypes = { "proto" },
  command = "buf",
  args = { "format", "-w", "$FILENAME" },
}
