return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- JavaScript and TypeScript testing
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",

      -- Python testing
      "nvim-neotest/neotest-python",

      -- Go testing
      "nvim-neotest/neotest-go",

      -- Rust testing
      "rouge8/neotest-rust",

      -- Ruby testing
      "olimorris/neotest-rspec",

      -- C/C++ testing
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    keys = {
      { "<leader>tl", function() require("neotest").run.run_last() end,                             desc = "Run Last Test" },
      { "<leader>tL", function() require("neotest").run.run_last({ strategy = "dap" }) end,         desc = "Debug Last Test" },
      { "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", desc = "Run Watch" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                desc = "Run File Tests" },
      { "<leader>ta", function() require("neotest").run.run({ suite = true }) end,                  desc = "Run All Tests" },
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,              desc = "Debug Test" },
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}

      -- JavaScript/TypeScript adapters (Jest and Vitest)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function() return vim.fn.getcwd() end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))

      -- Python adapter
      table.insert(opts.adapters, require("neotest-python")({
        dap = { justMyCode = false },
        args = { "--maxfail=1" },
      }))

      -- Go adapter
      table.insert(opts.adapters, require("neotest-go")({
        experimental = { test_table = true },
        args = { "-cover" },
      }))

      -- Rust adapter
      table.insert(opts.adapters, require("neotest-rust"))

      -- Ruby adapter (RSpec)
      table.insert(opts.adapters, require("neotest-rspec"))

      -- C/C++ adapter (using vim-test as a generic test adapter)
      table.insert(opts.adapters, require("neotest-vim-test")({
        ignore_file_types = { "python", "javascript", "typescript", "go", "lua" },
      }))
    end,
  },
}
