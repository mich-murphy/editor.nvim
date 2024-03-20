return {
  { --symbols outline in neovim
    "hedyhli/outline.nvim",
    keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "[C]ode [S]ymbols" } },
    cmd = "Outline",
    opts = function()
      local icons = {
        Array         = " ",
        Boolean       = "󰨙 ",
        Class         = " ",
        Codeium       = "󰘦 ",
        Color         = " ",
        Control       = " ",
        Collapsed     = " ",
        Constant      = "󰏿 ",
        Constructor   = " ",
        Copilot       = " ",
        Enum          = " ",
        EnumMember    = " ",
        Event         = " ",
        Field         = " ",
        File          = " ",
        Folder        = " ",
        Function      = "󰊕 ",
        Interface     = " ",
        Key           = " ",
        Keyword       = " ",
        Method        = "󰊕 ",
        Module        = " ",
        Namespace     = "󰦮 ",
        Null          = " ",
        Number        = "󰎠 ",
        Object        = " ",
        Operator      = " ",
        Package       = " ",
        Property      = " ",
        Reference     = " ",
        Snippet       = " ",
        String        = " ",
        Struct        = "󰆼 ",
        TabNine       = "󰏚 ",
        Text          = " ",
        TypeParameter = " ",
        Unit          = " ",
        Value         = " ",
        Variable      = "󰀫 ",
      }
      local kind_filter = {
        default = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Package",
          "Property",
          "Struct",
          "Trait",
        },
        markdown = false,
        help = false,
        -- you can specify a different filter for each filetype
        lua = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          -- "Package", -- remove package since luals uses it for control flow structures
          "Property",
          "Struct",
          "Trait",
        },
      }
      local defaults = require("outline.config").defaults
      local opts = {
        symbols = {},
        symbol_blacklist = {},
      }
      local filter = kind_filter

      if type(filter) == "table" then
        filter = filter.default
        if type(filter) == "table" then
          for kind, symbol in pairs(defaults.symbols) do
            opts.symbols[kind] = {
              icon = icons[kind] or symbol.icon,
              hl = symbol.hl,
            }
            if not vim.tbl_contains(filter, kind) then
              table.insert(opts.symbol_blacklist, kind)
            end
          end
        end
      end
      return opts
    end,
  }
}
