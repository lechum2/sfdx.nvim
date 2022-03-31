lua require('sfdx')

:command SfdxDeployCurrentFile :lua require("sfdx").deployCurrentFile()
:command SfdxTestCurrentClass :lua require("sfdx").runTestsFromCurrentFile()
:command SfdxTestRetrieveCurrentFile :lua require("sfdx").retrieveCurrentFile()
