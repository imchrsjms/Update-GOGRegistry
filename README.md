# Update-GOGRegistry.ps1

A quick script to correct the GOG Galaxy version information in the Windows Registry

## Purpose

The GOG Galaxy client installer either fails to or never enters the value for `DisplayVersion` property in to the Windows Registry. This causes issues with using tools like `winget` when attempting to upgrade the client. `Update-GOGRegistry.ps1` will retrieve information about your current GOG Galaxy client installation from the Windows Registry, and then use that to overwrite or create the `DisplayVersion` property for the GOG Galaxy client with the version information collected from the `GalaxyClient.exe`.

To execute this script, you will need administrative privileges or access to make changes to the registry.
