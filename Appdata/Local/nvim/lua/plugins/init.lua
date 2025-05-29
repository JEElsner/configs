return {
	"folke/tokyonight.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
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
