return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		close_if_last_window = true,
		window = {
			mappings = {
				["o"] = "open",
				["oc"] = "noop",
				["od"] = "noop",
				["og"] = "noop",
				["om"] = "noop",
				["on"] = "noop",
				["os"] = "noop",
				["ot"] = "noop",
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
		},
	},
	keys = {
		{ "<F5>", "<cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
	},
}
