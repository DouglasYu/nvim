return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = false
		},
		config = function ()
			vim.g.tokyonight_style = 'night'
			vim.g.tokyonight_italic_comments = false
			vim.cmd("let g:lightline = {'colorscheme': 'tokyonight'}")
			vim.cmd.colorscheme("tokyonight")
		end
	},

	{
		"catppuccin/nvim",
		enalbe = false,
    lazy = true,
    name = "catppuccin",
	}
}
