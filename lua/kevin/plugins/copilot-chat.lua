return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			model = "claude-3.7-sonnet",
			window = {
				layout = "float",
				border = "rounded",
			},
		},
		keys = {
			{ "<leader>aa", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
		},
	},
}
