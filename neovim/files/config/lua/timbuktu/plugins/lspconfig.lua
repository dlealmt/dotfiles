  return {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lsp.ansiblels.setup({ capabilities = capabilities })
      lsp.bashls.setup({ capabilities = capabilities })
      lsp.clangd.setup({ capabilities = capabilities })
      lsp.clojure_lsp.setup({ capabilities = capabilities })
      lsp.cssls.setup({ capabilities = capabilities })
      lsp.emmet_language_server.setup({ capabilities = capabilities })
      lsp.eslint.setup({ capabilities = capabilities })

      lsp.gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup('OnGo', {}),
        pattern = "*.go",
        callback = function()
          local params = vim.lsp.util.make_range_params()

          params.context = {only = {"source.organizeImports"}}

          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)

          for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
              end
            end
          end

          vim.lsp.buf.format({async = false})
        end
      })

      lsp.html.setup({
        capabilities = capabilities,
        filetypes = { "eruby", "html" },
      })

      lsp.jsonls.setup({ capabilities = capabilities })

      lsp.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })

      lsp.marksman.setup({ capabilities = capabilities })
      lsp.solargraph.setup({ capabilities = capabilities })
      lsp.tailwindcss.setup({ capabilities = capabilities })
      lsp.tsserver.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          require("which-key").register({
            ["<leader>"] = {
              c = {
                name = "Code...",
                a = { "<cmd>Telescope lsp_code_actions", "Action", mode = { "n", "v" } },
                d = { function() vim.diagnostic.open_float() end, "Diagnostics in line" },
                f = {
                  function() vim.lsp.buf.format({ async = true }) end,
                  "Format",
                  mode = { "n", "v" }
                },
                r = { function() vim.lsp.buf.rename() end, "Rename" },
              },
              j = {
                s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
              },
            },
            K = { function() vim.lsp.buf.hover() end, "Hover" },
            ["["] = {
              e = { function() vim.diagnostic.goto_prev() end, "diagnostic" },
            },
            ["]"] = {
              e = { function() vim.diagnostic.goto_next() end, "diagnostic" },
            },
            g = {
              d = { function() vim.lsp.buf.definition() end, "Definition" },
              r = { function() vim.lsp.buf.references() end, "References" },
            },
          }, { buffer = ev.buf })
        end,
      })
    end,
  }
