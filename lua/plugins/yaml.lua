return {
  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        yamlls = {
          -- -- lazy-load schemastore when needed
          -- on_new_config = function(new_config)
          --   new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          --   vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          -- end,
          settings = {
            yaml = {
              schemastore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              schemas = {
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                -- kubernetes = "*.yaml",
              },
              hover = true,
              completion = true,
              validate = true,
            },
          },
        },
      },
    },
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup({
        -- Add any options here, or leave empty to use the default settings
        -- Additional schemas available in Telescope picker
        schemas = {
          {
            name = "Kubernetes 1.25.9",
            uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.25.9-standalone-strict/all.json",
          },
        },
      })
      require("lspconfig")["yamlls"].setup(cfg)
    end,
  },
}
