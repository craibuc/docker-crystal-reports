<#
.Synopsis
Download and install Crystal Reports runtime for .NET framework

.Link
https://origin.softwaredownloads.sap.com/public/file/0020000000195602021

.Link
https://powershellexplained.com/2016-10-21-powershell-installing-msi-files/
#>

[CmdletBinding()]
param ()

$sourceUri='https://origin.softwaredownloads.sap.com/public/file/0020000000195602021'
$destinationPath = "$env:USERPROFILE\Downloads\CrystalReportsRuntimeInstaller.msi"

# save remote file locally
Write-Verbose 'Getting archive...'
Invoke-WebRequest -Uri $sourceUri -OutFile $destinationPath

Write-Verbose 'Installing library...'
Start-Process msiexec.exe -Wait -NoNewWindow -ArgumentList "/i $destinationPath /quiet /qn /norestart /l*v install.log"

# delete archive
Write-Verbose 'Removing archive...'
Remove-Item -Path $destinationPath
