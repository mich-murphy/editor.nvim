return {
  { -- Add/delete/replace surroundings (brackets, quotes, etc.)
    'echasnovski/mini.surround',
    opts = {},
  },

  { -- Pair opening bracket etc. with closing
    'echasnovski/mini.pairs',
    opts = {},
  },

  { -- Highlight indented scope at cursor
    'echasnovski/mini.indentscope',
    version = false,
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  { -- Comments
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },

  { -- Better Around/Inside textobjects
    'echasnovski/mini.ai',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'folke/which-key.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      local spec_treesitter = require('mini.ai').gen_spec.treesitter
      require('mini.ai').setup {
        n_lines = 1000,
        custom_textobjects = {
          a = spec_treesitter {
            a = '@parameter.outer',
            i = '@parameter.inner',
          },
          f = spec_treesitter {
            a = '@function.outer',
            i = '@function.inner',
          },
          o = spec_treesitter {
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
          },
          c = spec_treesitter {
            a = { '@class.outer' },
            i = { '@class.inner' },
          },
        },
      }
      wk.register({
        ['aa'] = [[Around argument]],
        ['ia'] = [[Inside argument]],
        ['af'] = [[Around function]],
        ['if'] = [[Inside function]],
        ['ao'] = [[Around condition/loop]],
        ['io'] = [[Inside condition/loop]],
        ['ac'] = [[Around class]],
        ['ic'] = [[Inside class]],
      }, { mode = 'o', prefix = '', preset = true })
    end,
  },

  { --Delete buffers
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "[B]uffer [D]elete",
      },
      -- stylua: ignore
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "[B]uffer [D]elete (Force)" },
    },
  }
}
-- vim: ts=2 sts=2 sw=2 et
