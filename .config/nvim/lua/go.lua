M = {}

Tests = {}
Go_Test_Namespace = vim.api.nvim_create_namespace("go-tests")

local function add_test(test)
	test.Line = vim.fn.search("func " .. test.Test) - 1
	if test.Line == -1 then
		return
	end
	Tests[test.Test] = test
end

local function mark_test_passed(test)
	if Tests[test.Test] then
		Tests[test.Test].Passed = true
	end
end

local function mark_test_failed(test)
	if Tests[test.Test] then
		Tests[test.Test].Passed = false
	end
end

local function parse_line(line)
	local ok, test = pcall(vim.fn.json_decode, line)
	if not ok then
		return
	end

	if not test then
		return
	end

	if not test.Test or string.find(test.Test, "/") then
		-- TODO: add subtest support
		return
	end

	if test.Action == "run" then
		add_test(test)
	elseif test.Action == "pass" then
		mark_test_passed(test)
	elseif test.Action == "fail" then
		mark_test_failed(test)
	end
end

function M.RunTests()
	local cmd = "go test -json ./..."

	-- clear extmarks
	vim.api.nvim_buf_clear_namespace(0, Go_Test_Namespace, 0, -1)

	vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		on_stdout = function(_, data, _)
			for _, line in ipairs(data) do
				parse_line(line)
			end
		end,
		on_exit = function(_, _, _)
			local failed = {}
			for _, test in pairs(Tests) do
				if not test.Passed then
					table.insert(failed, {
						bufnr = 0,
						lnum = test.Line,
						col = 0,
						severity = vim.diagnostic.severity.ERROR,
						message = test.Test .. " failed",
						source = "go",
						user_data = {},
					})
				else
					vim.api.nvim_buf_set_extmark(0, Go_Test_Namespace, Tests[test.Test].Line, 0, {
						virt_text = { { "✓ Test succeeded" } },
						hl_mode = "combine",
						hl_group = "DiagnosticVirtualTextHint",
					})
				end
			end

			vim.diagnostic.set(Go_Test_Namespace, 0, failed, {})
		end,
	})
end

return M
