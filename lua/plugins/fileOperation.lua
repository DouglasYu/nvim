return {
	--
	-- Neo-tree.nvim
	-- 
	{
		"nvim-neo-tree/neo-tree.nvim", -- File explorer
		enabled = false,
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",	
		},
		config = function()
			vim.cmd("let g:neo_tree_remove_legacy_commands = 1")
			vim.keymap.set('n', 'tt', '<cmd>Neotree<CR>', { noremap = true, silent = true })
			require("neo-tree").setup({
				-- My Configs
				close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
				window = {
          position = "left",
          width = 30,
				},
				-- the following code is supposed to solve the nerd font v3 problem
				default_component_configs = {
					icon = {
						folder_empty = "󰜌",
						folder_empty_open = "󰜌",
					},
					git_status = {
						symbols = {
							renamed   = "󰁕",
							unstaged  = "󰄱",
							untracked = "",
              ignored   = "",
              staged    = "",
              conflict  = "",
						},
					},
					modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
				},
				document_symbols = {
					kinds = {
						File = { icon = "󰈙", hl = "Tag" },
						Namespace = { icon = "󰌗", hl = "Include" },
						Package = { icon = "󰏖", hl = "Label" },
						Class = { icon = "󰌗", hl = "Include" },
						Property = { icon = "󰆧", hl = "@property" },
						Enum = { icon = "󰒻", hl = "@number" },
						Function = { icon = "󰊕", hl = "Function" },
						String = { icon = "󰀬", hl = "String" },
						Number = { icon = "󰎠", hl = "Number" },
						Array = { icon = "󰅪", hl = "Type" },
						Object = { icon = "󰅩", hl = "Type" },
						Key = { icon = "󰌋", hl = "" },
						Struct = { icon = "󰌗", hl = "Type" },
						Operator = { icon = "󰆕", hl = "Operator" },
						TypeParameter = { icon = "󰊄", hl = "Type" },
						StaticMethod = { icon = '󰠄 ', hl = 'Function' },
					}
				},
				-- Add this section only if you've configured source selector.
				source_selector = {
					sources = {
						{ source = "filesystem", display_name = " 󰉓 Files " },
						{ source = "git_status", display_name = " 󰊢 Git " },
					},
				},
				-- Other options ...
			})
		end
	},


	--
	-- Another tree explorer
	--
	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		config = function ()
			require("nvim-tree").setup()
			vim.keymap.set('n', 'tt', '<cmd>NvimTreeFocus<CR>', { noremap = true, silent = true })
		end
	}

}
