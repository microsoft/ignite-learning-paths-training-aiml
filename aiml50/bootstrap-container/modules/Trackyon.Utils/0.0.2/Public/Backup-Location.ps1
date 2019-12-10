function Backup-Location {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [int] $Levels
   )

   $sb = New-Object System.Text.StringBuilder

   for ($i = 1; $i -le $Levels; $i++) {
      $sb.Append("../") | Out-Null
   }

   Set-Location -Path $($sb.ToString())
}

Set-Alias bu Backup-Location