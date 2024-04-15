vim.uv = vim.uv or vim.loop

local M = {}

---@param opts? LazyVimConfig
function M.setup(opts)
  require("wrightbradley.config").setup(opts)
end

return M
