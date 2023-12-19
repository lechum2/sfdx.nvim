local M = {}

local sfdxCommand = "sf"

function M.deployCurrentFile()
    local sfdxDeployCommand = "project deploy start"
    local sfdxDeployPathParameter = "--source-dir"
    local command = { sfdxCommand, sfdxDeployCommand, sfdxDeployPathParameter, vim.fn.expand("%") }
    print("deploying...")
    local output = vim.fn.system(table.concat(command, " "))
    print(output)
end

function M.runTestsFromCurrentFile()
    local sfdxRunTestCommand = "apex test run"
    local sfdxRunTestClassParamter = "--class-names"
    local sfdxRunTestWaitParamter = "--wait 10"
    local filename = vim.fn.expand("%:t:r")
    local command = { sfdxCommand, sfdxRunTestCommand, sfdxRunTestClassParamter, filename, sfdxRunTestWaitParamter }
    print("running tests...")
    local output = vim.fn.system(table.concat(command, " "))
    print(output)
end

function M.retrieveCurrentFile()
    local sfdxSubcommand = "project retrieve start"
    local flagName = "--source-dir"
    local filename = vim.fn.expand("%:t:r")
    local command = { sfdxCommand, sfdxSubcommand, flagName, filename }
    print("retrieving...")
    local output = vim.fn.system(table.concat(command, " "))
    print(output)
end

function M.getDefaultUserName()
    local sfdxFile = ".sf/config.json"
    local sfdxConfigFile = vim.fn.findfile(sfdxFile, ".;")
    if vim.fn.filereadable(sfdxConfigFile) == 0 then
        return ""
    end
    local sfdxConfiguration = vim.fn.json_decode(vim.fn.readfile(sfdxConfigFile))
    local defaultUserName = sfdxConfiguration["target-org"]
    if defaultUserName == nil then
        return ""
    end
    return defaultUserName
end

return M
