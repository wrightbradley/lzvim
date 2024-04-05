local opt = vim.opt

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.statuscolumn = [[%!v:lua.require'wrightbradley.util'.ui.statuscolumn()]]
  opt.foldtext = "v:lua.require'util'.ui.foldtext()"
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.require'wrightbradley.util'.ui.foldexpr()"
  opt.foldtext = ""
  opt.fillchars = "fold: "
else
  opt.foldmethod = "indent"
end

opt.formatexpr = "v:lua.require'wrightbradley.util'.format.formatexpr()"
