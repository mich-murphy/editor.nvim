return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    config = function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.keymap.set('n', '<leader>ca', function()
        vim.cmd.RustLsp 'codeAction'
      end, { desc = '[C]ode [A]ction', buffer = bufnr })
      vim.keymap.set('n', '<leader>cd', function()
        vim.cmd.RustLsp 'debuggables'
      end, { desc = 'Rust [D]ebuggables', buffer = bufnr })
    end,
  },
}
