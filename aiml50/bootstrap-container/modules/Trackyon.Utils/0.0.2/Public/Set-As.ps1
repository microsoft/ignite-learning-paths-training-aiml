function Set-As {
   [CmdletBinding()]
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
   param(
      [Parameter(Mandatory = $true)]
      [string] $Name
   )

   New-PSDrive -PSProvider FileSystem -Name $Name -Root . -Scope Global | Out-Null
   Set-Location -LiteralPath "$($name):"
}

Set-Alias sa Set-As