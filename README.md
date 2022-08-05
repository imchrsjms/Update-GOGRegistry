# Update-GOGRegistry.ps1

A quick script to correct the GOG Galaxy version information in the Windows Registry

## Purpose

The GOG Galaxy either fails to or never enters the version information for the installation in to the Windows Registry. This causes issues with using tools like winget to update the software. This script will retrieve information about your current GOG Galaxy installation from the Registry and use that to update the DisplayVersion property for the GOG Galaxy client. You will need administrative privledges or access to make changes to the registry.
