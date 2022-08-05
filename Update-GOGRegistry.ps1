<#
.SYNOPSIS
    A quick script to correct the GOG Galaxy version information in the Windows Registry 
.DESCRIPTION
    The GOG Galaxy client installer either fails to or never enters the value for DisplayVersion property in to the Windows Registry. This causes issues with using tools like winget when attempting to upgrade the client. Update-GOGRegistry.ps1 will retrieve information about your current GOG Galaxy client installation from the Windows Registry, and then use that to overwrite or create the DisplayVersion property for the GOG Galaxy client with the version information collected from the GalaxyClient.exe.

    To execute this script, you will need administrative privileges or access to make changes to the registry.
#>

$gogreginfo = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\ | ForEach-Object { Get-ItemProperty $_.PSPath } | Where-Object { $_.DisplayName -contains "GOG GALAXY" }

$gogversion = Get-ItemProperty "$($gogreginfo.InstallLocation)GalaxyClient.exe" | Select-Object -ExpandProperty VersionInfo | Select-Object FileVersion

New-ItemProperty -Path $gogreginfo.PSPath -Name DisplayVersion -Value $gogversion.FileVersion -Force -Verbose
