-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Syntax for Helm templates (Go templates inside YAML)
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
--   group = augroup,
--   pattern = "*/templates/*.yaml,*/templates/*.tpl,helmfile*.yaml,*/templates/*/*.yaml",
--   callback = function()
--     vim.bo.filetype = "helm"
--     -- vim.api.nvim_buf_del_var(0, "current_syntax")
--     -- vim.cmd([[syn include @yamlGoTextTmpl syntax/gotexttmpl.vim]])
--     -- vim.api.nvim_buf_set_var(0, "current_syntax", "yaml")
--     -- vim.cmd([[
--     --   syn region goTextTmpl start=/{{/ end=/}}/ contains=@gotplLiteral,gotplControl,gotplFunctions,gotplVariable,goTplIdentifier containedin=ALLBUT,goTextTmpl keepend
--     --   hi def link goTextTmpl PreProc
--     -- ]])
--   end,
-- })

-- local function augroup(name)
--   return vim.api.nvim_create_augroup("helm_syntax" .. name, { clear = true })
-- end
--
-- -- set helm filetype
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
--   group = augroup("helm filetype"),
--   pattern = "*/templates/*.yaml,*/templates/*.tpl,helmfile*.yaml,*/templates/*/*.yaml",
--   callback = function()
--     vim.bo.filetype = "helm"
--     vim.bo.commentstring = "{{/* %s */}}"
--     vim.cmd("LspStop yamlls")
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 1
  end,
})
