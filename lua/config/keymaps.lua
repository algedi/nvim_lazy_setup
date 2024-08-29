-- Keymaps are automatically loaded on the VeryLazy event
-- Defaualt keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- SPOSTA E COPIA E INCOLLA ///<
--
-- Sposta
map("n", "<A-Up>", ":m-2<CR>", { desc = "KUI - Sposta riga sopra" })
map("n", "<A-Up>", ":m-2<CR>", { desc = "KUI - Sposta riga sopra" })
map("n", "<A-Down>", ":m+<CR>", { desc = "KUI - Sposta riga sotto" })
map("n", "<A-Right>", "$", { desc = "KUI - Muove il cursore alla fine della riga" })
map("n", "<A-Left>", "0", { desc = "KUI - Muove il cursore all'inizio della riga" })
map("v", "<A-Up>", ":m-2<CR>gv", { desc = "KUI - Sposta la selezione sopra" })
map("v", "<A-Down>", ":m '>+1<CR>gv", { desc = "KUI - Sposta la selezione sotto" })
map("i", "<A-Up>", "<ESC>:m-2<CR>a", { desc = "KUI - Sposta riga sopra" })
map("i", "<A-Down>", "<ESC>:m+<CR>a", { desc = "KUI - Sposta riga sotto" })
map("i", "<A-Right>", "<ESC>$a", { desc = "KUI - Muove il cursore alla fine della riga" })
map("i", "<A-Left>", "<ESC>0i", { desc = "KUI - Muove il cursore all'inizio della riga" })

-- Copia
map("n", "<A-S-Down>", "yyPj", { desc = "KUI - Copia la riga sotto" })
map("v", "<A-S-Down>", "ygPgv", { desc = "KUI - Copia la selezione sotto" })
map("i", "<S-A-Down>", "<ESC>yyPji", { desc = "KUI - Copia riga superio sotto" })

-- Incolla
map("n", "<C-P>", "<cmd>Telescope neoclip<CR>", { desc = "KUI - Elenco clipboad ('C-p' per incollare)" })
map("v", "<C-P>", "<cmd>Telescope neoclip<CR>", { desc = "KUI - Elenco clipboad ('C-p' per incollare)" })
map("i", "<A-p>", "<ESC>pai", { desc = "KUI - Incolla senza uscire dall'insert mode" })

--///>
-- CAMBIO SHORTCUT ///<
-- map("n", "<S-C-Down>", "<cmd>DecrementTerminal()<CR>", { noremap = true, silent = true })
-- map("n", "<S-C-Up>", "<cmd>IncrementTerminal()<CR>", { noremap = true, silent = true })

--///>
-- COMMENTI ///<
vim.api.nvim_del_keymap("n", "<C-Up>")   -- cancella la scorciatoia di default
vim.api.nvim_del_keymap("n", "<C-Down>") -- cancella la scorciatoia di default
map("n", "<F2>", function()
  vim.cmd("normal gcc")
  vim.cmd("normal j")
end, { desc = "KUI - Inverte il commento e passa alla riga successiva", noremap = true, silent = true })
map("n", "<C-Down>", function()
  vim.cmd("normal gcc")
  vim.cmd("normal j")
end, { desc = "KUI - Inverte il commento e passa alla riga successiva", noremap = true, silent = true })
map("n", "<C-Up>", function()
  vim.cmd("normal gcc")
  vim.cmd("normal k")
end, { desc = "KUI - Inverte il commento e passa alla riga precedente", noremap = true, silent = true })
map(
  "v",
  "<C-Down>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "KUI - Inverte il commento della selezione" }
)
map(
  "v",
  "<C-Up>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "KUI - Inverte il commento della selezione" }
)
map(
  "v",
  "<F2>",
  "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
  { desc = "LUI - Inverte il commento (blocco)" }
)
--///>
-- INDENTAZIONE ///<
map("n", "<C-Right>", ">>", { desc = "KUI - Aumenta l'indetazione" })
map("n", "<C-Left>", "<<", { desc = "KUI - Diminuisce l'indetazione" })
-- map("n", "<Tab>", ">>", { desc = "KUI - Aumenta l'indetazione" })
-- map("n", "<S-Tab>", "<<", { desc = "KUI - Diminuisce l'indetazione" })
map("v", "<C-Right>", ">gv", { desc = "KUI - Aumenta l'indetazione" })
map("v", "<C-Left>", "<gv", { desc = "KUI - Diminuisce l'indetazione" })
-- map("v", "<Tab>", ">gv", { desc = "KUI - Aumenta l'indetazione" })
-- map("v", "<S-Tab>", "<gv", { desc = "KUI - Diminuisce l'indetazione" })
--///>
-- BUFFER ///<
map("n", "<S-b>", "<S-l>", { desc = "KUI - Prossimo buffer (tab)", remap = true })
map("n", "b", "<cmd>WhichKey b<CR>", { noremap = true, silent = true })
local wk = require("which-key")
wk.add({
  {
    { "b",  group = "buffer" }, -- group
    { "bn", "<cmd>bnext<CR>",             desc = "KUI - Prossimo Buffer",           mode = "n" },
    { "bb", "<cmd>bnext<CR>",             desc = "KUI - Prossimo Buffer",           mode = "n" },
    { "bp", "<cmd>bprevious<CR>",         desc = "KUI - Precedente Buffer",         mode = "n" },
    { "bd", "<cmd>bd<CR>",                desc = "KUI - Cancella Buffer",           mode = "n" },
    { "bt", "<cmd>Telescope buffers<CR>", desc = "KUI - Elenco Buffer (telescope)", mode = "n" },
  },
})
--///>
-- NEOTREE ///<
map("n", "<F3>", "<cmd>Neotree toggle <CR>", { desc = "KUI - Mostra/nasconde NvidTree" })
--///>
-- MULTI CURSOR ///<
map("n", "<C-n>", "<cmd>MCstart<CR>", { desc = "KUI - Attiva il multicursor" })
map("v", "<C-n>", "<cmd>MCstart<CR>", { desc = "KUI - Attiva il multicursor" })
-- ///>
