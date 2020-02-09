function Show-Browser {
   param(
      [parameter(Mandatory = $true)]
      [string] $url
   )

   Write-Verbose "Open browser to $url"

   if (_isOnWindows) {
      _openOnWindows $url
   }
   elseif (_isOnMac) {
      _openOnMac $url
   }
   else {
      _openOnLinux $url
   }
}

Set-Alias sb Show-Browser