return {
  { -- Customised statusline
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = ' '
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require 'lualine_require'
      lualine_require.require = require

      local function fg(name)
        ---@type {foreground?:number}?
        ---@diagnostic disable-next-line: deprecated
        local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name, link = false }) or vim.api.nvim_get_hl_by_name(name, true)
        ---@diagnostic disable-next-line: undefined-field
        local fgrnd = hl and (hl.fg or hl.foreground)
        return fgrnd and { fg = string.format('#%06x', fgrnd) } or nil
      end

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = 'auto',
          section_separators = '',
          component_separators = '',
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },

          lualine_c = {
            {
              'diagnostics',
              symbols = {
                error = ' ',
                warn = ' ',
                hint = ' ',
                info = ' ',
              },
            },
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { 'filename', path = 4 },
          },

          lualine_x = {
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = fg("Debug"),
            },
            {
              require('lazy.status').updates,
              cond = require('lazy.status').has_updates,
              color = fg 'Special',
            },
            {
              'diff',
              symbols = {
                added = ' ',
                modified = ' ',
                removed = ' ',
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return '󰸗 ' .. os.date '%Y-%m-%d'
            end,
          },
        },
        extensions = { 'neo-tree', 'lazy' },
      }
    end,
  },
}
