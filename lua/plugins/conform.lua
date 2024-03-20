return {
  { -- Autoformat
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          }
        end,
        desc = '[C]ode [F]ormat',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_fmt' },
        nix = { 'alejandra' },
        sql = { 'sqlfmt' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        html = { 'prettier' },
        less = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        graphql = { 'prettier' },
        handlebars = { 'prettier' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
