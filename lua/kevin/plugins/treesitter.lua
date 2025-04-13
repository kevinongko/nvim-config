return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"nix",
			"rust",
			"php",
			"jsdoc",
			"bash",
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"dockerfile",
			"gitignore",
			"vue",
			"regex",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
