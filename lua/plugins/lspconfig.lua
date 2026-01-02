-- lsp config for neovim : https://github.com/neovim/nvim-lspconfig

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "creativenull/efmls-configs-nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("utils.diagnostics").setup()
    require("servers")
  end,
}
