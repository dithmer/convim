local modules = {
	"options",
	"plugins",
	"lsp",
	"go",
	"fun",
}

for _, module in ipairs(modules) do
	require(module)
end
