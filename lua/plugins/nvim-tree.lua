-- a file explorer tree for neovim, written in Lua : https://github.com/nvim-tree/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Remove background color from the NvimTree window (ui fix)
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
      },
      view = {
        adaptive_size = true,
      },
    }
  end,
}
