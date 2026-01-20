-- lua-based fzf wrapper and integration : https://github.com/ibhagwan/fzf-lua

return {
  "ibhagwan/fzf-lua",
  lazy = false,
  dependencies = { 'nvim-mini/mini.nvim', version = '*' },
  keys = {
    {
      "<leader>ff",
      function() require("fzf-lua").files() end,
      desc = "[F]ind files",
    },
    {
      "<leader>fg",
      function() require("fzf-lua").live_grep_native() end,
      desc = "Live [G]rep",
    },
    {
      "<leader><leader>",
      function() require("fzf-lua").buffers() end,
      desc = "Buffers",
    },
    {
      "<leader>fh",
      function() require("fzf-lua").help_tags() end,
      desc = "[H]elp tags",
    },
    {
      "<leader>fx",
      function() require("fzf-lua").diagnostics_document() end,
      desc = "Diagnostics Document",
    },
    {
      "<leader>fX",
      function() require("fzf-lua").diagnostics_workspace() end,
      desc = "Diagnostics Workspace",
    },
    {
      "<leader>fs",
      function() require("fzf-lua").lsp_document_symbols() end,
      desc = "Document [S]ymbols",
    },
    {
      "<leader>fS",
      function() require("fzf-lua").lsp_workspace_symbols() end,
      desc = "Workspace [S]ymbols",
    },
    {
      "<leader>fk",
      function() require("fzf-lua").keymaps() end,
      desc = "[K]eymaps",
    },
    {
      "<leader>fb",
      function() require("fzf-lua").builtin() end,
      desc = "[B]uiltin FZF",
    },
    {
      "<leader>fr",
      function() require("fzf-lua").resume() end,
      desc = "[R]esume",
    },
    {
      "<leader>fo",
      function() require("fzf-lua").oldfiles() end,
      desc = "[O]ld Files",
    },
  },
  opts = {},
}
