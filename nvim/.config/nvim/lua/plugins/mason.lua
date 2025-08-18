-- Mason configuration for portable dotfiles
-- This makes Mason install tools inside your dotfiles instead of ~/.local/share
return {
  -- Mason configuration with custom install directory
  {
    "williamboman/mason.nvim",
    opts = {
      -- Install Mason packages under your config dir (dotfiles-friendly)
      install_root_dir = vim.fn.stdpath("config") .. "/mason",
      -- Ensure Mason's bin directory is in PATH
      PATH = "append",
    },
  },
  
  -- Mason LSP config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  
  -- Mason tool installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- Automatically install tools when starting nvim
      auto_update = false, -- Set to false to avoid conflicts
      run_on_start = true,
      start_delay = 3000, -- 3 seconds delay
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "typescript-language-server", 
        "python-lsp-server",
        "json-lsp",
        "yaml-language-server",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        
        -- Formatters
        "prettier",
        "stylua",
        "black",
        "isort",
        "shfmt",
        
        -- Linters
        "eslint_d",
        "flake8",
        "shellcheck",
        "markdownlint",
      },
    },
  },
}
