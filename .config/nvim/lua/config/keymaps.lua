-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.api.nvim_set_keymap("n", "<leader>dd", "diwi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dc", "diwi", { noremap = true, silent = true })

-- copy current buffer path with file
vim.api.nvim_set_keymap("n", "<leader>cpf", ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true })
-- copy current buffer path
vim.api.nvim_set_keymap("n", "<leader>cpp", ":let @+ = expand('%:h')<CR>", { noremap = true, silent = true })

-- live server
vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end)

vim.api.nvim_create_user_command("OpenConfig", function()
  -- Open nvim-tree
  vim.cmd("NvimTreeToggle")

  -- Open the init.lua file in the main window
  vim.cmd("edit ~/.config/nvim/lua/lazyvim/config/init.lua")
end, {})

vim.api.nvim_create_user_command("OpenPlugin", function()
  -- Open nvim-tree
  vim.cmd("NvimTreeToggle")

  -- Optionally navigate to a specific directory or file
  -- vim.cmd("edit ~/.config/nvim/plugins/") -- Uncomment if needed
end, {})

-- Run Program
vim.api.nvim_set_keymap(
  "n",
  "<leader>z",
  ':lua require("run_program.run_program").run_program()<CR>',
  { noremap = true, silent = true }
)

-- Maven Binding
vim.api.nvim_set_keymap(
  "n",
  "<leader>mc",
  ":lua require('run_program.maven_run').run('clean install')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mt",
  ":lua require('run_program.maven_run').run('test')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mr",
  ":lua require('run_program.maven_run').run('compile exec:java')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>md",
  ":lua require('run_program.maven_run').run('dependency:resolve')<CR>",
  { noremap = true, silent = true }
)
-- Toggle bottom terminal
vim.api.nvim_set_keymap(
  "n",
  "<leader>tt",
  ":lua require('run_program.maven_run').toggle_terminal()<CR>",
  { noremap = true, silent = true }
)

-- Split Buffer configuration
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
vim.api.nvim_set_keymap("n", "<leader>sx", ":close<CR>", { desc = "Close split" })
vim.api.nvim_set_keymap("n", "<leader>so", ":only<CR>", { desc = "Close other splits" })
