-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Auto save using Vim's built-in features
vim.opt.autowrite = true -- Auto write files when switching buffers
vim.opt.autowriteall = true -- Auto write on more events
vim.opt.updatetime = 2000 -- Save swap file after 2 seconds of inactivity

-- Auto save on focus lost and buffer leave
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  command = "silent! wall", -- Save all buffers
})

-- Treesitter folds - keep them open by default
vim.opt.foldlevel = 99 -- Open all folds by default
vim.opt.foldlevelstart = 99 -- Start with all folds open
