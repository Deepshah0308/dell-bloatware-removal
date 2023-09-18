# Script Version 1.0
# This script will uninstall all Dell bloatware except Dell Command | Update for Windows

# Import the Commonstuff module if it is not already installed
# This module provides the Get-InstalledSoftware and Uninstall-ApplicationViaUninstallString commands
if (Get-Module -ListAvailable -Name Commonstuff) {
    Write-Host "Module exists"
} 
else {
    Write-Host "Module does not exist installing Module now"
    Install-Module Commonstuff
}

# Get the list of all installed software that contains "Dell" or "ExpressConnect Drivers & Services" in their display name
# Exclude Dell Command | Update for Windows from the list
$SWName = Get-InstalledSoftware "Dell", "ExpressConnect Drivers & Services" | ? DisplayName -NotLike "Dell Command | Update for Windows*" | select -ExpandProperty DisplayName

# If there is any bloatware in the list, try to uninstall it using the Uninstall-ApplicationViaUninstallString command
# This command uses the uninstall string from the registry to run the uninstaller
# If there is an error during the uninstallation, write an error message
if ($SWName) {
    try {
        $SWName | % {
            $param = @{
                Name        = $_
                ErrorAction = "Stop"
            }

            if ($_ -eq "Dell Optimizer Service") {
                # The uninstaller for Dell Optimizer Service requires a -silent switch to run unattended
                $param.addArgument = "-silent"
            }

            Uninstall-ApplicationViaUninstallString @param
        }
    } catch {
        Write-Error "There was an error when uninstalling bloatware: $_"
    }
} else {
    "There is no bloatware detected"
}
