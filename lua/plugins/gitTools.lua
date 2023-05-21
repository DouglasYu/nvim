
return {
	--
	-- Support git command in vim
	--
	{
		"tpope/vim-fugitive"
	},

	-- {
	-- 	"sindrets/diffview.nvim"
	-- },

	{
		"airblade/vim-gitgutter",
		enable = true,
		config = function ()
			vim.cmd("let g:gitgutter_map_keys = 0")
		end
	}
}
