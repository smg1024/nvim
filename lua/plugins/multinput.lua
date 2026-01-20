return {
	"r0nsha/multinput.nvim",
	opts = {
		opts = {
			numbers = "never",
		},
		-- How much padding will be added to the end of the buffer
		padding = 5,
		-- Controls the width limits of the buffer
		width = { min = 20, max = 60 },
		-- Controls the height limits of the buffer
		height = { min = 1, max = 6 },
		win = {
			title = "Input: ",
			style = "minimal",
			focusable = true,
			relative = "cursor",
			col = -1,
			width = 1,
			height = 1,
		},
	},
}
