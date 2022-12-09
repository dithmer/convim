local dap_virtual_text = require("nvim-dap-virtual-text")
dap_virtual_text.setup({
	highlight_changed_variables = true,
	commented = true,
	virt_text_win_col = 80,
	show_stop_reason = false,
})
