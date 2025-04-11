return {
	"williamboman/mason.nvim",
	"hrsh7th/nvim-cmp",
	"neovim/nvim-lspconfig",
	{
		"kylechui/nvim-surround",
		version= "^3.0.0", -- stable
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			}
		},
	},
}
