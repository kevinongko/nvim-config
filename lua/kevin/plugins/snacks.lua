return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<F1>",
			function()
				require("snacks").picker.files()
			end,
			desc = "Toggle files picker",
		},
		{
			"<F3>",
			function()
				require("snacks").terminal.toggle()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<F3>",
			function()
				require("snacks").terminal.toggle()
			end,
			mode = "t",
			desc = "Toggle Terminal",
		},
		{
			"<F4>",
			function()
				require("snacks").notifier.show_history()
			end,
			desc = "Show notification history",
		},
		{
			"<leader>ff",
			function()
				require("snacks").picker.files()
			end,
			desc = "Find files in project",
		},
		{
			"<leader>fs",
			function()
				require("snacks").picker.grep()
			end,
			desc = "Find string in project",
		},
		{
			"<leader>gb",
			function()
				require("snacks").git.blame_line()
			end,
			desc = "Git blame this line",
		},
		{
			"<leader>gg",
			function()
				require("snacks").lazygit.open()
			end,
			desc = "Toggle Lazygit UI",
		},
	},
	opts = {
		animate = { enabled = true },
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		image = { enabled = true },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = {
			enabled = true,
			shell = "nu",
		},
		words = {
			enabled = true,
			notify_jump = true,
		},
	},
}
