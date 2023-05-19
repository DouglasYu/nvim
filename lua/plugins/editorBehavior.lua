return {

	--
	-- telescope.nvim
	--
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function() 
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},

  "folke/which-key.nvim", -- Show key mapping when hitting a leader key

  -- "folke/neodev.nvim",    -- Give you LSP support when writing Lua for Vim

	--
	-- autopairs-nvim
	{
		"windwp/nvim-autopairs",
    config = function() 
			require("nvim-autopairs").setup {} 
		end
	},

	--
	-- Todo highlights
	--
	{
	"folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
	},
	
	--
	-- Commenter
	--
	{
		"terrortylor/nvim-comment",
		config = function ()
			require('nvim_comment').setup({line_mapping = "<leader>cl", operator_mapping = "<leader>c", comment_chunk_text_object = "ic"})
		end
	},


}
