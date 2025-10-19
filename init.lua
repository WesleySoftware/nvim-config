-- leader? I barely know her
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- https://github.com/neovim/neovim/issues/31675
vim.hl = vim.highlight

-- keymaps for debugging neovim config stuff
vim.keymap.set("n", "<leader>ns", "<cmd>source %<CR>") -- neovim source this file
vim.keymap.set("n", "<leader>nx", ":.lua<CR>")         -- neovim execute this line
vim.keymap.set("v", "<leader>nx", ":.lua<CR>")         -- neovim execute this line (visual edition)


if vim.g.vscode then -- VSCode extension
  local vscode = require('vscode')
else                 -- ordinary neovim
  -- opts
  vim.opt.shiftwidth = 4
  vim.opt.autochdir = true


  -- Highlight when yanking text
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
  require("config.lazy")
end

print("Finished Loading Configuration")
