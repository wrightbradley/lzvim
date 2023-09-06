return {
  -- This is what powers fancy-looking
  -- tabs, which include filetype icons and close buttons.
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    -- Fix bufferline offsets when edgy is loaded
    --    opts = function()
    --      local Offset = require("bufferline.offset")
    --      if not Offset.edgy then
    --        local get = Offset.get
    --        Offset.get = function()
    --          if package.loaded.edgy then
    --            local layout = require("edgy.config").layout
    --            local ret = { left = "", left_size = 0, right = "", right_size = 0 }
    --            for _, pos in ipairs({ "left", "right" }) do
    --              local sb = layout[pos]
    --              if sb and #sb.wins > 0 then
    --                local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
    --                ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
    --                ret[pos .. "_size"] = sb.bounds.width
    --              end
    --            end
    --            ret.total_size = ret.left_size + ret.right_size
    --            if ret.total_size > 0 then
    --              return ret
    --            end
    --          end
    --          return get()
    --        end
    --        Offset.edgy = true
    --      end
    --    end,
  },
}
