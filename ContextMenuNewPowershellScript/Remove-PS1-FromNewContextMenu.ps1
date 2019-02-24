#requires -version 4
<#
.SYNOPSIS
  Name: Remove-PS1-FromNewContextMenu.ps1
  This script removes 'PS Script' from the submenu 'New' of the contextmenu.
.DESCRIPTION
  This script removes the registry key that adds the file type 'Powershell Script'
  to the submenu 'New' of the contextmenu.
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         TDarkShadow
  Creation Date:  2019-02-22
  Purpose/Change: Initial script development
#>

# ---[Initialisations]---

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

# ---[Declarations]---

$registryPath = "HKEY_CLASSES_ROOT\.ps1\ShellNew"

# ---[Functions]---

Function Remove-PS1-FromNewContextMenu {
  Begin {
    Write-Host 'Removing Registry key for New PS Script.'
  }
  Process {
    Try {
      $registryPath = "Registry::" + $registryPath
      If(!(Test-Path $registryPath)) {
        Write-Host "New PS1 Contextmenu already deleted."
      } Else {
        Remove-Item -Path $registryPath -Force | Out-Null
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
Remove-PS1-FromNewContextMenu
