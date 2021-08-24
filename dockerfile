ENV MSI=./CRRuntime_64bit_13_0_30.msi

FROM mcr.microsoft.com/windows:1809

WORKDIR /install

COPY ./install .

RUN if (!(Test-Path "$env:MSI")) { Invoke-WebRequest "https://origin.softwaredownloads.sap.com/public/file/0020000000195602021" -O "$env:MSI" } \
Start-Process -FilePath "$env:MSI" -ArgumentList '/quiet', '/NoRestart', '/L*V ./cr_redist.log' -Wait; \
Remove-Item .\* -Exclude *.log;
