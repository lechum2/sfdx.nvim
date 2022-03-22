local M = {}

local sfdxCommand = "/usr/bin/sfdx"
local sfdxDeployCommand = "force:source:deploy"
local sfdxDeployPathParameter = "--sourcepath"

function M.deploy()
	local command = { sfdxCommand, sfdxDeployCommand, sfdxDeployPathParameter, vim.fn.expand("%") }
	local output = vim.fn.system(table.concat(command, " "))
	print(output)
end

return M
