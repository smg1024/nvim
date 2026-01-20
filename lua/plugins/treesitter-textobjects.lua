-- syntax aware text-objects, select, move, swap, and peek support : https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    -- put your config here
    -- configuration
    require("nvim-treesitter-textobjects").setup {
      select = {
	-- automatically jump forward to textobj, similar to targets.vim
	lookahead = true,
	-- you can choose the select mode (default is charwise 'v')
	--
	-- can also be a function which gets passed a table with the keys
	-- * query_string: eg '@function.inner'
	-- * method: eg 'v' or 'o'
	-- and should return the mode ('v', 'v', or '<c-v>') or a table
	-- mapping query_strings to modes.
	selection_modes = {
	  ['@parameter.outer'] = 'v', -- charwise
	  ['@function.outer'] = 'v', -- linewise
	  ['@class.outer'] = '<c-v>', -- blockwise
	},
	include_surrounding_whitespace = false,
      },
    }
    -- nvim-treesitter textobjects keymaps
    -- you can use the capture groups defined in `textobjects.scm`
    vim.keymap.set({ "x", "o" }, "af", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end, { desc = "Select around function" })

    vim.keymap.set({ "x", "o" }, "if", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end, { desc = "Select inner function" })

    vim.keymap.set({ "x", "o" }, "ac", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end, { desc = "Select around class" })

    vim.keymap.set({ "x", "o" }, "ic", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end, { desc = "Select inner class" })

    vim.keymap.set({ "x", "o" }, "ao", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@comment.outer", "textobjects")
    end, { desc = "Select around comment" })

    vim.keymap.set({ "x", "o" }, "io", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@comment.inner", "textobjects")
    end, { desc = "Select inner comment" })
  end,
}


