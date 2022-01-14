<#
.EXAMPLE
PS> invoke-psake build

Creates the crystal-reports:latest image.

.EXAMPLE
PS> invoke-psake terminal

Starts a PowerShell (v5) session in the container

.NOTES

To use the build-automation file (Psakefile.ps1), the Psake module needs to be installed, then imported.

PS> install-module psake -scope currentuser
PS> import-module psake
#>

Task Build {
    docker build --tag "crystal-reports:latest" .
}

Task Terminal {
    docker run -it --rm "crystal-reports:latest" powershell
}