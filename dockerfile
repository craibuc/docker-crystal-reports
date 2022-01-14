FROM mcr.microsoft.com/windows:1809

WORKDIR /app
COPY . .

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# install Crystal Reports run-time
RUN .\Install-CrystalReports.ps1 -Verbose

# install PsCrystal module from Github
RUN .\Install-PsCrystal.ps1 -Verbose

# import the module
ENTRYPOINT ['import-module','PsCrystal']

# start poweshell
CMD ['powershell']
