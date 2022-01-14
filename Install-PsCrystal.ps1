<#
.Synopsis
Install the latest version of the PsCrystal module from its Github repository.

#>
[CmdletBinding()]
param ()

$baseUri = 'https://github.com/craibuc/PsCrystal'

Write-Verbose 'Getting release...'
$latestRelease = Invoke-WebRequest "$baseUri/releases/latest" -Headers @{"Accept"="application/json"} -UseBasicParsing
$content = $latestRelease.Content | ConvertFrom-Json
$latestVersion = $content.tag_name

$sourceUri = "$baseUri/archive/$latestVersion.zip"
$destinationPath = "$env:USERPROFILE\Downloads\PsCrystal.zip"

# save remote file locally
Write-Verbose 'Getting archive...'
Invoke-WebRequest -Uri $sourceUri -OutFile $destinationPath

# unblock
Write-Verbose 'Unblocking archive...'
Get-Item $destinationPath | Unblock-File

# get user's powershell folder (PowerShell or WindowsPowerShell)
$powershell = Split-Path $profile -Parent

# decompress archive: ~/Downloads --> /Users/X/Documents/WindowsPowerShell/Modules
Write-Verbose 'Expanding archive...'
Expand-Archive $destinationPath -DestinationPath $powershell/Modules -Force

# rename folder: PsCrystal-x.y.z --> PsCrystal
Write-Verbose 'Installing module...'
Move-Item -Path "$powershell/Modules/PsCrystal-$latestVersion" -Destination "$powershell/Modules/PsCrystal"

# delete archive
Write-Verbose 'Removing archive...'
Remove-Item -Path $destinationPath
