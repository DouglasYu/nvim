return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "storm",
			transparent = false
		},
		config = function ()
			vim.g.tokyonight_style = 'night'
			vim.g.tokyonight_italic_comments = false
			-- vim.cmd [[colorscheme tokyonight]]
			-- require("tokyonight").load()
			vim.cmd.colorscheme("tokyonight")
		end
	},

	{
		"catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
	}
}
