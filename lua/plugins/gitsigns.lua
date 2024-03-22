-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map('n', ']h', gs.next_hunk, 'Next [H]unk')
        map('n', '[h', gs.prev_hunk, 'Prev [H]unk')
        map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', '[G]it [H]unk [S]tage')
        map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', '[G]it [H]unk [R]eset')
        map('n', '<leader>ghb', gs.stage_buffer, '[G]it [H]unk [S]tage Buffer')
        map('n', '<leader>ghu', gs.undo_stage_hunk, '[G]it [H]unk [U]ndo Stage')
        map('n', '<leader>ghR', gs.reset_buffer, '[G]it [H]unk [R]eset Buffer')
        map('n', '<leader>ghp', gs.preview_hunk_inline, '[G]it [H]unk [P]review Inline')
        map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, '[G]it [H]unk [B]lame Line')
        map('n', '<leader>ghd', gs.diffthis, '[G]it [H]unk [D]iff This')
        map('n', '<leader>ghD', function() gs.diffthis("~") end, '[G]it [H]unk [D]iff This ~')
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select [I]n [H]unk')
      end,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
