return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      -- Core modules
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },

      ensure_installed = {
        "angular", "bash", "c", "cmake", "cpp", "css", "cuda", "dart", "dockerfile",
        "gitignore", "glsl", "go", "gomod", "gosum", "graphql", "helm", "html",
        "java", "javascript", "json", "latex", "lua", "make", "markdown", "markdown_inline",
        "proto", "python", "query", "ruby", "rust", "scss", "sql", "toml",
        "tsx", "typescript", "vim", "vimdoc", "xml", "yaml"
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },

      rainbow = {
        enable = true,
        disable = { "html" },  -- disable in HTML files
        extended_mode = false, -- only match parentheses
        max_file_lines = nil,  -- no file size limit
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
