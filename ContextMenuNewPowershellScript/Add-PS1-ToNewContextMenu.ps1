#requires -version 4
<#
.SYNOPSIS
  Name: Add-PS1-ToNewContextMenu.ps1
  This script adds 'PS Script' to the submenu 'New' of the contextmenu.
.DESCRIPTION
  This script adds a registry key to add the file type 'Powershell Script'
  to the submenu 'New' of the contextmenu.
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.1
  Author:         TDarkShadow
  Creation Date:  2019-02-22
  Purpose/Change: Initial script development
#>

# ---[Initialisations]---

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

# ---[Declarations]---

$registryPath = "HKEY_CLASSES_ROOT\.ps1\ShellNew"

$Name = "NullFile"

$Value = ""

# ---[Functions]---

Function Add-PS1-ToNewContextMenu {
  Begin {
    Write-Host 'Adding Registry key for New PS Script.'
  }
  Process {
    Try {
    $registryPath = "Registry::" + $registryPath
      If(!(Test-Path $registryPath)) {
		New-Item -Path $registryPath -Force | Out-Null
		New-ItemProperty -Path $registryPath -Name $name -Value $value `
			-PropertyType String -Force | Out-Null
	} Else {
		New-ItemProperty -Path $registryPath -Name $name -Value $value `
			-PropertyType String -Force | Out-Null
	}
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }
  End {
    If ($?) {
      Write-Host 'Completed Successfully.'
      Write-Host ' '
    }
  }
}

# ---[Execution]---
Add-PS1-ToNewContextMenu
