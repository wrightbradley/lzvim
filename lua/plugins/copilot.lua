if true then
  return {}
end
return {

  --- **************************************
  --- This plugin is based on vimscript and not Lua. It is not under active development.
  --  This is just here for reference.
  --- **************************************
  -- https://www.reddit.com/r/neovim/comments/sk70rk/using_github_copilot_in_neovim_tab_map_has_been/
  -- {
  --   "github/copilot.vim",
  --   config = function()
  --     vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_tab_fallback = ""
  --     -- vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  --     local function SuggestOneCharacter()
  --       local suggestion = vim.fn["copilot#Accept"]("")
  --       local bar = vim.fn["copilot#TextQueuedForInsertion"]()
  --       return bar:sub(1, 1)
  --     end
  --     local function SuggestOneWord()
  --       local suggestion = vim.fn["copilot#Accept"]("")
  --       local bar = vim.fn["copilot#TextQueuedForInsertion"]()
  --       return vim.fn.split(bar, [[[ .]\zs]])[1]
  --     end
  --     local function SuggestFull()
  --       local suggestion = vim.fn["copilot#Accept"]("")
  --       local bar = vim.fn["copilot#TextQueuedForInsertion"]()
  --       return bar
  --     end
  --
  --     local map = vim.keymap.set
  --     map("i", "<C-j>", SuggestFull, { expr = true, remap = false })
  --     map("i", "<C-l>", SuggestOneCharacter, { expr = true, remap = false })
  --     map("i", "<C-left>", SuggestOneWord, { expr = true, remap = false })
  -- Other Maps
  -- *copilot-i_CTRL-]*
  -- <C-]>                   Dismiss the current suggestion.
  -- <Plug>(copilot-dismiss)
  -- *copilot-i_ALT-]*
  -- <M-]>                   Cycle to the next suggestion, if one is available.
  -- <Plug>(copilot-next)
  -- *copilot-i_ALT-[*
  -- <M-[>                   Cycle to the previous suggestion.
  -- <Plug>(copilot-previous)
  -- *copilot-i_ALT-\*
  -- <M-\>                   Explicitly request a suggestion, even if Copilot
  -- <Plug>(copilot-suggest) is disabled.
  --   end,
  -- },

  --- **************************************
  --- These plugins have valid configuration.
  --  These plugins work and operate correctly.
  --  They are commented out for now in order to test
  --  the configuration as defined from the LazyVim project.
  --- **************************************
  --   {
  --     "zbirenbaum/copilot.lua",
  --     cmd = "Copilot",
  --     event = "InsertEnter",
  --     config = function()
  --       require("copilot").setup({
  --         suggestion = { enabled = false },
  --         panel = { enabled = false },
  --       })
  --     end,
  --   },
  --   {
  --     "zbirenbaum/copilot-cmp",
  --     dependencies = { "copilot.lua" },
  --     config = function()
  --       require("copilot_cmp").setup({
  --         -- clear_after_cursor = true,
  --         formatters = {
  --           insert_text = require("copilot_cmp.format").remove_existing,
  --         },
  --       })
  --     end,
  --   },
  --   {
  --     "hrsh7th/nvim-cmp",
  --     ---@param opts cmp.ConfigSchema
  --     opts = function(_, opts)
  --       local cmp = require("cmp")
  --       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot", group_index = 2 } }))
  --       opts.mapping = cmp.mapping.preset.insert({
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<CR>"] = cmp.mapping.confirm({
  --           -- select = true,
  --           select = false,
  --           behavior = cmp.ConfirmBehavior.Replace,
  --         }),
  --       })
  --     end,
  --   },

  --- **************************************
  --- These plugins and config are from the docs
  --  of the LazyVim project. I am currently testing this out.
  --- **************************************
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local Util = require("lazyvim.util")
      local colors = {
        [""] = Util.fg("Special"),
        ["Normal"] = Util.fg("Special"),
        ["Warning"] = Util.fg("DiagnosticError"),
        ["InProgress"] = Util.fg("DiagnosticWarn"),
      }
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local icon = require("lazyvim.config").icons.kinds.Copilot
          local status = require("copilot.api").status.data
          return icon .. (status.message or "")
        end,
        cond = function()
          local clients = vim.lsp.get_active_clients({ name = "copilot", bufnr = 0 })
          return #clients > 0
        end,
        color = function()
          local status = require("copilot.api").status.data
          return colors[status.status] or colors[""]
        end,
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require("lazyvim.util").on_attach(function(client)
        if client.name == "copilot" then
          copilot_cmp._on_insert_enter()
        end
      end)
    end,
  },
}
