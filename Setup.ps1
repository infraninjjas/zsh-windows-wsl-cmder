#requires -version 2
<#
.SYNOPSIS
  Script for installing and configuring; WSL, Ubuntu, and ConEmu/Cmder. Script should be run as Admin
.DESCRIPTION
  Script for installing and configuring; WSL, Ubuntu, and ConEmu/Cmder. Script should be run as Admin
#.PARAMETER
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         Jon Laberge
  Creation Date:  11/11/2018
  Purpose/Change: Initial script development
  
.EXAMPLE
  .\Setup.ps1
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"
$WSLEnabled = (Get-WindowsOptionalFeature -Online -FeatureName *Linux* | where {$_.State -eq "Enabled"}) -ne $Null
$distroPath = "C:\distro"
$distroURI = "https://aka.ms/wsl-ubuntu-1804"
$distroName = $distroURI.split("-")[1]
if (!(Test-Path $distroPath))
{
    New-Item -ItemType Directory -Force -Path $distroPath
}

#----------------------------------------------------------[Declarations]----------------------------------------------------------


#-----------------------------------------------------------[Functions]------------------------------------------------------------

Function Invoke-EnableWSL{
  Param()
  
  Begin{
  }
  
  Process{
    Try{
		if ($WSLEnabled = $False)
		{
			Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
			Write-Output "WSL Enabled Successfully, Computer will now restart"
		} 
		else
		{
			Write-Verbose "WSL Already enabled, Skipping..."
		}
    }
    
    Catch{
      Write-Error "Encountered an error."
      Break
    }
  }
  
  End{
    If($?){
      
    }
  }
}
Function Invoke-InstallDistro{
  Param()
  
  Begin{
  }
  
  Process{
    Try{
		if ($WSLEnabled = $True)
		{
			Invoke-WebRequest -Uri $distroURI -OutFile "$distroPath\$distroName.appx" -UseBasicParsing
			Rename-Item Ubuntu.appx Ubuntu.zip
			Expand-Archive Ubuntu.zip Ubuntu
			$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
			[System.Environment]::SetEnvironmentVariable("PATH", $userenv + "C:\Distros\$distroName", "User")
		} 
		else
		{
			Write-Verbose "WSL Already enabled, Skipping..."
		}
    }
    
    Catch{
      Write-Error "Encountered an error."
      Break
    }
  }
  
  End{
    If($?){
      
    }
  }
}



#-----------------------------------------------------------[Execution]------------------------------------------------------------
#Script Execution goes here
Invoke-EnableWSL
Invoke-InstallDistro
