function New-Directory {
   [CmdletBinding()]
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
   param(
      [Parameter(Mandatory = $true)]
      [string] $Path
   )

   New-Item -Path $Path -ItemType Directory

   Set-Location -Path $Path
}

Set-Alias mcd New-Directory