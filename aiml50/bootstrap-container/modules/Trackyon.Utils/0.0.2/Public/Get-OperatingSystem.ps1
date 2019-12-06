function Get-OperatingSystem {
   if (_isOnWindows) {
      Write-Output 'Windows'
   }
   elseif (_isOnMac) {
      Write-Output 'macOS' 
   }
   else {
      Write-Output 'Linux'
   }
}

Set-Alias WhereAmI Get-OperatingSystem
Set-Alias wai Get-OperatingSystem