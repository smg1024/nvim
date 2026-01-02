-- lua-based fzf wrapper and integration : https://github.com/ibhagwan/fzf-lua

return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Fuzzy find files",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Fuzzy live grep",
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Fuzzy select buffers",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "Fuzzy help tags",
    },
    {
      "<leader>fx",
      function()
        require("fzf-lua").diagnostics_document()
      end,
      desc = "Fuzzy diagnostics document",
    },
    {
      "<leader>fX",
      function()
        require("fzf-lua").diagnostics_workspace()
      end,
      desc = "Fuzzy diagnostics workspace",
    },
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "Fuzzy document symbols",
    },
    {
      "<leader>fS",
      function()
        require("fzf-lua").lsp_workspace_symbols()
      end,
      desc = "Fuzzy workspace symbols",
    },
  },
  opts = {},
}
