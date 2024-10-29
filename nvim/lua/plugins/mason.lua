return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    -- LSP server setup with automatic installation
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "ts_ls",
        "pyright",
        "tailwindcss",
        "gopls",
        "clangd",
        "rust_analyzer",
        "glslls",
        "wgsl_analyzer",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        "gofumpt",
        "goimports",
        "shfmt",
        "clang-format",
      },
    })
  end,
}
