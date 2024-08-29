-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Chiudere tutti i fold all'apertura di un buffer
local function close_all_folds()
  vim.cmd("normal zM") -- Chiude tutti i fold nel buffer attuale
end

-- Definizione di un autocmando per chiudere tutti i fold quando un buffer è aperto
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = close_all_folds,
})
