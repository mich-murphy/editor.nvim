-- [[ Configure and install plugins ]]
require('lazy').setup({
  spec = {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    { import = 'plugins' }, -- For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
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
