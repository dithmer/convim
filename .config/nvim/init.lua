local modules = {
	"options",
	"plugins",
	"keymap",
	"lsp",
	"go",
	"fun",
}

for _, module in ipairs(modules) do
	require(module)
end
