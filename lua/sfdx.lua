local M = {}

local sfdxCommand = "sf"

function M.deployCurrentFile()
    local sfdxDeployCommand = "project deploy start"
    local sfdxDeployPathParameter = "--source-dir"
    local filename = vim.fn.expand("%")
    local command = { sfdxCommand, sfdxDeployCommand, sfdxDeployPathParameter, filename }
    vim.notify("deploying file: " .. filename, vim.log.levels.INFO)
    local output = vim.fn.system(table.concat(command, " "))
    vim.notify(output, vim.log.levels.INFO)
end

function M.runTestsFromCurrentFile()
    local sfdxRunTestCommand = "apex test run"
    local sfdxRunTestClassParamter = "--class-names"
    local sfdxRunTestWaitParamter = "--wait 10"
    local filename = vim.fn.expand("%")
    local command = { sfdxCommand, sfdxRunTestCommand, sfdxRunTestClassParamter, filename, sfdxRunTestWaitParamter }
    vim.notify("running tests from file: " .. filename, vim.log.levels.INFO)
    local output = vim.fn.system(table.concat(command, " "))
    vim.notify(output, vim.log.levels.INFO)
end

function M.retrieveCurrentFile()
    local sfdxSubcommand = "project retrieve start"
    local flagName = "--source-dir"
    local filename = vim.fn.expand("%")
    local command = { sfdxCommand, sfdxSubcommand, flagName, filename }
    vim.notify("retrieving file: " .. filename, vim.log.levels.INFO)
    local output = vim.fn.system(table.concat(command, " "))
    vim.notify(output, vim.log.levels.INFO)
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
