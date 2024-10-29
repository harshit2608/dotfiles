return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 10,                -- Terminal height when opened horizontally
      open_mapping = [[<F7>]],  -- Key to toggle the terminal
      shading_factor = 2,       -- Terminal shading level
      direction = "horizontal", -- Open terminal at the bottom
      float_opts = {
        border = "curved",
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end,
}
