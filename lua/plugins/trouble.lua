return {
  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      { '<leader>dd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Trouble: [D]ocument [D]iagnostics' },
      { '<leader>wd', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Trouble: [W]orkspace [D]iagnostics' },
      { '<leader>L', '<cmd>TroubleToggle loclist<cr>', desc = 'Trouble: [L]ocation List' },
      { '<leader>q', '<cmd>TroubleToggle quickfix<cr>', desc = 'Trouble: [Q]uickfix List' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Trouble: Previous [Q]uickfix',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Trouble: Next [Q]uickfix',
      },
    },
  },
}
