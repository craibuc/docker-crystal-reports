# docker-crystal-reports
A Docker project to create an image that contains the Crystal Reports runtime for the .NET framework.

# Usage

### Create image

```powershell
docker build --tag crystal-reports:latest .
```

### Run container and create an interactive, powershell session

```powershell
docker run -it --rm crystal-reports:latest powershell
```

## References

- [PsCrystal](https://github.com/craibuc/PsCrystal)
- [Crystal Reports runtime for .NET framework](https://origin.softwaredownloads.sap.com/public/file/0020000000195602021)
- [How to download and Install Crystal Report Runtime](https://www.tektutorialshub.com/crystal-reports/how-to-download-and-install-crystal-report-runtime/)
- [Powershell: Installing MSI files](https://powershellexplained.com/2016-10-21-powershell-installing-msi-files/)