  return {
    "b0o/SchemaStore.nvim",
    config = function()
      require('lspconfig').jsonls.setup({
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      require('lspconfig').yamlls.setup({
        settings = {
          yaml = {
            schemaStore = {
              -- Disable built-in schemaStore support to use SchemaStore.nvim
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      })
    end
  }
