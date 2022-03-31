local M = {}

local sfdxCommand = "sfdx"

function M.deployCurrentFile()
	local sfdxDeployCommand = "force:source:deploy"
	local sfdxDeployPathParameter = "--sourcepath"
	local command = { sfdxCommand, sfdxDeployCommand, sfdxDeployPathParameter, vim.fn.expand("%") }
	print("deploying...")
	local output = vim.fn.system(table.concat(command, " "))
	print(output)
end

function M.runTestsFromCurrentFile()
	local sfdxRunTestCommand = "force:apex:test:run"
	local sfdxRunTestClassParamter = "--classnames"
	local sfdxRunTestWaitParamter = "--wait 10"
	local filename = vim.fn.expand("%:t:r")
	local command = { sfdxCommand, sfdxRunTestCommand, sfdxRunTestClassParamter, filename, sfdxRunTestWaitParamter }
	print("running tests...")
	local output = vim.fn.system(table.concat(command, " "))
	print(output)
end

function M.retrieveCurrentFile()
	local sfdxSubcommand = "force:source:retrieve"
	local flagName = "--sourcepath"
	local filename = vim.fn.expand("%:t:r")
	local command = { sfdxCommand, sfdxSubcommand, flagName, filename }
	print("retrieving...")
	local output = vim.fn.system(table.concat(command, " "))
	print(output)
end

return M