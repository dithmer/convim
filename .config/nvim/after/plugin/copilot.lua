vim.defer_fn(function()
	require("copilot").setup({
		suggestion = {
			auto_trigger = true,
		},
	})
	-- copilot
	local copilot_suggestion = require("copilot.suggestion")
	vim.keymap.set("i", "<c-c>", copilot_suggestion.next, { noremap = true })
	vim.keymap.set("i", "<tab>", copilot_suggestion.accept, { noremap = true })
end, 100)
