function _isOnWindows {
   # This will work on 6.0 and later but is missing on
   # older versions
   if (Test-Path -Path 'variable:global:IsWindows') {
      return Get-Content -Path 'variable:global:IsWindows'
   }
   # This should catch older versions
   elseif (Test-Path -Path 'env:os') {
      return (Get-Content -Path 'env:os').StartsWith("Windows")
   }
   # If all else fails
   else {
      return $false
   }
}

function _isOnLinux {
   if (Test-Path -Path 'variable:global:IsLinux') {
      return Get-Content -Path 'variable:global:IsLinux'
   }

   return $false
}

function _isOnMac {
   # The variable to test if you are on Mac OS changed from
   # IsOSX to IsMacOS. Because I have Set-StrictMode -Version Latest
   # trying to access a variable that is not set will crash.
   # So I use Test-Path to determine which exist and which to use.
   if (Test-Path -Path 'variable:global:IsMacOS') {
      return Get-Content -Path 'variable:global:IsMacOS'
   }
   elseif (Test-Path -Path 'variable:global:IsOSX') {
      return Get-Content -Path 'variable:global:IsOSX'
   }
   else {
      return $false
   }
}

function _openOnWindows {
   param(
      [parameter(Mandatory = $true)]
      [string] $command
   )

   Start-Process "$command"
}

function _openOnMac {
   param(
      [parameter(Mandatory = $true)]
      [string] $command
   )

   Start-Process -FilePath open -Args "$command"
}

function _openOnLinux {
   param(
      [parameter(Mandatory = $true)]
      [string] $command
   )

   Start-Process -FilePath xdg-open -Args "$command"
}