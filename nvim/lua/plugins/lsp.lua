return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local protocol = require("vim.lsp.protocol")

    -- Format on save
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    -- Enhanced capabilities for autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure LSPs using mason setup handlers
    mason_lspconfig.setup_handlers({
      function(server)
        nvim_lsp[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,

      -- Language-specific configurations
      ["tsls"] = function()
        nvim_lsp.tsserver.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["cssls"] = function()
        nvim_lsp.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["tailwindcss"] = function()
        nvim_lsp.tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["html"] = function()
        nvim_lsp.html.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["jsonls"] = function()
        nvim_lsp.jsonls.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["eslint"] = function()
        nvim_lsp.eslint.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["pyright"] = function()
        nvim_lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["gopls"] = function()
        nvim_lsp.gopls.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["clangd"] = function() -- C and C++
        nvim_lsp.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["rust_analyzer"] = function()
        nvim_lsp.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
      ["omnisharp"] = function() -- C#
        nvim_lsp.omnisharp.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        })
      end,
      ["glslls"] = function() -- GLSL shader language
        nvim_lsp.glsl.setup({ on_attach = on_attach, capabilities = capabilities })
      end,
    })
  end,
}
