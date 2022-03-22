local M = {}

local sfdxCommand = '/usr/bin/sfdx'
local sfdxDeployCommand = 'force:source:deploy'
local sfdxDeployPathParameter = '--sourcepath'

function M.deploy()
	local command = { sfdxCommand, sfdxDeployCommand, sfdxDeployPathParameter, vim.fn.expand('%') }
	local openPop = assert(io.popen(table.concat(command, ' '), 'r'))
	local output = openPop:read('*all')
	openPop:close()
	print(output)
end

return M
