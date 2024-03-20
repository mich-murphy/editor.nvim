-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local function augroup(name)
  return vim.api.nvim_create_augroup('user_' .. name, { clear = true })
end

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup 'highlight_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- set Zellij mode
local function zellij(mode)
  if vim.env.ZELLIJ ~= nil then
    vim.fn.system { 'zellij', 'action', 'switch-mode', mode }
  end
end

-- See `:help autocmd-events
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set Zellij to lock when Neovim is open',
  group = augroup 'zellij_lock',
  callback = function()
    zellij 'locked'
  end,
})

vim.api.nvim_create_autocmd('VimLeave', {
  desc = 'Set Zellij to normal when Neovim exits',
  group = augroup 'zellij_normal',
  callback = function()
    zellij 'normal'
  end,
})

-- vim: ts=2 sts=2 sw=2 et
