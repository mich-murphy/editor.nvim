-- [[ Configure and install plugins ]]
require('lazy').setup({
  spec = {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    { 'LnL7/vim-nix', ft = 'nix' }, -- Nix indenting and highlighting
    -- { import = 'plugins' }, -- For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
    require 'plugins/cmp',
    require 'plugins/conform',
    require 'plugins/dashboard',
    -- require 'plugins/debug',
    require 'plugins/gitsigns',
    require 'plugins/headlines',
    require 'plugins/indent_line',
    require 'plugins/kitty',
    require 'plugins/lspconfig',
    require 'plugins/lualine',
    require 'plugins/markdown-preview',
    require 'plugins/mini',
    require 'plugins/telescope',
    require 'plugins/todo-comments',
    require 'plugins/tokyonight',
    require 'plugins/treesitter',
    require 'plugins/trouble',
    require 'plugins/venv-selector',
    require 'plugins/which-key',
  },
  install = { colorscheme = { 'tokyonight-night' } },
  checker = { enabled = true }, -- Automatically check for plugin updates
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
