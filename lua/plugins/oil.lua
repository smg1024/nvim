-- file explorer minimal : https://github.com/stevearc/oil.nvim
return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", version = "*", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["q"] = { "actions.close", mode = "n" },
			},
		})
	end,
	keys = {
		{
			"<leader>-",
			function()
				vim.cmd("Oil --float")
			end,
			{ desc = "Open current directory" },
		},
	},
}
