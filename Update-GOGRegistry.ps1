<#
.SYNOPSIS
    A quick script to correct the GOG Galaxy version information in the Windows Registry 
.DESCRIPTION
    The GOG Galaxy either fails to or never enters the version information for the installation in to the Windows Registry. This causes issues with using tools like winget to update the software. This script will retrieve information about your current GOG Galaxy installation from the Registry and use that to update the DisplayVersion property for the GOG Galaxy client. You will need administrative privledges or access to make changes to the registry.
#>

$gogreginfo = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_.DisplayName -contains "GOG GALAXY" }

$gogversion = Get-ItemProperty "$($gogreginfo.InstallLocation)GalaxyClient.exe" | Select-Object -ExpandProperty VersionInfo | Select-Object FileVersion

New-ItemProperty -Path $gogreginfo.PSPath -Name DisplayVersion -Value $gogversion.FileVersion -Force -Verbose