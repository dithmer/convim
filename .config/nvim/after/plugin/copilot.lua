vim.defer_fn(function()
	require("copilot").setup({
		suggestion = {
			auto_trigger = true,
		},
		filetypes = {
			markdown = true,
		},
	})
	-- copilot
	local copilot_suggestion = require("copilot.suggestion")
	vim.keymap.set("i", "<c-n>", copilot_suggestion.next, { noremap = true })
	vim.keymap.set("i", "<c-c>", copilot_suggestion.accept, { noremap = true })
end, 100)
