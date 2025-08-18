-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Mason auto-setup for portable dotfiles
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("mason_auto_install", { clear = true }),
  callback = function()
    -- Ensure Mason directory exists in config
    local mason_dir = vim.fn.stdpath("config") .. "/mason"
    if vim.fn.isdirectory(mason_dir) == 0 then
      vim.fn.mkdir(mason_dir, "p")
    end
    
    -- Auto-install tools if they don't exist
    vim.defer_fn(function()
      if pcall(require, "mason-tool-installer") then
        vim.cmd("MasonToolsInstall")
      end
    end, 2000)
  end,
})
