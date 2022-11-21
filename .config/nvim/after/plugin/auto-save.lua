local ok, auto_save = pcall(require, "auto-save")
if not ok then
	return
end

auto_save.setup({})
