# Apply types to the returned objects so format and type files can
# identify the object and act on it.
function _applyTypes {
   param(
      $item,
      $type
   )
   $item.PSObject.TypeNames.Insert(0, $type)
}
function _applyTypesWorkItemType {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.WorkItemType')
}
function _applyTypesToWorkItem {
   param($item)
   # If there are ids in the list that don't map to a work item and empty
   # entry is returned in its place if ErrorPolicy is Omit.
   if ($item) {
      $item.PSObject.TypeNames.Insert(0, 'Team.WorkItem')
   }
}
function _applyTypesToUser {
   param(
      [Parameter(Mandatory = $true)]
      $item
   )
   $item.PSObject.TypeNames.Insert(0, 'Team.UserEntitlement')
   $item.accessLevel.PSObject.TypeNames.Insert(0, 'Team.AccessLevel')
}
function _applyTypesToTfvcBranch {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.TfvcBranch')
}
function _applyTypesToTeamMember {
   param(
      [Parameter(Mandatory = $true)]
      $item,
      [Parameter(Mandatory = $true)]
      $team,
      [Parameter(Mandatory = $true)]
      $ProjectName
   )
   # Add the team name as a NoteProperty so we can use it further down the pipeline (it's not returned from the REST call)
   $item | Add-Member -MemberType NoteProperty -Name Team -Value $team
   $item | Add-Member -MemberType NoteProperty -Name ProjectName -Value $ProjectName
   $item.PSObject.TypeNames.Insert(0, 'Team.TeamMember')
}
function _applyTypesToApproval {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.Approval')
}
function _applyTypesToBuild {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.Build')
   $item.logs.PSObject.TypeNames.Insert(0, 'Team.Logs')
   $item._links.PSObject.TypeNames.Insert(0, 'Team.Links')
   $item.project.PSObject.TypeNames.Insert(0, 'Team.Project')
   $item.requestedBy.PSObject.TypeNames.Insert(0, 'Team.User')
   $item.requestedFor.PSObject.TypeNames.Insert(0, 'Team.User')
   $item.lastChangedBy.PSObject.TypeNames.Insert(0, 'Team.User')
   $item.repository.PSObject.TypeNames.Insert(0, 'Team.Repository')
   $item.definition.PSObject.TypeNames.Insert(0, 'Team.BuildDefinition')
   if ($item.PSObject.Properties.Match('queue').count -gt 0 -and $null -ne $item.queue) {
      $item.queue.PSObject.TypeNames.Insert(0, 'Team.Queue')
   }
   if ($item.PSObject.Properties.Match('orchestrationPlan').count -gt 0 -and $null -ne $item.orchestrationPlan) {
      $item.orchestrationPlan.PSObject.TypeNames.Insert(0, 'Team.OrchestrationPlan')
   }
}
function _applyArtifactTypes {
   $item.PSObject.TypeNames.Insert(0, "Team.Build.Artifact")
   if ($item.PSObject.Properties.Match('resource').count -gt 0 -and $null -ne $item.resource) {
      $item.resource.PSObject.TypeNames.Insert(0, 'Team.Build.Artifact.Resource')
      $item.resource.properties.PSObject.TypeNames.Insert(0, 'Team.Build.Artifact.Resource.Properties')
   }
}
function _applyTypesToAzureSubscription {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.AzureSubscription')
}
function _applyTypesToPolicy {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.Policy')
}
function _applyTypesToPolicyType {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.PolicyType')
}
function _applyTypesToPullRequests {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.PullRequest')
}
function _applyTypesToRelease {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.Release')
   if ($item.PSObject.Properties.Match('environments').count -gt 0 -and $null -ne $item.environments) {
      foreach ($e in $item.environments) {
         $e.PSObject.TypeNames.Insert(0, 'Team.Environment')
      }
   }
   $item._links.PSObject.TypeNames.Insert(0, 'Team.Links')
   $item._links.self.PSObject.TypeNames.Insert(0, 'Team.Link')
   $item._links.web.PSObject.TypeNames.Insert(0, 'Team.Link')
}
function _applyTypesToServiceEndpoint {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.ServiceEndpoint')
   $item.createdBy.PSObject.TypeNames.Insert(0, 'Team.User')
   $item.authorization.PSObject.TypeNames.Insert(0, 'Team.authorization')
   $item.data.PSObject.TypeNames.Insert(0, 'Team.ServiceEndpoint.Details')
   if ($item.PSObject.Properties.Match('operationStatus').count -gt 0 -and $null -ne $item.operationStatus) {
      # This is VSTS
      $item.operationStatus.PSObject.TypeNames.Insert(0, 'Team.OperationStatus')
   }
}
function _applyTypesToServiceEndpointType {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.ServiceEndpointType')
   $item.inputDescriptors.PSObject.TypeNames.Insert(0, 'Team.InputDescriptor[]')
   foreach ($inputDescriptor in $item.inputDescriptors) {
      $inputDescriptor.PSObject.TypeNames.Insert(0, 'Team.InputDescriptor')
   }
   $item.authenticationSchemes.PSObject.TypeNames.Insert(0, 'Team.AuthenticationScheme[]')
   foreach ($authenticationScheme in $item.authenticationSchemes) {
      $authenticationScheme.PSObject.TypeNames.Insert(0, 'Team.AuthenticationScheme')
   }
   if ($item.PSObject.Properties.Match('dataSources').count -gt 0 -and $null -ne $item.dataSources) {
      $item.dataSources.PSObject.TypeNames.Insert(0, 'Team.DataSource[]')
      foreach ($dataSource in $item.dataSources) {
         $dataSource.PSObject.TypeNames.Insert(0, 'Team.DataSource')
      }
   }
}
function _applyTypesToVariableGroup {
   param($item)
   $item.PSObject.TypeNames.Insert(0, 'Team.VariableGroup')
   $item.createdBy.PSObject.TypeNames.Insert(0, 'Team.User')
   $item.modifiedBy.PSObject.TypeNames.Insert(0, 'Team.User')
   if ($item.PSObject.Properties.Match('providerData').count -gt 0 -and $null -ne $item.providerData) {
      $item.providerData.PSObject.TypeNames.Insert(0, 'Team.ProviderData')
   }
   $item.variables.PSObject.TypeNames.Insert(0, 'Team.Variables')
}
function _callMembershipAPI {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [string] $Id,
      [ValidateSet('Get', 'Post', 'Patch', 'Delete', 'Options', 'Put', 'Default', 'Head', 'Merge', 'Trace')]
      [string] $Method,
      [ValidateSet('', 'Up', 'Down')]
      [string] $Direction
   )
   Set-StrictMode -Version Latest
   # This will throw if this account does not support the graph API
   _supportsGraph
   Write-Verbose "Getting members for $Id"
   $query = @{}
   if ($Direction) {
      $query['direction'] = $Direction
   }
   # Call the REST API
   $resp = _callAPI -Area 'graph' -Resource 'memberships' `
      -Id $Id `
      -SubDomain "vssps" `
      -Method $Method `
      -Version $([VSTeamVersions]::Graph) `
      -QueryString $query
   return $resp
}
Set-StrictMode -Version Latest
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "It is used in other files")]
$profilesPath = "$HOME/vsteam_profiles.json"
# Not all versions support the name features.
function _supportsGraph {
   _hasAccount
   if ($false -eq $(_testGraphSupport)) {
      throw 'This account does not support the graph API.'
   }
}
function _testGraphSupport {
   if (-not [VSTeamVersions]::Graph) {
      return $false
   }
   return $true
}
function _supportsFeeds {
   _hasAccount
   if ($false -eq $(_testFeedSupport)) {
      throw 'This account does not support packages.'
   }
}
function _testFeedSupport {
   if (-not [VSTeamVersions]::Packaging) {
      return $false
   }
   return $true
}
function _supportsSecurityNamespace {
   _hasAccount
   if (([VSTeamVersions]::Version -ne "VSTS") -and ([VSTeamVersions]::Version -ne "AzD")) {
      throw 'Security Namespaces are currently only supported in Azure DevOps Service (Online)'
   }
}
function _supportsMemberEntitlementManagement {
   _hasAccount
   if (-not [VSTeamVersions]::MemberEntitlementManagement) {
      throw 'This account does not support Member Entitlement.'
   }
}
function _testAdministrator {
   $user = [Security.Principal.WindowsIdentity]::GetCurrent()
   (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
function _hasAccount {
   if (-not [VSTeamVersions]::Account) {
      throw 'You must call Set-VSTeamAccount before calling any other functions in this module.'
   }
}
function _buildRequestURI {
   [CmdletBinding()]
   param(
      [string]$resource,
      [string]$area,
      [string]$id,
      [string]$version,
      [string]$subDomain,
      [object]$queryString
   )
   DynamicParam {
      _buildProjectNameDynamicParam -Mandatory $false
   }
   process {
      _hasAccount
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $sb = New-Object System.Text.StringBuilder
      $sb.Append($(_addSubDomain -subDomain $subDomain)) | Out-Null
      if ($ProjectName) {
         $sb.Append("/$projectName") | Out-Null
      }
      $sb.Append("/_apis/") | Out-Null
      if ($area) {
         $sb.Append("$area/") | Out-Null
      }
      if ($resource) {
         $sb.Append("$resource/") | Out-Null
      }
      if ($id) {
         $sb.Append($id) | Out-Null
      }
      if ($version) {
         $sb.Append("?api-version=$version") | Out-Null
      }
      $url = $sb.ToString()
      if ($queryString) {
         foreach ($key in $queryString.keys) {
            $Url += _appendQueryString -name $key -value $queryString[$key]
         }
      }
      return $url
   }
}
function _handleException {
   param(
      [Parameter(Position = 1)]
      $ex
   )
   $handled = $false
   if ($ex.Exception.PSObject.Properties.Match('Response').count -gt 0 -and
      $null -ne $ex.Exception.Response -and
      $ex.Exception.Response.StatusCode -ne "BadRequest") {
      $handled = $true
      $msg = "An error occurred: $($ex.Exception.Message)"
      Write-Warning -Message $msg
   }
   try {
      $e = (ConvertFrom-Json $ex.ToString())
      $hasValueProp = $e.PSObject.Properties.Match('value')
      if (0 -eq $hasValueProp.count) {
         $handled = $true
         Write-Warning -Message $e.message
      }
      else {
         $handled = $true
         Write-Warning -Message $e.value.message
      }
   }
   catch {
      $msg = "An error occurred: $($ex.Exception.Message)"
   }
   if (-not $handled) {
      throw $ex
   }
}
function _isVSTS {
   param(
      [parameter(Mandatory = $true)]
      [string] $instance
   )
   return $instance -like "*.visualstudio.com*" -or $instance -like "https://dev.azure.com/*"
}
function _getVSTeamAPIVersion {
   param(
      [parameter(Mandatory = $true)]
      [string] $instance,
      [string] $Version
   )
   if ($Version) {
      return $Version
   }
   else {
      if (_isVSTS $instance) {
         return 'VSTS'
      }
      else {
         return 'TFS2017'
      }
   }
}
function _isOnWindows {
   $os = Get-OperatingSystem
   return $os -eq 'Windows'
}
function _addSubDomain {
   param(
      $subDomain
   )
   $instance = [VSTeamVersions]::Account
   # For VSTS Entitlements is under .vsaex
   if ($subDomain -and [VSTeamVersions]::Account.ToLower().Contains('dev.azure.com')) {
      $instance = [VSTeamVersions]::Account.ToLower().Replace('dev.azure.com', "$subDomain.dev.azure.com")
   }
   return $instance
}
function _appendQueryString {
   param(
      $name,
      $value,
      # When provided =0 will be outputed otherwise zeros will not be
      # added. I had to add this for the userentitlements that is the only
      # VSTS API I have found that requires Top and Skip to be passed in.
      [Switch]$retainZero
   )
   if ($retainZero.IsPresent) {
      if ($null -ne $value) {
         return "&$name=$value"
      }
   }
   else {
      if ($value) {
         return "&$name=$value"
      }
   }
}
function _getUserAgent {
   [CmdletBinding()]
   param()
   $os = Get-OperatingSystem
   $result = "Team Module/$([VSTeamVersions]::ModuleVersion) ($os) PowerShell/$($PSVersionTable.PSVersion.ToString())"
   Write-Verbose $result
   return $result
}
function _useWindowsAuthenticationOnPremise {
   return (_isOnWindows) -and (!$env:TEAM_PAT) -and -not ([VSTeamVersions]::Account -like "*visualstudio.com") -and -not ([VSTeamVersions]::Account -like "https://dev.azure.com/*")
}
function _useBearerToken {
   return (!$env:TEAM_PAT) -and ($env:TEAM_TOKEN)
}
function _getWorkItemTypes {
   param(
      [Parameter(Mandatory = $true)]
      [string] $ProjectName
   )
   if (-not [VSTeamVersions]::Account) {
      Write-Output @()
      return
   }
   $area = "/wit"
   $resource = "/workitemtypes"
   $instance = [VSTeamVersions]::Account
   $version = [VSTeamVersions]::Core
   # Build the url to list the projects
   # You CANNOT use _buildRequestURI here or you will end up
   # in an infinite loop.
   $listurl = $instance + '/' + $ProjectName + '/_apis' + $area + $resource + '?api-version=' + $version
   # Call the REST API
   try {
      $resp = _callAPI -url $listurl
      # This call returns JSON with "": which causes the ConvertFrom-Json to fail.
      # To replace all the "": with "_end":
      $resp = $resp.Replace('"":', '"_end":') | ConvertFrom-Json
      if ($resp.count -gt 0) {
         Write-Output ($resp.value).name
      }
   }
   catch {
      Write-Verbose $_
      Write-Output @()
   }
}
function _getProjects {
   if (-not [VSTeamVersions]::Account) {
      Write-Output @()
      return
   }
   $resource = "/projects"
   $instance = [VSTeamVersions]::Account
   $version = [VSTeamVersions]::Core
   # Build the url to list the projects
   # You CANNOT use _buildRequestURI here or you will end up
   # in an infinite loop.
   $listurl = $instance + '/_apis' + $resource + '?api-version=' + $version + '&stateFilter=All&$top=9999'
   # Call the REST API
   try {
      $resp = _callAPI -url $listurl
      if ($resp.count -gt 0) {
         Write-Output ($resp.value).name
      }
   }
   catch {
      Write-Output @()
   }
}
function _buildProjectNameDynamicParam {
   param(
      [string] $ParameterName = 'ProjectName',
      [string] $ParameterSetName,
      [bool] $Mandatory = $true,
      [string] $AliasName,
      [int] $Position = 0
   )
   # Create the dictionary
   $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
   # Create the collection of attributes
   $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
   # Create and set the parameters' attributes
   $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
   $ParameterAttribute.Mandatory = $Mandatory
   $ParameterAttribute.Position = $Position
   if ($ParameterSetName) {
      $ParameterAttribute.ParameterSetName = $ParameterSetName
   }
   $ParameterAttribute.ValueFromPipelineByPropertyName = $true
   $ParameterAttribute.HelpMessage = "The name of the project.  You can tab complete from the projects in your Team Services or TFS account when passed on the command line."
   # Add the attributes to the attributes collection
   $AttributeCollection.Add($ParameterAttribute)
   if ($AliasName) {
      $AliasAttribute = New-Object System.Management.Automation.AliasAttribute(@($AliasName))
      $AttributeCollection.Add($AliasAttribute)
   }
   # Generate and set the ValidateSet
   if ($([VSTeamProjectCache]::timestamp) -ne (Get-Date).Minute) {
      $arrSet = _getProjects
      [VSTeamProjectCache]::projects = $arrSet
      [VSTeamProjectCache]::timestamp = (Get-Date).Minute
   }
   else {
      $arrSet = [VSTeamProjectCache]::projects
   }
   if ($arrSet) {
      Write-Verbose "arrSet = $arrSet"
      $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
      # Add the ValidateSet to the attributes collection
      $AttributeCollection.Add($ValidateSetAttribute)
   }
   # Create and return the dynamic parameter
   $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
   $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
   return $RuntimeParameterDictionary
   <#
   Builds a dynamic parameter that can be used to tab complete the ProjectName
   parameter of functions from a list of projects from the added TFS Account.
   You must call Set-VSTeamAccount before trying to use any function that relies
   on this dynamic parameter or you will get an error.
   This can only be used in Advanced Fucntion with the [CmdletBinding()] attribute.
   The function must also have a begin block that maps the value to a common variable
   like this.
      DynamicParam {
         # Generate and set the ValidateSet
         $arrSet = Get-VSTeamProjects | Select-Object -ExpandProperty Name
         _buildProjectNameDynamicParam -arrSet $arrSet
      }
      process {
         # Bind the parameter to a friendly variable
         $ProjectName = $PSBoundParameters[$ParameterName]
      }
   #>
}
function _getProcesses {
   if (-not [VSTeamVersions]::Account) {
      Write-Output @()
      return
   }
   $resource = "/process/processes"
   $instance = [VSTeamVersions]::Account
   $version = [VSTeamVersions]::Core
   # Build the url to list the projects
   # You CANNOT use _buildRequestURI here or you will end up
   # in an infinite loop.
   $listurl = $instance + '/_apis' + $resource + '?api-version=' + $version + '&stateFilter=All&$top=9999'
   # Call the REST API
   try {
      $resp = _callAPI -url $listurl
      if ($resp.count -gt 0) {
         Write-Output ($resp.value).name
      }
   }
   catch {
      Write-Output @()
   }
}
function _buildProcessNameDynamicParam {
   param(
      [string] $ParameterName = 'ProcessName',
      [string] $ParameterSetName,
      [bool] $Mandatory = $true,
      [string] $AliasName,
      [int] $Position = 0
   )
   # Create the dictionary
   $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
   # Create the collection of attributes
   $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
   # Create and set the parameters' attributes
   $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
   $ParameterAttribute.Mandatory = $Mandatory
   $ParameterAttribute.Position = $Position
   if ($ParameterSetName) {
      $ParameterAttribute.ParameterSetName = $ParameterSetName
   }
   $ParameterAttribute.ValueFromPipelineByPropertyName = $true
   $ParameterAttribute.HelpMessage = "The name of the process.  You can tab complete from the processes in your Team Services or TFS account when passed on the command line."
   # Add the attributes to the attributes collection
   $AttributeCollection.Add($ParameterAttribute)
   if ($AliasName) {
      $AliasAttribute = New-Object System.Management.Automation.AliasAttribute(@($AliasName))
      $AttributeCollection.Add($AliasAttribute)
   }
   # Generate and set the ValidateSet
   if ($([VSTeamProcessCache]::timestamp) -ne (Get-Date).Minute) {
      $arrSet = _getProcesses
      [VSTeamProcessCache]::processes = $arrSet
      [VSTeamProcessCache]::timestamp = (Get-Date).Minute
   }
   else {
      $arrSet = [VSTeamProcessCache]::projects
   }
   if ($arrSet) {
      Write-Verbose "arrSet = $arrSet"
      $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
      # Add the ValidateSet to the attributes collection
      $AttributeCollection.Add($ValidateSetAttribute)
   }
   # Create and return the dynamic parameter
   $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
   $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
   return $RuntimeParameterDictionary
   <#
   Builds a dynamic parameter that can be used to tab complete the ProjectName
   parameter of functions from a list of projects from the added TFS Account.
   You must call Set-VSTeamAccount before trying to use any function that relies
   on this dynamic parameter or you will get an error.
   This can only be used in Advanced Fucntion with the [CmdletBinding()] attribute.
   The function must also have a begin block that maps the value to a common variable
   like this.
      DynamicParam {
         # Generate and set the ValidateSet
         $arrSet = Get-VSTeamProjects | Select-Object -ExpandProperty Name
         _buildProjectNameDynamicParam -arrSet $arrSet
      }
      process {
         # Bind the parameter to a friendly variable
         $ProjectName = $PSBoundParameters[$ParameterName]
      }
   #>
}
function _buildDynamicParam {
   param(
      [string] $ParameterName = 'QueueName',
      [array] $arrSet,
      [bool] $Mandatory = $false,
      [string] $ParameterSetName,
      [int] $Position = -1,
      [type] $ParameterType = [string],
      [bool] $ValueFromPipelineByPropertyName = $true,
      [string] $AliasName,
      [string] $HelpMessage
   )
   # Create the collection of attributes
   $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
   # Create and set the parameters' attributes
   $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
   $ParameterAttribute.Mandatory = $Mandatory
   $ParameterAttribute.ValueFromPipelineByPropertyName = $ValueFromPipelineByPropertyName
   if ($Position -ne -1) {
      $ParameterAttribute.Position = $Position
   }
   if ($ParameterSetName) {
      $ParameterAttribute.ParameterSetName = $ParameterSetName
   }
   if ($HelpMessage) {
      $ParameterAttribute.HelpMessage = $HelpMessage
   }
   # Add the attributes to the attributes collection
   $AttributeCollection.Add($ParameterAttribute)
   if ($AliasName) {
      $AliasAttribute = New-Object System.Management.Automation.AliasAttribute(@($AliasName))
      $AttributeCollection.Add($AliasAttribute)
   }
   if ($arrSet) {
      # Generate and set the ValidateSet
      $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
      # Add the ValidateSet to the attributes collection
      $AttributeCollection.Add($ValidateSetAttribute)
   }
   # Create and return the dynamic parameter
   return New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, $ParameterType, $AttributeCollection)
}
function _convertSecureStringTo_PlainText {
   [CmdletBinding()]
   param(
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, HelpMessage = 'Secure String')]
      [securestring] $SecureString
   )
   # Convert the securestring to a normal string
   # this was the one technique that worked on Mac, Linux and Windows
   $credential = New-Object System.Management.Automation.PSCredential 'unknown', $SecureString
   return $credential.GetNetworkCredential().Password
}
# This is the main function for calling TFS and VSTS. It handels the auth and format of the route.
# If you need to call TFS or VSTS this is the function to use.
function _callAPI {
   param(
      [string]$resource,
      [string]$area,
      [string]$id,
      [string]$version,
      [string]$subDomain,
      [ValidateSet('Get', 'Post', 'Patch', 'Delete', 'Options', 'Put', 'Default', 'Head', 'Merge', 'Trace')]
      [string]$method,
      [Parameter(ValueFromPipeline = $true)]
      [object]$body,
      [string]$InFile,
      [string]$OutFile,
      [string]$ContentType,
      [string]$ProjectName,
      [string]$Url,
      [object]$QueryString
   )
   # If the caller did not provide a Url build it.
   if (-not $Url) {
      $buildUriParams = @{ } + $PSBoundParameters;
      $extra = 'method', 'body', 'InFile', 'OutFile', 'ContentType'
      foreach ($x in $extra) { $buildUriParams.Remove($x) | Out-Null }
      $Url = _buildRequestURI @buildUriParams
   }
   elseif ($QueryString) {
      # If the caller provided the URL and QueryString we need
      # to add the querystring now
      foreach ($key in $QueryString.keys) {
         $Url += _appendQueryString -name $key -value $QueryString[$key]
      }
   }
   if ($body) {
      Write-Verbose "Body $body"
   }
   $params = $PSBoundParameters
   $params.Add('Uri', $Url)
   $params.Add('UserAgent', (_getUserAgent))
   if (_useWindowsAuthenticationOnPremise) {
      $params.Add('UseDefaultCredentials', $true)
   }
   elseif (_useBearerToken) {
      $params.Add('Headers', @{Authorization = "Bearer $env:TEAM_TOKEN" })
   }
   else {
      $params.Add('Headers', @{Authorization = "Basic $env:TEAM_PAT" })
   }
   # We have to remove any extra parameters not used by Invoke-RestMethod
   $extra = 'Area', 'Resource', 'SubDomain', 'Id', 'Version', 'JSON', 'ProjectName', 'Url', 'QueryString'
   foreach ($e in $extra) { $params.Remove($e) | Out-Null }
   try {
      $resp = Invoke-RestMethod @params
      if ($resp) {
         Write-Verbose "return type: $($resp.gettype())"
         Write-Verbose $resp
      }
      return $resp
   }
   catch {
      _handleException $_
      throw
   }
}
function _trackProjectProgress {
   param(
      [Parameter(Mandatory = $true)] $Resp,
      [string] $Title,
      [string] $Msg
   )
   $i = 0
   $x = 1
   $y = 10
   $status = $resp.status
   # Track status
   while ($status -ne 'failed' -and $status -ne 'succeeded') {
      $status = (_callAPI -Url $resp.url).status
      # oscillate back a forth to show progress
      $i += $x
      Write-Progress -Activity $title -Status $msg -PercentComplete ($i / $y * 100)
      if ($i -eq $y -or $i -eq 0) {
         $x *= -1
      }
   }
}
$iTracking = 0
$xTracking = 1
$yTracking = 10
$statusTracking = $null
function _trackServiceEndpointProgress {
   param(
      [Parameter(Mandatory = $true)]
      [string] $projectName,
      [Parameter(Mandatory = $true)]
      $resp,
      [string] $title,
      [string] $msg
   )
   $iTracking = 0
   $xTracking = 1
   $yTracking = 10
   $isReady = $false
   # Track status
   while (-not $isReady) {
      $statusTracking = _callAPI -ProjectName $projectName -Area 'distributedtask' -Resource 'serviceendpoints' -Id $resp.id  `
         -Version $([VSTeamVersions]::DistributedTask)
      $isReady = $statusTracking.isReady;
      if (-not $isReady) {
         $state = $statusTracking.operationStatus.state
         if ($state -eq "Failed") {
            throw $statusTracking.operationStatus.statusMessage
         }
      }
      # oscillate back a forth to show progress
      $iTracking += $xTracking
      Write-Progress -Activity $title -Status $msg -PercentComplete ($iTracking / $yTracking * 100)
      if ($iTracking -eq $yTracking -or $iTracking -eq 0) {
         $xTracking *= -1
      }
   }
}
function _supportsServiceFabricEndpoint {
   if (-not [VSTeamVersions]::ServiceFabricEndpoint) {
      throw 'This account does not support Service Fabric endpoints.'
   }
}
function _getModuleVersion {
   # Read the version from the psd1 file.
   # $content = (Get-Content -Raw "./VSTeam.psd1" | Out-String)
   $content = (Get-Content -Raw "$here\VSTeam.psd1" | Out-String)
   $r = [regex]"ModuleVersion += +'([^']+)'"
   $d = $r.Match($content)
   return $d.Groups[1].Value
}
function _setEnvironmentVariables {
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
   param (
      [string] $Level = "Process",
      [string] $Pat,
      [string] $Acct,
      [string] $BearerToken,
      [string] $Version
   )
   # You always have to set at the process level or they will Not
   # be seen in your current session.
   $env:TEAM_PAT = $Pat
   $env:TEAM_ACCT = $Acct
   $env:TEAM_VERSION = $Version
   $env:TEAM_TOKEN = $BearerToken
   [VSTeamVersions]::Account = $Acct
   # This is so it can be loaded by default in the next session
   if ($Level -ne "Process") {
      [System.Environment]::SetEnvironmentVariable("TEAM_PAT", $Pat, $Level)
      [System.Environment]::SetEnvironmentVariable("TEAM_ACCT", $Acct, $Level)
      [System.Environment]::SetEnvironmentVariable("TEAM_VERSION", $Version, $Level)
   }
}
# If you remove an account the current default project needs to be cleared as well.
function _clearEnvironmentVariables {
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
   param (
      [string] $Level = "Process"
   )
   $env:TEAM_PROJECT = $null
   [VSTeamVersions]::DefaultProject = ''
   $Global:PSDefaultParameterValues.Remove("*:projectName")
   # This is so it can be loaded by default in the next session
   if ($Level -ne "Process") {
      [System.Environment]::SetEnvironmentVariable("TEAM_PROJECT", $null, $Level)
   }
   _setEnvironmentVariables -Level $Level -Pat '' -Acct '' -UseBearerToken '' -Version ''
}
function _convertToHex() {
   [cmdletbinding()]
   param(
      [parameter(Mandatory = $true)]
      [string]$Value
   )
   $bytes = $Value | Format-Hex -Encoding Unicode
   $hexString = ($bytes.Bytes | ForEach-Object ToString X2) -join ''
   return $hexString.ToLowerInvariant();
}
function _getVSTeamIdFromDescriptor {
   [cmdletbinding()]
   param(
      [parameter(Mandatory = $true)]
      [string]$Descriptor
   )
   $identifier = $Descriptor.Split('.')[1]
   # We need to Pad the string for FromBase64String to work reliably (AzD Descriptors are not padded)
   $ModulusValue = ($identifier.length % 4)
   Switch ($ModulusValue) {
      '0' { $Padded = $identifier }
      '1' { $Padded = $identifier.Substring(0, $identifier.Length - 1) }
      '2' { $Padded = $identifier + ('=' * (4 - $ModulusValue)) }
      '3' { $Padded = $identifier + ('=' * (4 - $ModulusValue)) }
   }
   return [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($Padded))
}
function _getDescriptorForACL {
   [cmdletbinding()]
   param(
      [parameter(Mandatory = $true, ParameterSetName = "ByUser")]
      [VSTeamUser]$User,
      [parameter(MAndatory = $true, ParameterSetName = "ByGroup")]
      [VSTeamGroup]$Group
   )
   if ($User) {
      switch ($User.Origin) {
         "vsts" {
            $sid = _getVSTeamIdFromDescriptor -Descriptor $User.Descriptor
            $descriptor = "Microsoft.TeamFoundation.Identity;$sid"
         }
         "aad" {
            $descriptor = "Microsoft.IdentityModel.Claims.ClaimsIdentity;$($User.Domain)\\$($User.PrincipalName)"
         }
         default { throw "User type not handled yet for ACL. Please report this as an issue on the VSTeam Repository: https://github.com/DarqueWarrior/vsteam/issues" }
      }
   }
   if ($Group) {
      switch ($Group.Origin) {
         "vsts" {
            $sid = _getVSTeamIdFromDescriptor -Descriptor $Group.Descriptor
            $descriptor = "Microsoft.TeamFoundation.Identity;$sid"
         }
         default { throw "Group type not handled yet for Add-VSTeamGitRepositoryPermission. Please report this as an issue on the VSTeam Repository: https://github.com/DarqueWarrior/vsteam/issues" }
      }
   }
   return $descriptor
}
function Add-VSTeam {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, Position = 1)]
      [Alias('TeamName')]
      [string]$Name,
      [string]$Description = ''
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = '{ "name": "' + $Name + '", "description": "' + $Description + '" }'
      # Call the REST API
      $resp = _callAPI -Area 'projects' -Resource "$ProjectName/teams" `
         -Method Post -ContentType 'application/json' -Body $body -Version $([VSTeamVersions]::Core)
      $team = [VSTeamTeam]::new($resp, $ProjectName)
      Write-Output $team
   }
}
function Add-VSTeamAccessControlEntry {
   [CmdletBinding(DefaultParameterSetName = 'ByNamespace')]
   param(
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true, ValueFromPipeline = $true)]
      [VSTeamSecurityNamespace] $SecurityNamespace,
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [ValidateScript({
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
      })]
      [string] $SecurityNamespaceId,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [string] $Token,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [string] $Descriptor,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [ValidateRange(0, [int]::MaxValue)]
      [int] $AllowMask,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [ValidateRange(0, [int]::MaxValue)]
      [int] $DenyMask
   )
   process {
      if ($SecurityNamespace)
      {
         $SecurityNamespaceId = $SecurityNamespace.ID
      }
$body =
@"
   {
      "token": "$Token",
      "merge": true,
      "accessControlEntries": [
         {
            "descriptor": "$Descriptor",
            "allow": $AllowMask,
            "deny": $DenyMask,
            "extendedinfo": {}
         }
      ]
   }
"@
      # Call the REST API
      $resp = _callAPI -Area 'accesscontrolentries' -id $SecurityNamespaceId -method POST -body $body `
         -Version $([VSTeamVersions]::Core) `
         -ContentType "application/json"
      if ($resp.count -ne 1)
      {
         throw "Expected 1 result, but got $($rep.count)"
      }
      # Storing the object before you return it cleaned up the pipeline.
      # When I just write the object from the constructor each property
      # seemed to be written
      $acl = [VSTeamAccessControlEntry]::new($resp.value)
      Write-Output $acl
   }
}
function Add-VSTeamAzureRMServiceEndpoint {
   [CmdletBinding(DefaultParameterSetName = 'Automatic')]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('displayName')]
      [string] $subscriptionName,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $subscriptionId,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $subscriptionTenantId,
      [Parameter(ParameterSetName = 'Manual', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $servicePrincipalId,
      [Parameter(ParameterSetName = 'Manual', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $servicePrincipalKey,
      [string] $endpointName
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if (-not $endpointName) {
         $endpointName = $subscriptionName
      }
      if (-not $servicePrincipalId) {
         $creationMode = 'Automatic'
      }
      else {
         $creationMode = 'Manual'
      }
      $obj = @{
         authorization = @{
            parameters = @{
               serviceprincipalid  = $servicePrincipalId
               serviceprincipalkey = $servicePrincipalKey
               tenantid            = $subscriptionTenantId
            }
            scheme     = 'ServicePrincipal'
         }
         data          = @{
            subscriptionId   = $subscriptionId
            subscriptionName = $subscriptionName
            creationMode     = $creationMode
         }
         url           = 'https://management.azure.com/'
      }
      return Add-VSTeamServiceEndpoint `
         -ProjectName $ProjectName `
         -endpointName $endpointName `
         -endpointType 'azurerm' `
         -object $obj
   }
}
function Add-VSTeamBuild {
   [CmdletBinding(DefaultParameterSetName = 'ByName')]
   param(
      [Parameter(ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [Int32] $BuildDefinitionId,
      [Parameter(Mandatory = $false)]
      [string] $SourceBranch,
      [Parameter(Mandatory = $false)]
      [hashtable] $BuildParameters
   )
   DynamicParam {
      $dp = _buildProjectNameDynamicParam
      # If they have not set the default project you can't find the
      # validateset so skip that check. However, we still need to give
      # the option to pass a QueueName to use.
      $queues = $null
      $queueArrSet = $null
      if ($Global:PSDefaultParameterValues["*:projectName"]) {
         $queues = Get-VSTeamQueue -ProjectName $Global:PSDefaultParameterValues["*:projectName"]
         $queueArrSet = $queues.name
      }
      else {
         Write-Verbose 'Call Set-VSTeamDefaultProject for Tab Complete of QueueName'
      }
      $ParameterName = 'QueueName'
      $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet $queueArrSet
      $dp.Add($ParameterName, $rp)
      $buildDefs = $null
      $buildDefsArrSet = $null
      if ($Global:PSDefaultParameterValues["*:projectName"]) {
         $buildDefs = Get-VSTeamBuildDefinition -ProjectName $Global:PSDefaultParameterValues["*:projectName"]
         $buildDefsArrSet = $buildDefs.name
      }
      else {
         Write-Verbose 'Call Set-VSTeamDefaultProject for Tab Complete of BuildDefinition'
      }
      $ParameterName = 'BuildDefinitionName'
      $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet $buildDefsArrSet -ParameterSetName 'ByName'
      $dp.Add($ParameterName, $rp)
      $dp
   }
   process {
      # Bind the parameter to a friendly variable
      $QueueName = $PSBoundParameters["QueueName"]
      $ProjectName = $PSBoundParameters["ProjectName"]
      $BuildDefinition = $PSBoundParameters["BuildDefinitionName"]
      if ($BuildDefinitionId) {
         $id = $BuildDefinitionId
      }
      else {
         # Find the BuildDefinition id from the name
         $id = Get-VSTeamBuildDefinition -ProjectName "$ProjectName" -Type All |
            Where-Object { $_.name -eq $BuildDefinition } |
            Select-Object -ExpandProperty id
      }
      $body = @{
         definition = @{
            id = $id
         };
      }
      if ($QueueName) {
         $queueId = Get-VSTeamQueue -ProjectName "$ProjectName" -queueName "$QueueName" |
            Select-Object -ExpandProperty Id
         $body.Add('queue', @{ id = $queueId })
      }
      if ($SourceBranch) {
         $body.Add('sourceBranch', $SourceBranch)
      }
      if ($BuildParameters) {
         $body.Add('parameters', ($BuildParameters | ConvertTo-Json -Compress))
      }
      # Call the REST API
      $resp = _callAPI -ProjectName $ProjectName -Area 'build' -Resource 'builds' `
         -Method Post -ContentType 'application/json' -Body ($body | ConvertTo-Json) `
         -Version $([VSTeamVersions]::Build)
      _applyTypesToBuild -item $resp
      return $resp
   }
}
function Add-VSTeamBuildDefinition {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $InFile
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $resp = _callAPI -Method Post -ProjectName $ProjectName -Area build -Resource definitions -Version $([VSTeamVersions]::Build) -infile $InFile -ContentType 'application/json'
      return $resp
   }
}
function Add-VSTeamBuildTag {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
      [string[]] $Tags,
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int[]] $Id,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Add-VSTeamBuildTag")) {
            foreach ($tag in $tags) {
               # Call the REST API
               _callAPI -ProjectName $projectName -Area 'build' -Resource "builds/$Id/tags" `
                  -Method Put -Querystring @{tag = $tag} -Version $([VSTeamVersions]::Build) | Out-Null
            }
         }
      }
   }
}
function Add-VSTeamExtension {
   param(
      [parameter(Mandatory = $true)]
      [string] $PublisherId,
      [parameter(Mandatory = $true)]
      [string] $ExtensionId,
      [parameter(Mandatory = $false)]
      [string] $Version
   )
   Process {
      $resource = "extensionmanagement/installedextensionsbyname/$PublisherId/$ExtensionId"
      if ($version) {
         $resource += '/' + $Version
      }
      $resp = _callAPI -Method Post -SubDomain 'extmgmt' -Resource $resource -Version $([VSTeamVersions]::ExtensionsManagement) -ContentType "application/json"
      $item = [VSTeamExtension]::new($resp)
      Write-Output $item
   }
}
function Add-VSTeamFeed {
   [CmdletBinding()]
   param (
      [Parameter(Position = 0, Mandatory = $true)]
      [string] $Name,
      [Parameter(Position = 1)]
      [string] $Description,
      [switch] $EnableUpstreamSources,
      [switch] $showDeletedPackageVersions
   )
   process {
      # Thi swill throw if this account does not support feeds
      _supportsFeeds
      $body = @{
         name                       = $Name
         description                = $Description
         hideDeletedPackageVersions = $true
      }
      if ($showDeletedPackageVersions.IsPresent) {
         $body.hideDeletedPackageVersions = $false
      }
      if ($EnableUpstreamSources.IsPresent) {
         $body.upstreamEnabled = $true
         $body.upstreamSources = @(
            @{
               id                 = [System.Guid]::NewGuid()
               name               = 'npmjs'
               protocol           = 'npm'
               location           = 'https://registry.npmjs.org/'
               upstreamSourceType = 1
            },
            @{
               id                 = [System.Guid]::NewGuid()
               name               = 'nuget.org'
               protocol           = 'nuget'
               location           = 'https://api.nuget.org/v3/index.json'
               upstreamSourceType = 1
            }
         )
      }
      $bodyAsJson = $body | ConvertTo-Json
      # Call the REST API
      $resp = _callAPI -subDomain feeds -Area packaging -Resource feeds `
         -Method Post -ContentType 'application/json' -body $bodyAsJson -Version $([VSTeamVersions]::Packaging)
      return [VSTeamFeed]::new($resp)
   }
}
function Add-VSTeamGitRepository {
   [CmdletBinding()]
   param(
      [parameter(Mandatory = $true)]
      [string] $Name
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = '{"name": "' + $Name + '"}'
      try {
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area 'git' -Resource 'repositories' `
            -Method Post -ContentType 'application/json' -Body $body -Version $([VSTeamVersions]::Git)
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $repo = [VSTeamGitRepository]::new($resp, $ProjectName)
         Write-Output $repo
      }
      catch {
         _handleException $_
      }
   }
}
function Add-VSTeamGitRepositoryPermission {
   [CmdletBinding(DefaultParameterSetName = 'ByProjectAndUser')]
   param(
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndDescriptor")]
      [VSTeamProject]$Project,
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndDescriptor")]
      [ValidateScript({
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
      })]
      [string]$RepositoryId,
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndDescriptor")]
      [string]$RepositoryName,
      [parameter(Mandatory=$false,ParameterSetName="ByRepositoryIdAndGroup")]
      [parameter(Mandatory=$false,ParameterSetName="ByRepositoryIdAndUser")]
      [parameter(Mandatory=$false,ParameterSetName="ByRepositoryNameAndGroup")]
      [parameter(Mandatory=$false,ParameterSetName="ByRepositoryNameAndUser")]
      [parameter(Mandatory=$false,ParameterSetName="ByRepositoryIdAndDescriptor")]
      [parameter(Mandatory=$false,ParameterSetName="ByRepositoryNameAndDescriptor")]
      [string]$BranchName,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndDescriptor")]
      [string]$Descriptor,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndGroup")]
      [VSTeamGroup]$Group,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndUser")]
      [VSTeamUser]$User,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndDescriptor")]
      [VSTeamGitRepositoryPermissions]$Allow,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByRepositoryNameAndDescriptor")]
      [VSTeamGitRepositoryPermissions]$Deny
   )
   process {
      # SecurityNamespaceID: 2e9eb7ed-3c0a-47d4-87c1-0ffdd275fd87
      # Token: repoV2/<projectId>" <-- Whole project
      # Token: repoV2/<projectId>/<repositoryId>"  <-- Whole repository
      # Token: repoV2/<projectId>/<repositoryId>/refs/heads/<branchName>" <-- Single branch
      $securityNamespaceId = "2e9eb7ed-3c0a-47d4-87c1-0ffdd275fd87"
      # Resolve Repository Name to ID
      if ($RepositoryName)
      {
         $repo = Get-VSTeamGitRepository -ProjectName $Project.Name -Name $RepositoryName
         if (!$repo)
         {
            throw "Repository not found"
         }
         $RepositoryId = $repo.ID
      }
       # Resolve Group to Descriptor
       if ($Group)
       {
          $Descriptor = _getDescriptorForACL -Group $Group
       }
       # Resolve User to Descriptor
       if ($User)
       {
          $Descriptor = _getDescriptorForACL -User $User
       }
      $token = "repoV2/$($Project.ID)"
      if ($RepositoryId)
      {
         $token += "/$($RepositoryId)"
      }
      if ($BranchName)
      {
         $branchHex = _convertToHex($BranchName)
         $token += "/refs/heads/$($branchHex)"
      }
      Add-VSTeamAccessControlEntry -SecurityNamespaceId $securityNamespaceId -Descriptor $Descriptor -Token $token -AllowMask ([int]$Allow) -DenyMask ([int]$Deny)
   }
}
function Add-VSTeamKubernetesEndpoint {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $endpointName,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $kubeconfig,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $kubernetesUrl,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $clientCertificateData,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $clientKeyData,
      [switch] $acceptUntrustedCerts,
      [switch] $generatePfx
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      # Process switch parameters
      $untrustedCerts = $false
      if ($acceptUntrustedCerts.IsPresent) {
         $untrustedCerts = $true
      }
      $pfx = $false
      if ($generatePfx.IsPresent) {
         $pfx = $true
      }
      $obj = @{
         authorization = @{
            parameters = @{
               clientCertificateData = $clientCertificateData
               clientKeyData         = $clientKeyData
               generatePfx           = $pfx
               kubeconfig            = $Kubeconfig
            };
            scheme     = 'None'
         };
         data          = @{
            acceptUntrustedCerts = $untrustedCerts
         };
         url           = $kubernetesUrl
      }
      return Add-VSTeamServiceEndpoint `
         -ProjectName $ProjectName `
         -endpointName $endpointName `
         -endpointType 'kubernetes' `
         -object $obj
   }
}
function Add-VSTeamMembership {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [string] $MemberDescriptor,
      [Parameter(Mandatory = $true)]
      [string] $ContainerDescriptor,
      [switch] $DontTest
   )
   process {
      return _callMembershipAPI -Id "$MemberDescriptor/$ContainerDescriptor" -Method Put
   }
}
function Add-VSTeamNuGetEndpoint {
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingPlainTextForPassword", "")]
   [CmdletBinding(DefaultParameterSetName = 'SecureApiKey')]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $EndpointName,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $NuGetUrl,
      [Parameter(ParameterSetName = 'ClearToken', Mandatory = $true, HelpMessage = 'Personal Access Token')]
      [string] $PersonalAccessToken,
      [Parameter(ParameterSetName = 'ClearApiKey', Mandatory = $true, HelpMessage = 'ApiKey')]
      [string] $ApiKey,
      [Parameter(ParameterSetName = 'SecurePassword', Mandatory = $true, HelpMessage = 'Username')]
      [string] $Username,
      [Parameter(ParameterSetName = 'SecureToken', Mandatory = $true, HelpMessage = 'Personal Access Token')]
      [securestring] $SecurePersonalAccessToken,
      [Parameter(ParameterSetName = 'SecureApiKey', Mandatory = $true, HelpMessage = 'ApiKey')]
      [securestring] $SecureApiKey,
      [Parameter(ParameterSetName = 'SecurePassword', Mandatory = $true, HelpMessage = 'Password')]
      [securestring] $SecurePassword
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      if ($PersonalAccessToken) {
         $Authentication = 'Token'
         $token = $PersonalAccessToken
      }
      elseif ($ApiKey) {
         $Authentication = 'ApiKey'
         $token = $ApiKey
      }
      elseif ($SecureApiKey) {
         $Authentication = 'ApiKey'
         $credential = New-Object System.Management.Automation.PSCredential "ApiKey", $SecureApiKey
         $token = $credential.GetNetworkCredential().Password
      }
      elseif ($SecurePassword) {
         $Authentication = 'UsernamePassword'
         $credential = New-Object System.Management.Automation.PSCredential "Password", $SecurePassword
         $token = $credential.GetNetworkCredential().Password
      }
      else {
         $Authentication = 'Token'
         $credential = New-Object System.Management.Automation.PSCredential "token", $securePersonalAccessToken
         $token = $credential.GetNetworkCredential().Password
      }
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters['ProjectName']
      $obj = @{
         data = @{}
         url  = $NuGetUrl
      }
      if ($Authentication -eq 'ApiKey') {
         $obj['authorization'] = @{
            parameters = @{
               nugetkey = $token
            }
            scheme     = 'None'
         }
      }
      elseif ($Authentication -eq 'Token') {
         $obj['authorization'] = @{
            parameters = @{
               apitoken = $token
            }
            scheme     = 'Token'
         }
      }
      else {
         $obj['authorization'] = @{
            parameters = @{
               username = $Username
               password = $token
            }
            scheme     = 'UsernamePassword'
         }
      }
      return Add-VSTeamServiceEndpoint `
         -ProjectName $ProjectName `
         -endpointName $endpointName `
         -endpointType 'externalnugetfeed' `
         -object $obj
   }
}
function Add-VSTeamPolicy {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [guid] $type,
      [switch] $enabled,
      [switch] $blocking,
      [Parameter(Mandatory = $true)]
      [hashtable] $settings
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $true
   }
   process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = @{
         isEnabled  = $enabled.IsPresent;
         isBlocking = $blocking.IsPresent;
         type       = @{
            id = $type
         };
         settings   = $settings
      } | ConvertTo-Json -Depth 10 -Compress
      try {
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area 'policy' -Resource 'configurations' `
            -Method Post -ContentType 'application/json' -Body $body -Version $([VSTeamVersions]::Git)
         Write-Output $resp
      }
      catch {
         _handleException $_
      }
   }
}
function Add-VSTeamProfile {
   [CmdletBinding(DefaultParameterSetName = 'Secure')]
   param(
      [parameter(ParameterSetName = 'Windows', Mandatory = $true, Position = 1)]
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, Position = 1)]
      [Parameter(ParameterSetName = 'Plain')]
      [string] $Account,
      [parameter(ParameterSetName = 'Plain', Mandatory = $true, Position = 2, HelpMessage = 'Personal Access Token')]
      [string] $PersonalAccessToken,
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, HelpMessage = 'Personal Access Token')]
      [securestring] $SecurePersonalAccessToken,
      [string] $Name,
      [ValidateSet('TFS2017', 'TFS2018', 'VSTS')]
      [string] $Version,
      [switch] $UseBearerToken
   )
   DynamicParam {
      # Only add these options on Windows Machines
      if (_isOnWindows) {
         # Create the dictionary
         $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
         $ParameterName2 = 'UseWindowsAuthentication'
         # Create the collection of attributes
         $AttributeCollection2 = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
         # Create and set the parameters' attributes
         $ParameterAttribute2 = New-Object System.Management.Automation.ParameterAttribute
         $ParameterAttribute2.Mandatory = $true
         $ParameterAttribute2.ParameterSetName = "Windows"
         $ParameterAttribute2.HelpMessage = "On Windows machines allows you to use the active user identity for authentication. Not available on other platforms."
         # Add the attributes to the attributes collection
         $AttributeCollection2.Add($ParameterAttribute2)
         # Create and return the dynamic parameter
         $RuntimeParameter2 = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName2, [switch], $AttributeCollection2)
         $RuntimeParameterDictionary.Add($ParameterName2, $RuntimeParameter2)
         return $RuntimeParameterDictionary
      }
   }
   process {
      if ($SecurePersonalAccessToken) {
         # Even when promoted for a Secure Personal Access Token you can just
         # press enter. This leads to an empty PAT so error below.
         # Convert the securestring to a normal string
         # this was the one technique that worked on Mac, Linux and Windows
         $_pat = _convertSecureStringTo_PlainText -SecureString $SecurePersonalAccessToken
      }
      else {
         $_pat = $PersonalAccessToken
      }
      if (_isOnWindows) {
         # Bind the parameter to a friendly variable
         $UsingWindowsAuth = $PSBoundParameters[$ParameterName2]
         if (!($_pat) -and !($UsingWindowsAuth)) {
            Write-Error 'Personal Access Token must be provided if you are not using Windows Authentication; please see the help.'
            return
         }
      }
      # If they only gave an account name add https://dev.azure.com
      if ($Account -notlike "*/*") {
         if (-not $Name) {
            $Name = $Account
         }
         $Account = "https://dev.azure.com/$($Account)"
      }
      # If they gave https://dev.azure.com extract Account and Profile name
      if ($Account -match "(?<protocol>https\://)?(?<domain>dev\.azure\.com/)(?<account>[A-Z0-9][-A-Z0-9]*[A-Z0-9])") {
         if (-not $Name) {
            $Name = $matches.account
         }
         $Account = "https://dev.azure.com/$($matches.account)"
      }
      # If they gave https://xxx.visualstudio.com extract Account and Profile name, convert to new URL
      if ($Account -match "(?<protocol>https?\://)?(?<account>[A-Z0-9][-A-Z0-9]*[A-Z0-9])(?<domain>\.visualstudio\.com)") {
         if (-not $Name) {
            $Name = $matches.account
         }
         $Account = "https://dev.azure.com/$($matches.account)"
      }
      if ($UseBearerToken.IsPresent) {
         $authType = 'Bearer'
         $token = $_pat
         $encodedPat = ''
      }
      else {
         $token = ''
         $authType = 'Pat'
         $encodedPat = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$_pat"))
      }
      # If no SecurePersonalAccessToken is entered, and on windows, are we using default credentials for REST calls
      if ((!$_pat) -and (_isOnWindows) -and ($UsingWindowsAuth)) {
         Write-Verbose 'Using Default Windows Credentials for authentication; no Personal Access Token required'
         $encodedPat = ''
         $token = ''
         $authType = 'OnPremise'
      }
      if (-not $Name) {
         $Name = $Account
      }
      # See if this item is already in there
      # I am testing URL because the user may provide a different
      # name and I don't want two with the same URL.
      # The @() forces even 1 item to an array
      $profiles = @(Get-VSTeamProfile | Where-Object URL -ne $Account)
      $newProfile = [PSCustomObject]@{
         Name    = $Name
         URL     = $Account
         Type    = $authType
         Pat     = $encodedPat
         Token   = $token
         Version = (_getVSTeamAPIVersion -Instance $Account -Version $Version)
      }
      $profiles += $newProfile
      $contents = ConvertTo-Json $profiles
      Set-Content -Path $profilesPath -Value $contents
   }
}
function Add-VSTeamProject {
   param(
      [parameter(Mandatory = $true)]
      [Alias('Name')]
      [string] $ProjectName,
      [string] $Description,
      [switch] $TFVC
   )
   DynamicParam {
      [VSTeamProcessCache]::timestamp = -1
      _buildProcessNameDynamicParam -ParameterName 'ProcessTemplate' -Mandatory $false
   }
   process {
      # Bind the parameter to a friendly variable
      $ProcessTemplate = $PSBoundParameters["ProcessTemplate"]
      if ($TFVC.IsPresent) {
         $srcCtrl = "Tfvc"
      }
      else {
         $srcCtrl = 'Git'
      }
      if ($ProcessTemplate) {
         Write-Verbose "Finding $ProcessTemplate id"
         $templateTypeId = (Get-VSTeamProcess -Name $ProcessTemplate).Id
      }
      else {
         # Default to Scrum Process Template
         $ProcessTemplate = 'Scrum'
         $templateTypeId = '6b724908-ef14-45cf-84f8-768b5384da45'
      }
      $body = '{"name": "' + $ProjectName + '", "description": "' + $Description + '", "capabilities": {"versioncontrol": { "sourceControlType": "' + $srcCtrl + '"}, "processTemplate":{"templateTypeId": "' + $templateTypeId + '"}}}'
      try {
         # Call the REST API
         $resp = _callAPI -Area 'projects' `
            -Method Post -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::Core)
         _trackProjectProgress -resp $resp -title 'Creating team project' -msg "Name: $($ProjectName), Template: $($processTemplate), Src: $($srcCtrl)"
         # Invalidate any cache of projects.
         [VSTeamProjectCache]::timestamp = -1
         return Get-VSTeamProject $ProjectName
      }
      catch {
         _handleException $_
      }
   }
}
function Add-VSTeamProjectPermission {
   [CmdletBinding(DefaultParameterSetName = 'ByProjectAndUser')]
   param(
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [VSTeamProject]$Project,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [string]$Descriptor,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [VSTeamGroup]$Group,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [VSTeamUser]$User,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [VSTeamProjectPermissions]$Allow,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndUser")]
      [VSTeamProjectPermissions]$Deny
   )
   process {
      # SecurityNamespaceID: 52d39943-cb85-4d7f-8fa8-c6baac873819
      # Token: $PROJECT:vstfs:///Classification/TeamProject/<projectId>
      $securityNamespaceId = "52d39943-cb85-4d7f-8fa8-c6baac873819"
      # Resolve Group to Descriptor
      if ($Group)
      {
         $Descriptor = _getDescriptorForACL -Group $Group
      }
      # Resolve User to Descriptor
      if ($User)
      {
         $Descriptor = _getDescriptorForACL -User $User
      }
      $token = "`$PROJECT:vstfs:///Classification/TeamProject/$($Project.ID)"
      Add-VSTeamAccessControlEntry -SecurityNamespaceId $securityNamespaceId -Descriptor $Descriptor -Token $token -AllowMask ([int]$Allow) -DenyMask ([int]$Deny)
   }
}
function Add-VSTeamRelease {
   [CmdletBinding(DefaultParameterSetName = 'ById', SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(ParameterSetName = 'ById', Mandatory = $true)]
      [int] $DefinitionId,
      [Parameter(Mandatory = $false)]
      [string] $Description,
      [Parameter(ParameterSetName = 'ById', Mandatory = $true)]
      [string] $ArtifactAlias,
      [Parameter()]
      [string] $Name,
      [Parameter(ParameterSetName = 'ById', Mandatory = $true)]
      [string] $BuildId,
      [Parameter()]
      [string] $SourceBranch,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      $dp = _buildProjectNameDynamicParam
      # If they have not set the default project you can't find the
      # validateset so skip that check. However, we still need to give
      # the option to pass by name.
      if ($Global:PSDefaultParameterValues["*:projectName"]) {
         $defs = Get-VSTeamReleaseDefinition -ProjectName $Global:PSDefaultParameterValues["*:projectName"] -expand artifacts
         $arrSet = $defs.name
      }
      else {
         Write-Verbose 'Call Set-VSTeamDefaultProject for Tab Complete of DefinitionName'
         $defs = $null
         $arrSet = $null
      }
      $ParameterName = 'DefinitionName'
      $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet $arrSet -ParameterSetName 'ByName' -Mandatory $true
      $dp.Add($ParameterName, $rp)
      if ($Global:PSDefaultParameterValues["*:projectName"]) {
         $builds = Get-VSTeamBuild -ProjectName $Global:PSDefaultParameterValues["*:projectName"]
         $arrSet = $builds.name
      }
      else {
         Write-Verbose 'Call Set-VSTeamDefaultProject for Tab Complete of BuildName'
         $builds = $null
         $arrSet = $null
      }
      $ParameterName = 'BuildNumber'
      $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet $arrSet -ParameterSetName 'ByName' -Mandatory $true
      $dp.Add($ParameterName, $rp)
      $dp
   }
   process {
      Write-Debug 'Add-VSTeamRelease Process'
      # Bind the parameter to a friendly variable
      $BuildNumber = $PSBoundParameters["BuildNumber"]
      $ProjectName = $PSBoundParameters["ProjectName"]
      $DefinitionName = $PSBoundParameters["DefinitionName"]
      #Write-Verbose $builds
      if ($builds -and -not $buildId) {
         $buildId = $builds | Where-Object {$_.name -eq $BuildNumber} | Select-Object -ExpandProperty id
      }
      if ($defs -and -not $artifactAlias) {
         $def = $defs | Where-Object {$_.name -eq $DefinitionName}
         $DefinitionId = $def | Select-Object -ExpandProperty id
         $artifactAlias = $def.artifacts[0].alias
      }
      $body = '{"definitionId": ' + $DefinitionId + ', "description": "' + $description + '", "artifacts": [{"alias": "' + $artifactAlias + '", "instanceReference": {"id": "' + $buildId + '", "name": "' + $Name + '", "sourceBranch": "' + $SourceBranch + '"}}]}'
      Write-Verbose $body
      # Call the REST API
      if ($force -or $pscmdlet.ShouldProcess($description, "Add Release")) {
         try {
            Write-Debug 'Add-VSTeamRelease Call the REST API'
            $resp = _callAPI -SubDomain 'vsrm' -ProjectName $ProjectName -Area 'release' -Resource 'releases' `
               -Method Post -ContentType 'application/json' -Body $body -Version $([VSTeamVersions]::Release)
            _applyTypesToRelease $resp
            Write-Output $resp
         }
         catch {
            _handleException $_
         }
      }
   }
}
function Add-VSTeamReleaseDefinition {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $inFile
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      Write-Debug 'Add-VSTeamReleaseDefinition Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $resp = _callAPI -Method Post -subDomain vsrm -Area release -Resource definitions -ProjectName $ProjectName `
         -Version $([VSTeamVersions]::Release) -inFile $inFile -ContentType 'application/json'
      Write-Output $resp
   }
}
function Add-VSTeamServiceEndpoint {
   [CmdletBinding(DefaultParameterSetName = 'Secure')]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $endpointName,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $endpointType,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [hashtable] $object
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $object['name'] = $endpointName
      $object['type'] = $endpointType
      $body = $object | ConvertTo-Json
      # Call the REST API
      $resp = _callAPI -ProjectName $projectName -Area 'distributedtask' -Resource 'serviceendpoints'  `
         -Method Post -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::DistributedTask)
      _trackServiceEndpointProgress -projectName $projectName -resp $resp -title 'Creating Service Endpoint' -msg "Creating $endpointName"
      return Get-VSTeamServiceEndpoint -ProjectName $ProjectName -id $resp.id
   }
}
function Add-VSTeamServiceFabricEndpoint {
   [CmdletBinding(DefaultParameterSetName = 'Certificate')]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('displayName')]
      [string] $endpointName,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $url,
      [parameter(ParameterSetName = 'Certificate', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $certificate,
      [Parameter(ParameterSetName = 'Certificate', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [securestring] $certificatePassword,
      [parameter(ParameterSetName = 'Certificate', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [parameter(ParameterSetName = 'AzureAd', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $serverCertThumbprint,
      [Parameter(ParameterSetName = 'AzureAd', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $username,
      [Parameter(ParameterSetName = 'AzureAd', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [securestring] $password,
      [Parameter(ParameterSetName = 'None', Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
      [string] $clusterSpn,
      [Parameter(ParameterSetName = 'None', Mandatory = $false, ValueFromPipelineByPropertyName = $true)]
      [bool] $useWindowsSecurity
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # This will throw if this account does not support ServiceFabricEndpoint
      _supportsServiceFabricEndpoint
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      switch ($PSCmdlet.ParameterSetName) {
         "Certificate" {
            # copied securestring usage from Set-VSTeamAccount
            # while we don't actually have a username here, PSCredential requires that a non empty string is provided
            $credential = New-Object System.Management.Automation.PSCredential $serverCertThumbprint, $certificatePassword
            $certPass = $credential.GetNetworkCredential().Password
            $authorization = @{
               parameters = @{
                  certificate          = $certificate
                  certificatepassword  = $certPass
                  servercertthumbprint = $serverCertThumbprint
               }
               scheme     = 'Certificate'
            }
         }
         "AzureAd" {
            # copied securestring usage from Set-VSTeamAccount
            $credential = New-Object System.Management.Automation.PSCredential $username, $password
            $pass = $credential.GetNetworkCredential().Password
            $authorization = @{
               parameters = @{
                  password             = $pass
                  servercertthumbprint = $serverCertThumbprint
                  username             = $username
               }
               scheme     = 'UsernamePassword'
            }
         }
         Default {
            $authorization = @{
               parameters = @{
                  ClusterSpn         = $clusterSpn
                  UseWindowsSecurity = $useWindowsSecurity
               }
               scheme     = 'None'
            }
         }
      }
      $obj = @{
         authorization = $authorization
         data          = @{}
         url           = $url
      }
      return Add-VSTeamServiceEndpoint `
         -ProjectName $ProjectName `
         -endpointName $endpointName `
         -endpointType 'servicefabric' `
         -object $obj
   }
}
function Add-VSTeamSonarQubeEndpoint {
   [CmdletBinding(DefaultParameterSetName = 'Secure')]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $endpointName,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $sonarqubeUrl,
      [parameter(ParameterSetName = 'Plain', Mandatory = $true, Position = 2, HelpMessage = 'Personal Access Token')]
      [string] $personalAccessToken,
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, HelpMessage = 'Personal Access Token')]
      [securestring] $securePersonalAccessToken
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      if ($personalAccessToken) {
         $token = $personalAccessToken
      }
      else {
         $credential = New-Object System.Management.Automation.PSCredential "nologin", $securePersonalAccessToken
         $token = $credential.GetNetworkCredential().Password
      }
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters['ProjectName']
      $obj = @{
         authorization = @{
            parameters = @{
               username = $token;
               password = ''
            };
            scheme     = 'UsernamePassword'
         };
         data          = @{};
         url           = $sonarqubeUrl
      }
      try {
         return Add-VSTeamServiceEndpoint `
            -ProjectName $ProjectName `
            -endpointName $endpointName `
            -endpointType 'sonarqube' `
            -object $obj
      }
      catch [System.Net.WebException] {
         if ($_.Exception.status -eq 'ProtocolError') {
            $errorDetails = ConvertFrom-Json $_.ErrorDetails
            $message = $errorDetails.message
            # The error message is different on TFS and VSTS
            if ($message.StartsWith("Endpoint type couldn't be recognized 'sonarqube'") -or
               $message.StartsWith("Unable to find service endpoint type 'sonarqube'")) {
               Write-Error -Message 'The Sonarqube extension not installed. Please install from https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarqube'
               return
            }
         }
         throw
      }
   }
}
function Add-VSTeamUserEntitlement {
   [CmdletBinding()]
   param(
       [Parameter(Mandatory = $true)]
       [Alias('UserEmail')]
       [string]$Email,
       [ValidateSet('Advanced', 'EarlyAdopter', 'Express', 'None', 'Professional', 'StakeHolder')]
       [string]$License = 'EarlyAdopter',
       [ValidateSet('Custom', 'ProjectAdministrator', 'ProjectContributor', 'ProjectReader', 'ProjectStakeholder')]
       [string]$Group = 'ProjectContributor'
   )
   DynamicParam {
       _buildProjectNameDynamicParam -Mandatory $false
   }
   process {
       # Thi swill throw if this account does not support MemberEntitlementManagement
       _supportsMemberEntitlementManagement
       # Bind the parameter to a friendly variable
       $ProjectName = $PSBoundParameters["ProjectName"]
       $obj = @{
           accessLevel         = @{
               accountLicenseType = $License
           }
           user                = @{
               principalName = $email
               subjectKind   = 'user'
           }
           projectEntitlements = @{
               group      = @{
                   groupType = $Group
               }
               projectRef = @{
                   id = $ProjectName
               }
           }
       }
       $body = $obj | ConvertTo-Json
       # Call the REST API
       _callAPI  -Method Post -Body $body -SubDomain 'vsaex' -Resource 'userentitlements' -Version $([VSTeamVersions]::MemberEntitlementManagement) -ContentType "application/json"
   }
}
function Add-VSTeamVariableGroup {
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Name,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Description,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [hashtable] $Variables
   )
   DynamicParam {
      $dp = _buildProjectNameDynamicParam
      if ([VSTeamVersions]::Version -ne "TFS2017") {
         $ParameterName = 'Type'
         $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet ('Vsts', 'AzureKeyVault') -Mandatory $true
         $dp.Add($ParameterName, $rp)
         $ParameterName = 'ProviderData'
         $rp = _buildDynamicParam -ParameterName $ParameterName -Mandatory $false -ParameterType ([hashtable])
         $dp.Add($ParameterName, $rp)
      }
      return $dp
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = @{
         name        = $Name
         description = $Description
         variables   = $Variables
      }
      if ([VSTeamVersions]::Version -ne "TFS2017") {
         $Type = $PSBoundParameters['Type']
         $body.Add("type", $Type)
         $ProviderData = $PSBoundParameters['ProviderData']
         if ($null -ne $ProviderData) {
            $body.Add("providerData", $ProviderData)
         }
      }
      $body = $body | ConvertTo-Json
      # Call the REST API
      $resp = _callAPI -ProjectName $projectName -Area 'distributedtask' -Resource 'variablegroups'  `
         -Method Post -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::VariableGroups)
      return Get-VSTeamVariableGroup -ProjectName $ProjectName -id $resp.id
   }
}
function Add-VSTeamWorkItem {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true)]
      [string]$Title,
      [Parameter(Mandatory = $false)]
      [string]$Description,
      [Parameter(Mandatory = $false)]
      [string]$IterationPath,
      [Parameter(Mandatory = $false)]
      [string]$AssignedTo,
      [Parameter(Mandatory = $false)]
      [int]$ParentId,
      [Parameter(Mandatory = $false)]
      [hashtable]$AdditionalFields
   )
   DynamicParam {
      $dp = _buildProjectNameDynamicParam -mandatory $true
      # If they have not set the default project you can't find the
      # validateset so skip that check. However, we still need to give
      # the option to pass a WorkItemType to use.
      if ($Global:PSDefaultParameterValues["*:projectName"]) {
         $wittypes = _getWorkItemTypes -ProjectName $Global:PSDefaultParameterValues["*:projectName"]
         $arrSet = $wittypes
      }
      else {
         Write-Verbose 'Call Set-VSTeamDefaultProject for Tab Complete of WorkItemType'
         $wittypes = $null
         $arrSet = $null
      }
      $ParameterName = 'WorkItemType'
      $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet $arrSet -Mandatory $true
      $dp.Add($ParameterName, $rp)
      $dp
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      # The type has to start with a $
      $WorkItemType = "`$$($PSBoundParameters["WorkItemType"])"
      # Constructing the contents to be send.
      # Empty parameters will be skipped when converting to json.
      [Array]$body = @(
         @{
            op    = "add"
            path  = "/fields/System.Title"
            value = $Title
         }
         @{
            op    = "add"
            path  = "/fields/System.Description"
            value = $Description
         }
         @{
            op    = "add"
            path  = "/fields/System.IterationPath"
            value = $IterationPath
         }
         @{
            op    = "add"
            path  = "/fields/System.AssignedTo"
            value = $AssignedTo
         }) | Where-Object { $_.value }
      if ($ParentId) {
         $parentUri = _buildRequestURI -ProjectName $ProjectName -Area 'wit' -Resource 'workitems' -id $ParentId
         $body += @{
            op    = "add"
            path  = "/relations/-"
            value = @{
               "rel" = "System.LinkTypes.Hierarchy-Reverse"
               "url" = $parentURI
            }
         }
      }
      #this loop must always come after the main work item fields defined in the function parameters
      if ($AdditionalFields) {
         foreach ($fieldName in $AdditionalFields.Keys) {
            #check that main properties are not added into the additional fields hashtable
            $foundFields = $body | Where-Object { $null -ne $_ -and $_.path -like "*$fieldName" }
            if ($null -ne $foundFields) {
               throw "Found duplicate field '$fieldName' in parameter AdditionalFields, which is already a parameter. Please remove it."
            }
            else {
               $body += @{
                  op    = "add"
                  path  = "/fields/$fieldName"
                  value = $AdditionalFields[$fieldName]
               }
            }
         }
      }
      # It is very important that even if the user only provides
      # a single value above that the item is an array and not
      # a single object or the call will fail.
      # You must call ConvertTo-Json passing in the value and not
      # not using pipeline.
      # https://stackoverflow.com/questions/18662967/convertto-json-an-array-with-a-single-item
      $json = ConvertTo-Json @($body) -Compress
      # Call the REST API
      $resp = _callAPI -ProjectName $ProjectName -Area 'wit' -Resource 'workitems' `
         -Version $([VSTeamVersions]::Core) -id $WorkItemType -Method Post `
         -ContentType 'application/json-patch+json' -Body $json
      _applyTypesToWorkItem -item $resp
      return $resp
   }
}
function Add-VSTeamWorkItemAreaPermission {
   [CmdletBinding(DefaultParameterSetName = 'ByProjectAndAreaIdAndUser')]
   param(
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndGroup")]
      [VSTeamProject]$Project,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndUser")]
      [int]$AreaID,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndGroup")]
      [string]$AreaPath,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndDescriptor")]
      [string]$Descriptor,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndGroup")]
      [VSTeamGroup]$Group,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndUser")]
      [VSTeamUser]$User,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndGroup")]
      [VSTeamWorkItemAreaPermissions]$Allow,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndAreaPathAndGroup")]
      [VSTeamWorkItemAreaPermissions]$Deny
   )
   process {
      # SecurityID: 83e28ad4-2d72-4ceb-97b0-c7726d5502c3
      # Token: vstfs:///Classification/Node/862eb45f-3873-41d7-89c8-4b2f8802eaa9 (https://dev.azure.com/<organization>/<project>/_apis/wit/classificationNodes/Areas)
      # "token": "vstfs:///Classification/Node/ae76de05-8b53-4e02-9205-e73e2012585e:vstfs:///Classification/Node/f8c5b667-91dd-4fe7-bf23-3138c439d07e",
      $securityNamespaceId = "83e28ad4-2d72-4ceb-97b0-c7726d5502c3"
      if ($AreaID)
      {
         $area = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -Ids $AreaID
      }
      if ($AreaPath)
      {
         $area = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -Path $AreaPath -StructureGroup "areas"
      }
      if (-not $area)
      {
         throw "Area not found"
      }
      if ($area.StructureType -ne "area")
      {
         throw "This is not an Area"
      }
      $nodes = @()
      $nodes += $area
      while ($area.ParentUrl)
      {
         $path = $area.ParentUrl -ireplace ".*(classificationNodes/Areas)\/?"
         if ($path.length -gt 0)
         {
            # We have a Path to resolve
            $area = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -Path $path -StructureGroup "Areas"
         } else {
            # We need to get the "root" node now
            $area = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -StructureGroup "Areas"
         }
         $nodes += $area
      }
      # Build Token from Path
      [array]::Reverse($nodes)
      $token = ($nodes | ForEach-Object { "vstfs:///Classification/Node/$($_.Identifier)" })  -join ":"
      # Resolve Group to Descriptor
      if ($Group)
      {
         $Descriptor = _getDescriptorForACL -Group $Group
      }
      # Resolve User to Descriptor
      if ($User)
      {
         $Descriptor = _getDescriptorForACL -User $User
      }
      Add-VSTeamAccessControlEntry -SecurityNamespaceId $securityNamespaceId -Descriptor $Descriptor -Token $token -AllowMask ([int]$Allow) -DenyMask ([int]$Deny)
   }
}
function Add-VSTeamWorkItemIterationPermission {
   [CmdletBinding(DefaultParameterSetName = 'ByProjectAndIterationIdAndUser')]
   param(
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndGroup")]
      [VSTeamProject]$Project,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndUser")]
      [int]$IterationID,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndGroup")]
      [string]$IterationPath,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndDescriptor")]
      [string]$Descriptor,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndGroup")]
      [VSTeamGroup]$Group,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndUser")]
      [VSTeamUser]$User,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndGroup")]
      [VSTeamWorkItemIterationPermissions]$Allow,
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndGroup")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationIdAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndDescriptor")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndUser")]
      [parameter(Mandatory=$true,ParameterSetName="ByProjectAndIterationPathAndGroup")]
      [VSTeamWorkItemIterationPermissions]$Deny
   )
   process {
      # SecurityID: bf7bfa03-b2b7-47db-8113-fa2e002cc5b1
      # Token: vstfs:///Classification/Node/862eb45f-3873-41d7-89c8-4b2f8802eaa9 (https://dev.azure.com/<organization>/<project>/_apis/wit/classificationNodes/Iterations)
      # "token": "vstfs:///Classification/Node/ae76de05-8b53-4e02-9205-e73e2012585e:vstfs:///Classification/Node/f8c5b667-91dd-4fe7-bf23-3138c439d07e",
      $securityNamespaceId = "bf7bfa03-b2b7-47db-8113-fa2e002cc5b1"
      if ($IterationID)
      {
         $iteration = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -Ids $IterationID
      }
      if ($IterationPath)
      {
         $iteration = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -Path $IterationPath -StructureGroup "iterations"
      }
      if (-not $iteration)
      {
         throw "Iteration not found"
      }
      if ($iteration.StructureType -ne "iteration")
      {
         throw "This is not an Iteration"
      }
      $nodes = @()
      $nodes += $iteration
      while ($iteration.ParentUrl)
      {
         $path = $iteration.ParentUrl -ireplace ".*(classificationNodes/Iterations)\/?"
         if ($path.length -gt 0)
         {
            # We have a Path to resolve
            $iteration = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -Path $path -StructureGroup "Iterations"
         } else {
            # We need to get the "root" node now
            $iteration = Get-VSTeamClassificationNode -ProjectName $Project.Name -Depth 0 -StructureGroup "Iterations"
         }
         $nodes += $iteration
      }
      # Build Token from Path
      [array]::Reverse($nodes)
      $token = ($nodes | ForEach-Object { "vstfs:///Classification/Node/$($_.Identifier)" })  -join ":"
      # Resolve Group to Descriptor
      if ($Group)
      {
         $Descriptor = _getDescriptorForACL -Group $Group
      }
      # Resolve User to Descriptor
      if ($User)
      {
         $Descriptor = _getDescriptorForACL -User $User
      }
      Add-VSTeamAccessControlEntry -SecurityNamespaceId $securityNamespaceId -Descriptor $Descriptor -Token $token -AllowMask ([int]$Allow) -DenyMask ([int]$Deny)
   }
}
function Clear-VSTeamDefaultProject {
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
   [CmdletBinding()]
   param()
   DynamicParam {
      # # Only add these options on Windows Machines
      if (_isOnWindows) {
         $ParameterName = 'Level'
         # Create the dictionary
         $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
         # Create the collection of attributes
         $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
         # Create and set the parameters' attributes
         $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
         $ParameterAttribute.Mandatory = $false
         $ParameterAttribute.HelpMessage = "On Windows machines allows you to store the default project at the process, user or machine level. Not available on other platforms."
         # Add the attributes to the attributes collection
         $AttributeCollection.Add($ParameterAttribute)
         # Generate and set the ValidateSet
         if (_testAdministrator) {
            $arrSet = "Process", "User", "Machine"
         }
         else {
            $arrSet = "Process", "User"
         }
         $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
         # Add the ValidateSet to the attributes collection
         $AttributeCollection.Add($ValidateSetAttribute)
         # Create and return the dynamic parameter
         $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
         $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
         return $RuntimeParameterDictionary
      }
   }
   begin {
      if (_isOnWindows) {
         # Bind the parameter to a friendly variable
         $Level = $PSBoundParameters[$ParameterName]
      }
   }
   process {
      if (_isOnWindows) {
         if (-not $Level) {
            $Level = "Process"
         }
      }
      else {
         $Level = "Process"
      }
      # You always have to set at the process level or they will Not
      # be seen in your current session.
      $env:TEAM_PROJECT = $null
      if (_isOnWindows) {
         [System.Environment]::SetEnvironmentVariable("TEAM_PROJECT", $null, $Level)
      }
      [VSTeamVersions]::DefaultProject = ''
      $Global:PSDefaultParameterValues.Remove("*:projectName")
      Write-Output "Removed default project"
   }
}
function Disable-VSTeamAgent {
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int] $PoolId,
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 1)]
      [Alias('AgentID')]
      [int[]] $Id
   )
   process {
      foreach ($item in $Id) {
         try {
            _callAPI -Method Patch -Area "distributedtask/pools/$PoolId" -Resource agents -Id $item -Version $([VSTeamVersions]::DistributedTask) -ContentType "application/json" -Body "{'enabled':false,'id':$item}" | Out-Null
            Write-Output "Disabled agent $item"
         }
         catch {
            _handleException $_
         }
      }
   }
}
function Enable-VSTeamAgent {
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int] $PoolId,
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 1)]
      [Alias('AgentID')]
      [int[]] $Id
   )
   process {
      foreach ($item in $Id) {
         try {
            _callAPI -Method Patch -Area "distributedtask/pools/$PoolId" -Resource agents -Id $item -Version $([VSTeamVersions]::DistributedTask) -ContentType "application/json" -Body "{'enabled':true,'id':$item}" | Out-Null
            Write-Output "Enabled agent $item"
         }
         catch {
            _handleException $_
         }
      }
   }
}
function Get-VSTeam {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param (
      [Parameter(ParameterSetName = 'List')]
      [int] $Top,
      [Parameter(ParameterSetName = 'List')]
      [int] $Skip,
      [Parameter(ParameterSetName = 'ByID')]
      [Alias('TeamId')]
      [string[]] $Id,
      [Parameter(ParameterSetName = 'ByName')]
      [Alias('TeamName')]
      [string[]] $Name
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Id) {
         foreach ($item in $Id) {
            # Call the REST API
            $resp = _callAPI -Area 'projects' -Resource "$ProjectName/teams" -id $item `
               -Version $([VSTeamVersions]::Core)
            $team = [VSTeamTeam]::new($resp, $ProjectName)
            Write-Output $team
         }
      }
      elseif ($Name) {
         foreach ($item in $Name) {
            # Call the REST API
            $resp = _callAPI -Area 'projects' -Resource "$ProjectName/teams" -id $item `
               -Version $([VSTeamVersions]::Core)
            $team = [VSTeamTeam]::new($resp, $ProjectName)
            Write-Output $team
         }
      }
      else {
         # Call the REST API
         $resp = _callAPI -Area 'projects' -Resource "$ProjectName/teams" `
            -Version $([VSTeamVersions]::Core) `
            -QueryString @{
            '$top'  = $top
            '$skip' = $skip
         }
         $obj = @()
         # Create an instance for each one
         foreach ($item in $resp.value) {
            $obj += [VSTeamTeam]::new($item, $ProjectName)
         }
         Write-Output $obj
      }
   }
}
function Get-VSTeamAccessControlList {
   [CmdletBinding(DefaultParameterSetName = 'ByNamespace')]
   param(
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true, ValueFromPipeline = $true)]
      [VSTeamSecurityNamespace] $SecurityNamespace,
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('ID')]
      [ValidateScript({
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
      })]
      [string] $SecurityNamespaceId,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $false)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $false)]
      [string] $Token,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $false)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $false)]
      [string[]] $Descriptors,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $false)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $false)]
      [switch] $IncludeExtendedInfo,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $false)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $false)]
      [switch] $Recurse
   )
   process {
      if ($SecurityNamespace)
      {
         $SecurityNamespaceId = $SecurityNamespace.ID
      }
      $queryString = @{}
      if ($Token)
      {
         $queryString.token = $Token
      }
      if ($Descriptors -and $Descriptors.Length -gt 0)
      {
         $queryString.descriptors = $Descriptors -join ","
      }
      if ($IncludeExtendedInfo.IsPresent)
      {
         $queryString.includeExtendedInfo = $true
      }
      if ($Recurse.IsPresent) {
         $queryString.recurse = $true
      }
      # Call the REST API
      $resp = _callAPI -Area 'accesscontrollists' -id $SecurityNamespaceId -method GET `
         -Version $([VSTeamVersions]::Core) `
         -QueryString $queryString
      try {
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamAccessControlList]::new($item)
         }
         Write-Output $objs
      }
      catch {
         # I catch because using -ErrorAction Stop on the Invoke-RestMethod
         # was still running the foreach after and reporting useless errors.
         # This casuses the first error to terminate this execution.
         _handleException $_
      }
   }
}
function Get-VSTeamAgent {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int] $PoolId,
      [Parameter(ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipelineByPropertyName = $true, Position = 1)]
      [Alias('AgentID')]
      [int] $Id
   )
   process {
      if ($id) {
         $resp = _callAPI -Area "distributedtask/pools/$PoolId" -Resource agents -Id $id `
            -Body @{includeCapabilities = 'true'} -Version $([VSTeamVersions]::DistributedTask)
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $item = [VSTeamAgent]::new($resp, $PoolId)
         Write-Output $item
      }
      else {
         $resp = _callAPI -Area "distributedtask/pools/$PoolId" -Resource agents `
            -Body @{includeCapabilities = 'true'} -Version $([VSTeamVersions]::DistributedTask)
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamAgent]::new($item, $PoolId)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamAPIVersion {
   [CmdletBinding()]
   [OutputType([System.Collections.Hashtable])]
   param()
   return @{
      Version                     = $([VSTeamVersions]::Version)
      Build                       = $([VSTeamVersions]::Build)
      Release                     = $([VSTeamVersions]::Release)
      Core                        = $([VSTeamVersions]::Core)
      Git                         = $([VSTeamVersions]::Git)
      DistributedTask             = $([VSTeamVersions]::DistributedTask)
      VariableGroups              = $([VSTeamVersions]::VariableGroups)
      Tfvc                        = $([VSTeamVersions]::Tfvc)
      Packaging                   = $([VSTeamVersions]::Packaging)
      MemberEntitlementManagement = $([VSTeamVersions]::MemberEntitlementManagement)
      ExtensionsManagement        = $([VSTeamVersions]::ExtensionsManagement)
      ServiceFabricEndpoint       = $([VSTeamVersions]::ServiceFabricEndpoint)
      Graph                       = $([VSTeamVersions]::Graph)
   }
}
function Get-VSTeamApproval {
   [CmdletBinding()]
   param(
      [ValidateSet('Approved', 'ReAssigned', 'Rejected', 'Canceled', 'Pending', 'Rejected', 'Skipped', 'Undefined')]
      [string] $StatusFilter,
      [Alias('ReleaseIdFilter')]
      [int[]] $ReleaseIdsFilter,
      [string] $AssignedToFilter
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      try {
         # Build query string and determine if the includeMyGroupApprovals should be added.
         $queryString = @{statusFilter = $StatusFilter; assignedtoFilter = $AssignedToFilter; releaseIdsFilter = ($ReleaseIdsFilter -join ',')}
         # The support in TFS and VSTS are not the same.
         $instance = $([VSTeamVersions]::Account)
         if (_isVSTS $instance) {
            if ([string]::IsNullOrEmpty($AssignedToFilter) -eq $false) {
               $queryString.includeMyGroupApprovals = 'true';
            }
         }
         else {
            # For TFS all three parameters must be set before you can add
            # includeMyGroupApprovals.
            if ([string]::IsNullOrEmpty($AssignedToFilter) -eq $false -and
                [string]::IsNullOrEmpty($ReleaseIdsFilter) -eq $false -and
               $StatusFilter -eq 'Pending') {
               $queryString.includeMyGroupApprovals = 'true';
            }
         }
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area release -Resource approvals -SubDomain vsrm -Version $([VSTeamVersions]::Release) -QueryString $queryString
         # Apply a Type Name so we can use custom format view and custom type extensions
         foreach ($item in $resp.value) {
            _applyTypesToApproval -item $item
         }
         Write-Output $resp.value
      }
      catch {
         _handleException $_
      }
   }
}
function Get-VSTeamBuild {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param (
      [Parameter(ParameterSetName = 'List')]
      [int] $Top,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('succeeded', 'partiallySucceeded', 'failed', 'canceled')]
      [string] $ResultFilter,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('manual', 'individualCI', 'batchedCI', 'schedule', 'userCreated', 'validateShelveset', 'checkInShelveset', 'triggered', 'all')]
      [string] $ReasonFilter,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('inProgress', 'completed', 'cancelling', 'postponed', 'notStarted', 'all')]
      [string] $StatusFilter,
      [Parameter(ParameterSetName = 'List')]
      [int[]] $Queues,
      [Parameter(ParameterSetName = 'List')]
      [int[]] $Definitions,
      [Parameter(ParameterSetName = 'List')]
      [string] $BuildNumber,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('build', 'xaml')]
      [string] $Type,
      [Parameter(ParameterSetName = 'List')]
      [int] $MaxBuildsPerDefinition,
      [Parameter(ParameterSetName = 'List')]
      [string[]] $Properties,
      [Parameter(ParameterSetName = 'ByID', ValueFromPipeline = $true)]
      [Alias('BuildID')]
      [int[]] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      try {
         if ($id) {
            foreach ($item in $id) {
               # Build the url to return the single build
               $resp = _callAPI -ProjectName $projectName -Area 'build' -Resource 'builds' -id $item `
                  -Version $([VSTeamVersions]::Build)
               _applyTypesToBuild -item $resp
               Write-Output $resp
            }
         }
         else {
            # Build the url to list the builds
            $resp = _callAPI -ProjectName $projectName -Area 'build' -Resource 'builds' `
               -Version $([VSTeamVersions]::Build) `
               -Querystring @{
               '$top'                   = $top
               'type'                   = $type
               'buildNumber'            = $buildNumber
               'resultFilter'           = $resultFilter
               'statusFilter'           = $statusFilter
               'reasonFilter'           = $reasonFilter
               'maxBuildsPerDefinition' = $maxBuildsPerDefinition
               'queues'                 = ($queues -join ',')
               'properties'             = ($properties -join ',')
               'definitions'            = ($definitions -join ',')
            }
            # Apply a Type Name so we can use custom format view and custom type extensions
            foreach ($item in $resp.value) {
               _applyTypesToBuild -item $item
            }
            Write-Output $resp.value
         }
      }
      catch {
         _handleException $_
      }
   }
}
function Get-VSTeamBuildArtifact {
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      $resp = _callAPI -ProjectName $projectName -Area 'build' -Resource "builds/$Id/artifacts" `
         -Version $([VSTeamVersions]::Build)
      foreach ($item in $resp.value) {
         _applyArtifactTypes -item $item
      }
      Write-Output $resp.value
   }
}
function Get-VSTeamBuildDefinition {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [string] $Filter,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('build', 'xaml', 'All')]
      [string] $Type = 'All',
      [Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'ByIdRaw')]
      [Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'ByIdJson')]
      [Parameter(Position = 0, ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildDefinitionID')]
      [int[]] $Id,
      [Parameter(ParameterSetName = 'ByIdRaw')]
      [Parameter(ParameterSetName = 'ByIdJson')]
      [Parameter(ParameterSetName = 'ByID')]
      [int] $Revision,
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdJson')]
      [switch]$JSON,
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdRaw')]
      [switch]$raw
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         foreach ($item in $id) {
            $resp = _callAPI -ProjectName $ProjectName -Id $item -Area build -Resource definitions -Version $([VSTeamVersions]::Build) `
               -QueryString @{revision = $revision }
            if ($JSON.IsPresent) {
               $resp | ConvertTo-Json -Depth 99
            }
            else {
               if (-not $raw.IsPresent) {
                  $item = [VSTeamBuildDefinition]::new($resp, $ProjectName)
                  Write-Output $item
               }
               else {
                  Write-Output $resp
               }
            }
         }
      }
      else {
         $resp = _callAPI -ProjectName $ProjectName -Area build -Resource definitions -Version $([VSTeamVersions]::Build) `
            -QueryString @{type = $type; name = $filter; includeAllProperties = $true }
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamBuildDefinition]::new($item, $ProjectName)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamBuildLog {
   [CmdletBinding(DefaultParameterSetName = 'ByID')]
   param (
      [Parameter(Mandatory = $true, ParameterSetName = 'ByID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int[]] $Id,
      [int] $Index
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if (-not $Index) {
            # Build the url to return the logs of the build
            # Call the REST API to get the number of logs for the build
            $resp = _callAPI -ProjectName $projectName -Area 'build' -Resource "builds/$item/logs" `
               -Version $([VSTeamVersions]::Build)
            $fullLogIndex = $($resp.count - 1)
         }
         else {
            $fullLogIndex = $Index
         }
         # Now call REST API with the index for the fullLog
         # Build the url to return the single build
         # Call the REST API to get the number of logs for the build
         $resp = _callAPI -ProjectName $projectName -Area 'build' -Resource "builds/$item/logs" -id $fullLogIndex `
            -Version $([VSTeamVersions]::Build)
         Write-Output $resp
      }
   }
}
function Get-VSTeamBuildTag {
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      # Call the REST API
      $resp = _callAPI -ProjectName $projectName -Area 'build' -Resource "builds/$Id/tags" `
         -Version $([VSTeamVersions]::Build)
      return $resp.value
   }
}
function Get-VSTeamClassificationNode {
   [CmdletBinding(DefaultParameterSetName = 'ByIds')]
   param(
      [ValidateSet("areas", "iterations")]
      [Parameter(Mandatory = $true, ParameterSetName="ByPath")]
      [string] $StructureGroup,
      [Parameter(Mandatory = $false, ParameterSetName="ByPath")]
      [string] $Path,
      [Parameter(Mandatory = $false, ParameterSetName="ByIds")]
      [int[]] $Ids,
      [Parameter(Mandatory = $false, ParameterSetName="ByPath")]
      [Parameter(Mandatory = $false, ParameterSetName="ByIds")]
      [int] $Depth
   )
   DynamicParam {
      _buildProjectNameDynamicParam -Mandatory $true
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $id = $StructureGroup
      $Path = [uri]::UnescapeDataString($Path)
      if ($Path)
      {
         $Path = [uri]::EscapeUriString($Path)
         $Path = $Path.TrimStart("/")
         $id += "/$Path"
      }
      $queryString = @{}
      if ($Depth)
      {
         $queryString.Add("`$Depth", $Depth)
      }
      if ($Ids)
      {
         $queryString.Add("Ids", $Ids -join ",")
      }
      if ($queryString.Count -gt 0)
      {
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area 'wit' -Resource "classificationnodes" -id $id `
         -Version $([VSTeamVersions]::Core) `
         -QueryString $queryString
      } else {
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area 'wit' -Resource "classificationnodes" -id $id `
         -Version $([VSTeamVersions]::Core) `
      }
      if ([bool]($resp.PSobject.Properties.name -match "value"))
      {
         try {
            $objs = @()
            foreach ($item in $resp.value) {
               $objs += [VSTeamClassificationNode]::new($item, $ProjectName)
            }
            Write-Output $objs
         }
         catch {
            # I catch because using -ErrorAction Stop on the Invoke-RestMethod
            # was still running the foreach after and reporting useless errors.
            # This casuses the first error to terminate this execution.
            _handleException $_
         }
      } else {
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $classificationNode = [VSTeamClassificationNode]::new($resp, $ProjectName)
         Write-Output $classificationNode
      }
   }
}
function Get-VSTeamCloudSubscription {
   [CmdletBinding()]
   param()
   # Call the REST API
   $resp = _callAPI -Area 'distributedtask' -Resource 'serviceendpointproxy/azurermsubscriptions' `
      -Version $([VSTeamVersions]::DistributedTask)
   # Apply a Type Name so we can use custom format view and custom type extensions
   foreach ($item in $resp.value) {
      _applyTypesToAzureSubscription -item $item
   }
   Write-Output $resp.value
}
function Get-VSTeamDescriptor {
   [CmdletBinding(DefaultParameterSetName = 'ByStorageKey')]
   param(
      [Parameter(ParameterSetName = 'ByStorageKey', Mandatory = $true)]
      [string] $StorageKey
   )
   process {
      # This will throw if this account does not support the graph API
      _supportsGraph
      # Call the REST API
      $resp = _callAPI -Area 'graph' -Resource 'descriptors' -id $StorageKey `
         -Version $([VSTeamVersions]::Graph) `
         -SubDomain 'vssps'
      # Storing the object before you return it cleaned up the pipeline.
      # When I just write the object from the constructor each property
      # seemed to be written
      $descriptor = [VSTeamDescriptor]::new($resp)
      Write-Output $descriptor
   }
}
function Get-VSTeamExtension {
   param (
      [Parameter(ParameterSetName = 'List', Mandatory = $false)]
      [switch] $IncludeInstallationIssues,
      [Parameter(ParameterSetName = 'List', Mandatory = $false)]
      [switch] $IncludeDisabledExtensions,
      [Parameter(ParameterSetName = 'List', Mandatory = $false)]
      [switch] $IncludeErrors,
      [Parameter(ParameterSetName = 'GetById', Mandatory = $true)]
      [string] $PublisherId,
      [Parameter(ParameterSetName = 'GetById', Mandatory = $true)]
      [string] $ExtensionId
   )
   Process {
      if ($PublisherId -and $ExtensionId) {
         $resource = "extensionmanagement/installedextensionsbyname/$PublisherId/$ExtensionId"
         $resp = _callAPI -SubDomain 'extmgmt' -Resource $resource -Version $([VSTeamVersions]::ExtensionsManagement)
         $item = [VSTeamExtension]::new($resp)
         Write-Output $item
      }
      else {
         $queryString = @{}
         if ($IncludeInstallationIssues.IsPresent) {
            $queryString.includeCapabilities = $true
         }
         if ($IncludeDisabledExtensions.IsPresent) {
            $queryString.includeDisabledExtensions = $true
         }
         if ($IncludeErrors.IsPresent) {
            $queryString.includeErrors = $true
         }
         $resp = _callAPI -SubDomain 'extmgmt' -Resource 'extensionmanagement/installedextensions' -QueryString $queryString -Version $([VSTeamVersions]::ExtensionsManagement)
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamExtension]::new($item)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamFeed {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param (
      [Parameter(ParameterSetName = 'ByID', Position = 0)]
      [Alias('FeedId')]
      [string[]] $Id
   )
   process {
      # Thi swill throw if this account does not support feeds
      _supportsFeeds
      if ($id) {
         foreach ($item in $id) {
            $resp = _callAPI -subDomain feeds -Id $item -Area packaging -Resource feeds -Version $([VSTeamVersions]::Packaging)
            Write-Verbose $resp
            $item = [VSTeamFeed]::new($resp)
            Write-Output $item
         }
      }
      else {
         $resp = _callAPI -subDomain feeds -Area packaging -Resource feeds -Version $([VSTeamVersions]::Packaging)
         $objs = @()
         foreach ($item in $resp.value) {
            Write-Verbose $item
            $objs += [VSTeamFeed]::new($item)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamGitRef {
   [CmdletBinding()]
   param (
      [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
      [Alias('Id')]
      [guid] $RepositoryID
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      try {
         $resp = _callAPI -ProjectName $ProjectName -Id "$RepositoryID/refs" -Area git -Resource repositories -Version $([VSTeamVersions]::Git)
         $obj = @()
         foreach ($item in $resp.value) {
            $obj += [VSTeamRef]::new($item, $ProjectName)
         }
         Write-Output $obj
      }
      catch {
         throw $_
      }
   }
}
function Get-VSTeamGitRepository {
   [CmdletBinding(DefaultParameterSetName = 'ByID')]
   param (
      [Parameter(ParameterSetName = 'ByID', ValueFromPipeline = $true)]
      [Alias('RepositoryID')]
      [guid[]] $Id,
      [Parameter(ParameterSetName = 'ByName', ValueFromPipeline = $true)]
      [string[]] $Name
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $false
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         foreach ($item in $id) {
            try {
               $resp = _callAPI -ProjectName $ProjectName -Id $item -Area git -Resource repositories -Version $([VSTeamVersions]::Git)
               # Storing the object before you return it cleaned up the pipeline.
               # When I just write the object from the constructor each property
               # seemed to be written
               $item = [VSTeamGitRepository]::new($resp, $ProjectName)
               Write-Output $item
            }
            catch {
               throw $_
            }
         }
      }
      elseif ($Name) {
         foreach ($item in $Name) {
            try {
               $resp = _callAPI -ProjectName $ProjectName -Id $item -Area git -Resource repositories -Version $([VSTeamVersions]::Git)
               # Storing the object before you return it cleaned up the pipeline.
               # When I just write the object from the constructor each property
               # seemed to be written
               $item = [VSTeamGitRepository]::new($resp, $ProjectName)
               Write-Output $item
            }
            catch {
               throw $_
            }
         }
      }
      else {
         if($ProjectName) {
            $resp = _callAPI -ProjectName $ProjectName -Area git -Resource repositories -Version $([VSTeamVersions]::Git)
         } else {
            $resp = _callAPI -Area git -Resource repositories -Version $([VSTeamVersions]::Git)
         }
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamGitRepository]::new($item, $ProjectName)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamGroup {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [Parameter(ParameterSetName = 'ListByProjectName')]
      [ValidateSet('vssgp','aadgp')]
      [string[]] $SubjectTypes,
      [Parameter(ParameterSetName = 'List')]
      [string] $ScopeDescriptor,
      [Parameter(ParameterSetName = 'ByGroupDescriptor', Mandatory = $true)]
      [Alias('GroupDescriptor')]
      [string] $Descriptor
   )
   DynamicParam {
      # Get-VSTeamGroup should never use cache
      [VSTeamProjectCache]::timestamp = -1
      _buildProjectNameDynamicParam -ParameterSetName 'ListByProjectName' -ParameterName 'ProjectName'
   }
   process {
      # This will throw if this account does not support the graph API
      _supportsGraph
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Descriptor) {
         # Call the REST API
         $resp = _callAPI -Area 'graph' -Resource 'groups' -id $Descriptor `
            -Version $([VSTeamVersions]::Graph) `
            -SubDomain 'vssps'
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $group = [VSTeamGroup]::new($resp)
         Write-Output $group
      }
      else {
         if ($ProjectName) {
            $project = Get-VSTeamProject -Name $ProjectName
            $ScopeDescriptor = Get-VSTeamDescriptor -StorageKey $project.id | Select-Object -ExpandProperty Descriptor
         }
         $queryString = @{}
         if ($ScopeDescriptor) {
            $queryString.scopeDescriptor = $ScopeDescriptor
         }
         if ($SubjectTypes -and $SubjectTypes.Length -gt 0)
         {
            $queryString.subjectTypes = $SubjectTypes -join ','
         }
         try {
            # Call the REST API
            $resp = _callAPI -Area 'graph' -id 'groups' `
               -Version $([VSTeamVersions]::Graph) `
               -QueryString $queryString `
               -SubDomain 'vssps'
            $objs = @()
            foreach ($item in $resp.value) {
               $objs += [VSTeamGroup]::new($item)
            }
            Write-Output $objs
         }
         catch {
            # I catch because using -ErrorAction Stop on the Invoke-RestMethod
            # was still running the foreach after and reporting useless errors.
            # This casuses the first error to terminate this execution.
            _handleException $_
         }
      }
   }
}
function Get-VSTeamInfo {
   return @{
      Account        = [VSTeamVersions]::Account
      Version        = [VSTeamVersions]::Version
      ModuleVersion  = [VSTeamVersions]::ModuleVersion
      DefaultProject = $Global:PSDefaultParameterValues['*:projectName']
   }
}
function Get-VSTeamJobRequest {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
      [int] $PoolId,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true, Position = 1)]
      [Alias('ID')]
      [int] $AgentID,
      [int] $completedRequestCount
   )
   process {
      if ($null -ne $completedRequestCount) {
         $body = @{
            agentid               = $AgentID
            completedRequestCount = $completedRequestCount
         }
      }
      else {
         $body = @{agentid = $AgentID}
      }
      $resp = _callAPI -Area "distributedtask/pools/$PoolId" -Resource "jobrequests" `
         -QueryString $body -Version $([VSTeamVersions]::DistributedTask)
      $objs = @()
      foreach ($item in $resp.value) {
         $objs += [VSTeamJobRequest]::new($item)
      }
      Write-Output $objs
   }
}
function Get-VSTeamMember {
   [CmdletBinding()]
   param (
      [Parameter()]
      [int] $Top,
      [Parameter()]
      [int] $Skip,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('Name')]
      [Alias('Id')]
      [string] $TeamId
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $resp = _callAPI -Id "$TeamId/members" -Area 'projects' -Resource "$ProjectName/teams" -Version $([VSTeamVersions]::Core) `
         -QueryString @{'$top' = $top; '$skip' = $skip}
      # Apply a Type Name so we can use custom format view and custom type extensions
      foreach ($item in $resp.value) {
         _applyTypesToTeamMember -item $item -team $TeamId -ProjectName $ProjectName
      }
      Write-Output $resp.value
   }
}
function Get-VSTeamMembership {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline, ValueFromPipelineByPropertyName,ParameterSetName="ByContainerId")]
      [string] $ContainerDescriptor,
      [Parameter(Mandatory = $true, ValueFromPipeline, ValueFromPipelineByPropertyName,ParameterSetName="ByMemberId")]
      [string] $MemberDescriptor
   )
   process {
      if ($MemberDescriptor) {
         return _callMembershipAPI -Id $MemberDescriptor -Method Get -Direction Up
      } else {
         return _callMembershipAPI -Id $ContainerDescriptor -Method Get -Direction Down
      }
   }
}
function Get-VSTeamOption {
   [CmdletBinding()]
   param([string] $subDomain)
   # Build the url to list the projects
   $params = @{"Method" = "Options"}
   if ($subDomain) {
      $params.Add("SubDomain", $subDomain)
   }
   # Call the REST API
   $resp = _callAPI @params
   # Apply a Type Name so we can use custom format view and custom type extensions
   foreach ($item in $resp.value) {
      _applyTypes -item $item -type 'Team.Option'
   }
   Write-Output $resp.value
}
function Get-VSTeamPolicy {
   [CmdletBinding()]
   param (
      [Parameter(ValueFromPipeline = $true)]
      [int[]] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $true
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         foreach ($item in $id) {
            try {
               $resp = _callAPI -ProjectName $ProjectName -Id $item -Area policy -Resource configurations -Version $([VSTeamVersions]::Git)
               _applyTypesToPolicy -item $resp
               Write-Output $resp
            }
            catch {
               throw $_
            }
         }
      }
      else {
         try {
            $resp = _callAPI -ProjectName $ProjectName -Area policy -Resource configurations -Version $([VSTeamVersions]::Git)
            # Apply a Type Name so we can use custom format view and custom type extensions
            foreach ($item in $resp.value) {
               _applyTypesToPolicy -item $item
            }
            Write-Output $resp.value
         }
         catch {
            throw $_
         }
      }
   }
}
function Get-VSTeamPolicyType {
   [CmdletBinding()]
   param (
      [Parameter(ValueFromPipeline = $true)]
      [guid[]] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $true
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         foreach ($item in $id) {
            try {
               $resp = _callAPI -ProjectName $ProjectName -Id $item -Area policy -Resource types -Version $([VSTeamVersions]::Git)
               _applyTypesToPolicyType -item $resp
               Write-Output $resp
            }
            catch {
               throw $_
            }
         }
      }
      else {
         try {
            $resp = _callAPI -ProjectName $ProjectName -Area policy -Resource types -Version $([VSTeamVersions]::Git)
            # Apply a Type Name so we can use custom format view and custom type extensions
            foreach ($item in $resp.value) {
               _applyTypesToPolicyType -item $item
            }
            Write-Output $resp.value
         }
         catch {
            throw $_
         }
      }
   }
}
function Get-VSTeamPool {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipelineByPropertyName = $true, Position = 1)]
      [Alias('PoolID')]
      [int] $Id
   )
   process {
      if ($id) {
         $resp = _callAPI -Area distributedtask -Resource pools -Id $id -Version $([VSTeamVersions]::DistributedTask)
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $item = [VSTeamPool]::new($resp)
         Write-Output $item
      }
      else {
         $resp = _callAPI -Area distributedtask -Resource pools -Version $([VSTeamVersions]::DistributedTask)
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamPool]::new($item)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamProcess {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [int] $Top = 100,
      [Parameter(ParameterSetName = 'List')]
      [int] $Skip = 0,
      [Parameter(ParameterSetName = 'ByID')]
      [Alias('ProcessTemplateID')]
      [string] $Id
   )
   DynamicParam {
      [VSTeamProcessCache]::timestamp = -1
      _buildProcessNameDynamicParam -ParameterSetName 'ByName' -ParameterName 'Name'
   }
   process {
      # Bind the parameter to a friendly variable
      $ProcessName = $PSBoundParameters["Name"]
      if ($id) {
         $queryString = @{}
         # Call the REST API
         $resp = _callAPI -Area 'process/processes' -id $id `
            -Version $([VSTeamVersions]::Core) `
            -QueryString $queryString
         $project = [VSTeamProcess]::new($resp)
         Write-Output $project
      }
      elseif ($ProcessName) {
         # Lookup Process ID by Name
         Get-VSTeamProcess | where-object {$_.name -eq $ProcessName}
      }
      else {
         # Return list of processes
         try {
            # Call the REST API
            $resp = _callAPI -Area 'process/processes' `
               -Version $([VSTeamVersions]::Core) `
               -QueryString @{
               '$top'  = $top
               '$skip' = $skip
            }
            $objs = @()
            foreach ($item in $resp.value) {
               $objs += [VSTeamProcess]::new($item)
            }
            Write-Output $objs
         }
         catch {
            # I catch because using -ErrorAction Stop on the Invoke-RestMethod
            # was still running the foreach after and reporting useless errors.
            # This casuses the first error to terminate this execution.
            _handleException $_
         }
      }
   }
}
function Get-VSTeamProfile {
   [CmdletBinding()]
   param(
      # Name is an array so I can pass an array after -Name
      # I can also use pipe
      [parameter(Mandatory = $false, Position = 1, ValueFromPipelineByPropertyName = $true)]
      [string] $Name
   )
   process {
      if (Test-Path $profilesPath) {
         try {
            # We needed to add ForEach-Object to unroll and show the inner type
            $result = Get-Content $profilesPath | ConvertFrom-Json
            # convert old URL in profile to new URL
            if ($result) {
               $result | ForEach-Object {
                  if ($_.URL -match "(?<protocol>https?\://)?(?<account>[A-Z0-9][-A-Z0-9]*[A-Z0-9])(?<domain>\.visualstudio\.com)") {
                     $_.URL = "https://dev.azure.com/$($matches.account)"
                  }
               }
            }
            if ($Name) {
               $result = $result | Where-Object Name -eq $Name
            }
            if ($result) {
               $result | ForEach-Object {
                  # Setting the type lets me format it
                  $_.PSObject.TypeNames.Insert(0, 'Team.Profile')
                  if ($_.PSObject.Properties.Match('Token').count -eq 0) {
                     # This is a profile that was created before the module supported
                     # bearer tokens. The rest of the module expects there to be a Token
                     # property.  Add one with a value of ''
                     $_ | Add-Member NoteProperty 'Token' ''
                  }
                  $_
               }
            }
         }
         catch {
            # Catch any error and fail to the return empty array below
            Write-Error "Error ready Profiles file. Use Add-VSTeamProfile to generate new file."
         }
      }
   }
}
function Get-VSTeamProject {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('WellFormed', 'CreatePending', 'Deleting', 'New', 'All')]
      [string] $StateFilter = 'WellFormed',
      [Parameter(ParameterSetName = 'List')]
      [int] $Top = 100,
      [Parameter(ParameterSetName = 'List')]
      [int] $Skip = 0,
      [Parameter(ParameterSetName = 'ByID')]
      [Alias('ProjectID')]
      [string] $Id,
      [switch] $IncludeCapabilities
   )
   DynamicParam {
      # Get-VSTeamProject should never use cache
      [VSTeamProjectCache]::timestamp = -1
      _buildProjectNameDynamicParam -ParameterSetName 'ByName' -ParameterName 'Name'
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["Name"]
      if ($id) {
         $ProjectName = $id
      }
      if ($ProjectName) {
         $queryString = @{}
         if ($includeCapabilities.IsPresent) {
            $queryString.includeCapabilities = $true
         }
         # Call the REST API
         $resp = _callAPI -Area 'projects' -id $ProjectName `
            -Version $([VSTeamVersions]::Core) `
            -QueryString $queryString
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $project = [VSTeamProject]::new($resp)
         Write-Output $project
      }
      else {
         try {
            # Call the REST API
            $resp = _callAPI -Area 'projects' `
               -Version $([VSTeamVersions]::Core) `
               -QueryString @{
               stateFilter = $stateFilter
               '$top'      = $top
               '$skip'     = $skip
            }
            $objs = @()
            foreach ($item in $resp.value) {
               $objs += [VSTeamProject]::new($item)
            }
            Write-Output $objs
         }
         catch {
            # I catch because using -ErrorAction Stop on the Invoke-RestMethod
            # was still running the foreach after and reporting useless errors.
            # This casuses the first error to terminate this execution.
            _handleException $_
         }
      }
   }
}
function Get-VSTeamPullRequest {
   [CmdletBinding()]
   param (
       [Alias('PullRequestId')]
       [string] $Id
   )
   DynamicParam {
       _buildProjectNameDynamicParam -mandatory $false
   }
   Process {
       # Bind the parameter to a friendly variable
       $ProjectName = $PSBoundParameters["ProjectName"]
       try {
           if ($ProjectName) {
               $resp = _callAPI -ProjectName $ProjectName -Area git -Resource pullRequests -Version $([VSTeamVersions]::Git) -Id $Id
           }
           else {
               $resp = _callAPI -Area git -Resource pullRequests -Version $([VSTeamVersions]::Git) -Id $Id
           }
           if ($resp.PSobject.Properties.Name -contains "value") {
               $pullRequests = $resp.value
           }
           else {
               $pullRequests = $resp
           }
           foreach ($respItem in $pullRequests) {
               _applyTypesToPullRequests -item $respItem
           }
           Write-Output $pullRequests
       }
       catch {
           _handleException $_
       }
   }
}
function Get-VSTeamQueue {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [string] $queueName,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('None', 'Manage', 'Use')]
      [string] $actionFilter,
      [Parameter(ParameterSetName = 'ByID')]
      [Alias('QueueID')]
      [string] $id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         $resp = _callAPI -ProjectName $ProjectName -Id $id -Area distributedtask -Resource queues `
            -Version $([VSTeamVersions]::DistributedTask)
         $item = [VSTeamQueue]::new($resp, $ProjectName)
         Write-Output $item
      }
      else {
         $resp = _callAPI -ProjectName $projectName -Area distributedtask -Resource queues `
            -QueryString @{ queueName = $queueName; actionFilter = $actionFilter } -Version $([VSTeamVersions]::DistributedTask)
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamQueue]::new($item, $ProjectName)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamRelease {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [ValidateSet('environments', 'artifacts', 'approvals', 'none')]
      [string] $expand,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('Draft', 'Active', 'Abandoned')]
      [string] $statusFilter,
      [Parameter(ParameterSetName = 'List')]
      [int] $definitionId,
      [Parameter(ParameterSetName = 'List')]
      [int] $top,
      [Parameter(ParameterSetName = 'List')]
      [string] $createdBy,
      [Parameter(ParameterSetName = 'List')]
      [DateTime] $minCreatedTime,
      [Parameter(ParameterSetName = 'List')]
      [DateTime] $maxCreatedTime,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('ascending', 'descending')]
      [string] $queryOrder,
      [Parameter(ParameterSetName = 'List')]
      [string] $continuationToken,
      [Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'ByIdRaw')]
      [Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'ByIdJson')]
      [Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [Alias('ReleaseID')]
      [int[]] $id,
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdJson')]
      [switch]$JSON,
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdRaw')]
      [switch]$raw
   )
   DynamicParam {
      _buildProjectNameDynamicParam -Mandatory $false -Position 1
   }
   process {
      Write-Debug 'Get-VSTeamRelease Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         foreach ($item in $id) {
            $resp = _callAPI -SubDomain vsrm -ProjectName $ProjectName -Area release -id $item -Resource releases -Version $([VSTeamVersions]::Release)
            if ($JSON.IsPresent) {
               $resp | ConvertTo-Json -Depth 99
            }
            else {
               if (-not $raw.IsPresent) {
                  # Apply a Type Name so we can use custom format view and custom type extensions
                  _applyTypesToRelease -item $resp
               }
               Write-Output $resp
            }
         }
      }
      else {
         if ($ProjectName) {
            $listurl = _buildRequestURI -SubDomain vsrm -ProjectName $ProjectName -Area release -Resource releases -Version $([VSTeamVersions]::Release)
         }
         else {
            $listurl = _buildRequestURI -SubDomain vsrm -Area release -Resource releases -Version $([VSTeamVersions]::Release)
         }
         $QueryString = @{
            '$top'              = $top
            '$expand'           = $expand
            'createdBy'         = $createdBy
            'queryOrder'        = $queryOrder
            'statusFilter'      = $statusFilter
            'definitionId'      = $definitionId
            'minCreatedTime'    = $minCreatedTime
            'maxCreatedTime'    = $maxCreatedTime
            'continuationToken' = $continuationToken
         }
         # Call the REST API
         $resp = _callAPI -url $listurl -QueryString $QueryString
         # Apply a Type Name so we can use custom format view and custom type extensions
         foreach ($item in $resp.value) {
            _applyTypesToRelease -item $item
         }
         Write-Output $resp.value
      }
   }
}
function Get-VSTeamReleaseDefinition {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('environments', 'artifacts', 'none')]
      [string] $Expand = 'none',
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdRaw', ValueFromPipelineByPropertyName = $true)]
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdJson', ValueFromPipelineByPropertyName = $true)]
      [Parameter(Mandatory = $true, ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [Alias('ReleaseDefinitionID')]
      [int[]] $Id,
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdJson')]
      [switch]$JSON,
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdRaw')]
      [switch]$raw
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      Write-Debug 'Get-VSTeamReleaseDefinition Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         foreach ($item in $id) {
            $resp = _callAPI -subDomain vsrm -Area release -resource definitions -Version $([VSTeamVersions]::Release) -projectName $projectName -id $item
            if ($JSON.IsPresent) {
               $resp | ConvertTo-Json -Depth 99
            }
            else {
               if (-not $raw.IsPresent) {
                  $item = [VSTeamReleaseDefinition]::new($resp, $ProjectName)
                  Write-Output $item
               }
               else {
                  Write-Output $resp
               }
            }
         }
      }
      else {
         $listurl = _buildRequestURI -subDomain vsrm -Area release -resource 'definitions' -Version $([VSTeamVersions]::Release) -projectName $ProjectName
         if ($expand -ne 'none') {
            $listurl += "&`$expand=$($expand)"
         }
         # Call the REST API
         $resp = _callAPI -url $listurl
         $objs = @()
         foreach ($item in $resp.value) {
            $objs += [VSTeamReleaseDefinition]::new($item, $ProjectName)
         }
         Write-Output $objs
      }
   }
}
function Get-VSTeamResourceArea {
   [CmdletBinding()]
   param()
   # Call the REST API
   $resp = _callAPI -Resource 'resourceareas'
   # Apply a Type Name so we can use custom format view and custom type extensions
   foreach ($item in $resp.value) {
      _applyTypes -item $item -type 'Team.ResourceArea'
   }
   Write-Output $resp.value
}
function Get-VSTeamSecurityNamespace {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'ByNamespaceName', Mandatory = $true)]
      [string] $Name,
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [ValidateScript({
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
      })]
      [string] $Id,
      [Parameter(ParameterSetName = 'List', Mandatory = $false)]
      [switch] $LocalOnly
   )
   process {
      _supportsSecurityNamespace
      if ($Id) {
          # Call the REST API
         $resp = _callAPI -Area 'securitynamespaces' -id $Id `
         -Version $([VSTeamVersions]::Core) `
      } else {
         $queryString = @{}
         if ($LocalOnly.IsPresent)
         {
            $queryString.localOnly = $true
         }
         $resp = _callAPI -Area 'securitynamespaces' `
         -Version $([VSTeamVersions]::Core) `
         -QueryString $queryString
      }
      Write-Verbose $resp | Select-Object -ExpandProperty value
      if ($resp.count -le 0) {
         Write-Output $null
      }
      if ($resp.count -gt 1) {
         # If we only need to find one specific by name
         if ($Name) {
            $selected = $resp.value | Where-Object {$_.name -eq $Name}
            if ($selected) {
               return [VSTeamSecurityNamespace]::new($selected)
            } else {
               return $null
            }
         }
         try {
            $objs = @()
            foreach ($item in $resp.value) {
               $objs += [VSTeamSecurityNamespace]::new($item)
            }
            Write-Output $objs
         }
         catch {
            # I catch because using -ErrorAction Stop on the Invoke-RestMethod
            # was still running the foreach after and reporting useless errors.
            # This casuses the first error to terminate this execution.
            _handleException $_
         }
      } else {
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $acl = [VSTeamSecurityNamespace]::new($resp.value)
         Write-Output $acl
      }
   }
}
function Get-VSTeamServiceEndpoint {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($id) {
         # Call the REST API
         $resp = _callAPI -Area 'distributedtask' -Resource 'serviceendpoints' -Id $id  `
            -Version $([VSTeamVersions]::DistributedTask) -ProjectName $ProjectName
         _applyTypesToServiceEndpoint -item $resp
         Write-Output $resp
      }
      else {
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area 'distributedtask' -Resource 'serviceendpoints'  `
            -Version $([VSTeamVersions]::DistributedTask)
         # Apply a Type Name so we can use custom format view and custom type extensions
         foreach ($item in $resp.value) {
            _applyTypesToServiceEndpoint -item $item
         }
         return $resp.value
      }
   }
}
function Get-VSTeamServiceEndpointType {
   [CmdletBinding()]
   param(
      [Parameter(ParameterSetName = 'ByType')]
      [string] $Type,
      [Parameter(ParameterSetName = 'ByType')]
      [string] $Scheme
   )
   Process {
      if ($Type -ne '' -or $Scheme -ne '') {
         if ($Type -ne '' -and $Scheme -ne '') {
            $body = @{
               type   = $Type
               scheme = $Scheme
            }
         }
         elseif ($Type -ne '') {
            $body = @{
               type = $Type
            }
         }
         else {
            $body = @{
               scheme = $Scheme
            }
         }
         # Call the REST API
         $resp = _callAPI -Area 'distributedtask' -Resource 'serviceendpointtypes'  `
            -Version $([VSTeamVersions]::DistributedTask) -body $body
      }
      else {
         # Call the REST API
         $resp = _callAPI -Area 'distributedtask' -Resource 'serviceendpointtypes'  `
            -Version $([VSTeamVersions]::DistributedTask)
      }
      # Apply a Type Name so we can use custom format view and custom type extensions
      foreach ($item in $resp.value) {
         _applyTypesToServiceEndpointType -item $item
      }
      return $resp.value
   }
}
function Get-VSTeamTfvcBranch {
   [CmdletBinding()]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [string[]] $Path,
      [parameter(Mandatory = $false)]
      [switch] $IncludeChildren = $false,
      [parameter(Mandatory = $false)]
      [switch] $IncludeParent = $false,
      [parameter(Mandatory = $false)]
      [switch] $IncludeDeleted = $false
   )
   process {
      foreach ($item in $Path) {
         $queryString = [ordered]@{
            includeChildren = $IncludeChildren;
            includeParent = $IncludeParent;
            includeDeleted = $IncludeDeleted;
         }
         $resp = _callAPI -Area tfvc -Resource branches -Id $item -QueryString $queryString -Version $([VSTeamVersions]::Tfvc)
         _applyTypesToTfvcBranch -item $resp
         Write-Output $resp
      }
   }
}
function Get-VSTeamTfvcRootBranch {
   [CmdletBinding()]
   param(
      [parameter(Mandatory = $false)]
      [switch] $IncludeChildren = $false,
      [parameter(Mandatory = $false)]
      [switch] $IncludeDeleted = $false
   )
   process {
      $queryString = [ordered]@{
         includeChildren = $IncludeChildren;
         includeDeleted = $IncludeDeleted;
      }
      $resp = _callAPI -Area tfvc -Resource branches -QueryString $queryString -Version $([VSTeamVersions]::Tfvc)
      if ($resp | Get-Member -Name value -MemberType Properties) {
         foreach ($item in $resp.value) {
            _applyTypesToTfvcBranch -item $item
         }
         Write-Output $resp.value
      }
      else {
         _applyTypesToTfvcBranch -item $resp
         Write-Output $resp
      }
   }
}
function Get-VSTeamUser {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('msa','aad','svc','imp','vss')]
      [string[]] $SubjectTypes,
      [Parameter(ParameterSetName = 'ByUserDescriptor', Mandatory = $true)]
      [Alias('UserDescriptor')]
      [string] $Descriptor
   )
   process {
      # This will throw if this account does not support the graph API
      _supportsGraph
      if ($Descriptor) {
         # Call the REST API
         $resp = _callAPI -Area 'graph' -Resource 'users' -id $Descriptor `
            -Version $([VSTeamVersions]::Graph) `
            -SubDomain 'vssps'
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $user = [VSTeamUser]::new($resp)
         Write-Output $user
      }
      else {
         $queryString = @{}
         if ($SubjectTypes -and $SubjectTypes.Length -gt 0)
         {
            $queryString.subjectTypes = $SubjectTypes -join ','
         }
         try {
            # Call the REST API
            $resp = _callAPI -Area 'graph' -id 'users' `
               -Version $([VSTeamVersions]::Graph) `
               -QueryString $queryString `
               -SubDomain 'vssps'
            $objs = @()
            foreach ($item in $resp.value) {
               $objs += [VSTeamUser]::new($item)
            }
            Write-Output $objs
         }
         catch {
            # I catch because using -ErrorAction Stop on the Invoke-RestMethod
            # was still running the foreach after and reporting useless errors.
            # This casuses the first error to terminate this execution.
            _handleException $_
         }
      }
   }
}
function Get-VSTeamUserEntitlement {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param (
       [Parameter(ParameterSetName = 'List')]
       [int] $Top = 100,
       [Parameter(ParameterSetName = 'List')]
       [int] $Skip = 0,
       [Parameter(ParameterSetName = 'List')]
       [ValidateSet('Projects', 'Extensions', 'Grouprules')]
       [string[]] $Select,
       [Parameter(ParameterSetName = 'ByID')]
       [Alias('UserId')]
       [string[]] $Id
   )
   process {
       # Thi swill throw if this account does not support MemberEntitlementManagement
       _supportsMemberEntitlementManagement
       if ($Id) {
           foreach ($item in $Id) {
               # Build the url to return the single build
               # Call the REST API
               $resp = _callAPI -SubDomain 'vsaex' -Version $([VSTeamVersions]::MemberEntitlementManagement) -Resource 'userentitlements' -id $item
               _applyTypesToUser -item $resp
               Write-Output $resp
           }
       }
       else {
           # Build the url to list the teams
           # $listurl = _buildUserURL
           $listurl = _buildRequestURI -SubDomain 'vsaex' -Resource 'userentitlements' `
               -Version $([VSTeamVersions]::MemberEntitlementManagement)
           $listurl += _appendQueryString -name "top" -value $top -retainZero
           $listurl += _appendQueryString -name "skip" -value $skip -retainZero
           $listurl += _appendQueryString -name "select" -value ($select -join ",")
           # Call the REST API
           $resp = _callAPI -url $listurl
           # Apply a Type Name so we can use custom format view and custom type extensions
           foreach ($item in $resp.members) {
               _applyTypesToUser -item $item
           }
           Write-Output $resp.members
       }
   }
}
function Get-VSTeamVariableGroup {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(Position = 0, ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Id,
      [Parameter(Position = 0, ParameterSetName = 'ByName', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Name
   )
   DynamicParam {
      _buildProjectNameDynamicParam -Position 1
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Id) {
         # Call the REST API
         $resp = _callAPI -ProjectName $ProjectName -Area 'distributedtask' -Resource 'variablegroups'  `
            -Version $([VSTeamVersions]::VariableGroups) -Id $Id
         _applyTypesToVariableGroup -item $resp
         Write-Output $resp
      }
      else {
         if ($Name) {
            $resp = _callAPI -ProjectName $ProjectName -Area 'distributedtask' -Resource 'variablegroups' -Version $([VSTeamVersions]::VariableGroups) -Method Get `
               -QueryString @{groupName = $Name}
            Write-Output $resp
         }
         else {
            # Call the REST API
            $resp = _callAPI -ProjectName $ProjectName -Area 'distributedtask' -Resource 'variablegroups'  `
               -Version $([VSTeamVersions]::VariableGroups)
            # Apply a Type Name so we can use custom format view and custom type extensions
            foreach ($item in $resp.value) {
               _applyTypesToVariableGroup -item $item
            }
            return $resp.value
         }
      }
   }
}
function Get-VSTeamWorkItem {
   [CmdletBinding(DefaultParameterSetName = 'ByID')]
   param(
      [Parameter(ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int] $Id,
      [Parameter(ParameterSetName = 'List', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int[]] $Ids,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('Fail', 'Omit')]
      [string] $ErrorPolicy = 'Fail',
      [ValidateSet('None', 'Relations', 'Fields', 'Links', 'All')]
      [string] $Expand = 'None',
      [string[]] $Fields
   )
   Process {
      # Call the REST API
      if ($Ids) {
         $resp = _callAPI -Area 'wit' -Resource 'workitems'  `
            -Version $([VSTeamVersions]::Core) `
            -Querystring @{
            '$Expand'   = $Expand
            fields      = ($Fields -join ',')
            errorPolicy = $ErrorPolicy
            ids         = ($ids -join ',')
         }
         foreach ($item in $resp.value) {
            _applyTypesToWorkItem -item $item
         }
      }
      else {
         $a = $id[0]
         $resp = _callAPI -Area 'wit' -Resource 'workitems'  `
            -Version $([VSTeamVersions]::Core) -id "$a" `
            -Querystring @{
            '$Expand' = $Expand
            fields    = ($Fields -join ',')
         }
         _applyTypesToWorkItem -item $resp
      }
      return $resp
   }
}
function Get-VSTeamWorkItemType {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param()
   DynamicParam {
      $dp = _buildProjectNameDynamicParam
      # If they have not set the default project you can't find the
      # validateset so skip that check. However, we still need to give
      # the option to pass a WorkItemType to use.
      if ($Global:PSDefaultParameterValues["*:projectName"]) {
         $wittypes = _getWorkItemTypes -ProjectName $Global:PSDefaultParameterValues["*:projectName"]
         $arrSet = $wittypes
      }
      else {
         Write-Verbose 'Call Set-VSTeamDefaultProject for Tab Complete of WorkItemType'
         $wittypes = $null
         $arrSet = $null
      }
      $ParameterName = 'WorkItemType'
      $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet $arrSet -ParameterSetName 'ByType'
      $dp.Add($ParameterName, $rp)
      $dp
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $WorkItemType = $PSBoundParameters["WorkItemType"]
      # Call the REST API
      if ($WorkItemType) {
         $resp = _callAPI -ProjectName $ProjectName -Area 'wit' -Resource 'workitemtypes'  `
            -Version $([VSTeamVersions]::Core) -id $WorkItemType
         # This call returns JSON with "": which causes the ConvertFrom-Json to fail.
         # To replace all the "": with "_end":
         $resp = $resp.Replace('"":', '"_end":') | ConvertFrom-Json
         _applyTypesWorkItemType -item $resp
         return $resp
      }
      else {
         $resp = _callAPI -ProjectName $ProjectName -Area 'wit' -Resource 'workitemtypes'  `
            -Version $([VSTeamVersions]::Core)
         # This call returns JSON with "": which causes the ConvertFrom-Json to fail.
         # To replace all the "": with "_end":
         $resp = $resp.Replace('"":', '"_end":') | ConvertFrom-Json
         # Apply a Type Name so we can use custom format view and custom type extensions
         foreach ($item in $resp.value) {
            _applyTypesWorkItemType -item $item
         }
         return $resp.value
      }
   }
}
function Invoke-VSTeamRequest {
   [CmdletBinding()]
   param(
      [string]$resource,
      [string]$area,
      [string]$id,
      [string]$version,
      [string]$subDomain,
      [ValidateSet('Get', 'Post', 'Patch', 'Delete', 'Options', 'Put', 'Default', 'Head', 'Merge', 'Trace')]
      [string]$method,
      [Parameter(ValueFromPipeline = $true)]
      [object]$body,
      [string]$InFile,
      [string]$OutFile,
      [switch]$JSON,
      [string]$ContentType,
      [string]$Url
   )
   DynamicParam {
      _buildProjectNameDynamicParam -Mandatory $false
   }
   process {
      $params = $PSBoundParameters
      # We have to remove any extra parameters not used by Invoke-RestMethod
      $params.Remove('JSON') | Out-Null
      $output = _callAPI @params
      if ($JSON.IsPresent) {
         $output | ConvertTo-Json -Depth 99
      }
      else {
         $output
      }
   }
}
function Remove-VSTeam {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
      [Alias('Name', 'TeamId', 'TeamName')]
      [string]$Id,
      [switch]$Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Force -or $PSCmdlet.ShouldProcess($Id, "Delete team")) {
         # Call the REST API
         _callAPI -Area 'projects' -Resource "$ProjectName/teams" -Id $Id `
            -Method Delete -Version $([VSTeamVersions]::Core) | Out-Null
         Write-Output "Deleted team $Id"
      }
   }
}
function Remove-VSTeamAccessControlList {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High", DefaultParameterSetName = 'ByNamespace')]
   param(
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true, ValueFromPipeline = $true)]
      [VSTeamSecurityNamespace] $SecurityNamespace,
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [ValidateScript({
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
      })]
      [string] $SecurityNamespaceId,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $true)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $true)]
      [string[]] $Tokens,
      [Parameter(ParameterSetName = 'ByNamespace', Mandatory = $false)]
      [Parameter(ParameterSetName = 'ByNamespaceId', Mandatory = $false)]
      [switch] $Recurse,
      [switch] $Force
   )
   process {
      if ($SecurityNamespace)
      {
         $SecurityNamespaceId = $SecurityNamespace.ID
      }
      $queryString = @{}
      if ($Tokens)
      {
         $queryString.tokens = $Tokens -join ","
      }
      if ($Recurse.IsPresent) {
         $queryString.recurse = $true
      }
      if ($Force -or $pscmdlet.ShouldProcess($queryString.tokens, "Delete ACL")) {
         # Call the REST API
         $resp = _callAPI -Area 'accesscontrollists' -id $SecurityNamespaceId -method DELETE `
            -Version $([VSTeamVersions]::Core) `
            -QueryString $queryString
         Write-Output $resp
      }
   }
}
function Remove-VSTeamAccount {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      # Only add this option on Windows Machines
      if (_isOnWindows) {
         Write-Verbose 'On a Windows machine'
         $ParameterName = 'Level'
         # Create the dictionary
         $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
         # Create the collection of attributes
         $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
         # Create and set the parameters' attributes
         $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
         $ParameterAttribute.Mandatory = $false
         $ParameterAttribute.HelpMessage = "On Windows machines allows you to store the account information at the process, user or machine level. Not available on other platforms."
         # Add the attributes to the attributes collection
         $AttributeCollection.Add($ParameterAttribute)
         # Generate and set the ValidateSet
         if (_testAdministrator) {
            $arrSet = "All", "Process", "User", "Machine"
         }
         else {
            $arrSet = "All", "Process", "User"
         }
         $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
         # Add the ValidateSet to the attributes collection
         $AttributeCollection.Add($ValidateSetAttribute)
         # Create and return the dynamic parameter
         $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
         $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
         return $RuntimeParameterDictionary
      }
      else {
         Write-Verbose 'Not on a Windows machine'
      }
   }
   process {
      if (_isOnWindows) {
         # Bind the parameter to a friendly variable
         $Level = $PSBoundParameters[$ParameterName]
         if (-not $Level) {
            $Level = "Process"
         }
      }
      else {
         $Level = "Process"
      }
      switch ($Level) {
         "User" {
            $whatIf = "user level"
         }
         "All" {
            $whatIf = "all levels"
         }
         Default {
            $whatIf = "$Level level"
         }
      }
      if ($Force -or $pscmdlet.ShouldProcess($whatIf, "Remove Team Account")) {
         switch ($Level) {
            "Process" {
               Write-Verbose "Removing from user level."
               _clearEnvironmentVariables "Process"
            }
            "All" {
               Write-Verbose "Removing from all levels."
               Write-Verbose "Removing from proces level."
               _clearEnvironmentVariables "Process"
               Write-Verbose "Removing from user level."
               _clearEnvironmentVariables "User"
               if (_testAdministrator) {
                  Write-Verbose "Removing from machine level."
                  _clearEnvironmentVariables "Machine"
               }
               else {
                  Write-Warning "Must run as administrator to clear machine level."
               }
            }
            Default {
               Write-Verbose "Removing from $Level level."
               _clearEnvironmentVariables $Level
            }
         }
         Write-Output "Removed default project and team account information"
      }
   }
}
function Remove-VSTeamAgent {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int] $PoolId,
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 1)]
      [Alias('AgentID')]
      [int[]] $Id,
      # Forces the command without confirmation
      [switch] $Force
   )
   process {
      foreach ($item in $Id) {
         if ($force -or $pscmdlet.ShouldProcess($item,"Delete agent")) {
            try {
               _callAPI -Method Delete -Area "distributedtask/pools/$PoolId" -Resource agents -Id $item -Version $([VSTeamVersions]::DistributedTask) | Out-Null
               Write-Output "Deleted agent $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Remove-VSTeamBuild {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int[]] $Id,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Build")) {
            try {
               _callAPI -ProjectName $ProjectName -Area 'build' -Resource 'builds' -id $item `
                  -Method Delete  -Version $([VSTeamVersions]::Build) | Out-Null
               Write-Output "Deleted build $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Remove-VSTeamBuildDefinition {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int[]] $Id,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Build Definition")) {
            # Call the REST API
            _callAPI -Method Delete -ProjectName $ProjectName -Area build -Resource definitions -Id $item -Version $([VSTeamVersions]::Build) | Out-Null
            Write-Output "Deleted build definition $item"
         }
      }
   }
}
function Remove-VSTeamBuildTag {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
      [string[]] $Tags,
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int[]] $Id,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Remove-VSTeamBuildTag")) {
            foreach ($tag in $tags) {
               # Call the REST API
               _callAPI -ProjectName $projectName -Area 'build' -Resource "builds/$Id/tags" `
                  -Method Delete -Querystring @{tag = $tag} -Version $([VSTeamVersions]::Build) | Out-Null
            }
         }
      }
   }
}
function Remove-VSTeamExtension {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param (
      [parameter(Mandatory = $true)]
      [string] $PublisherId,
      [parameter(Mandatory = $true)]
      [string] $ExtensionId,
      [switch] $Force
   )
   if ($Force -or $pscmdlet.ShouldProcess($ExtensionId, "Remove extension")) {
      $resource = "extensionmanagement/installedextensionsbyname/$PublisherId/$ExtensionId"
      $resp = _callAPI -Method Delete -SubDomain 'extmgmt' -Resource $resource -Version $([VSTeamVersions]::ExtensionsManagement)
      Write-Output $resp
   }
}
function Remove-VSTeamFeed {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param (
      [Parameter(ParameterSetName = 'ByID', Position = 0, Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('FeedId')]
      [string[]] $Id,
      # Forces the command without confirmation
      [switch] $Force
   )
   process {
      # Thi swill throw if this account does not support feeds
      _supportsFeeds
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Package Feed")) {
            # Call the REST API
            _callAPI -subDomain feeds -Method Delete -Id $item -Area packaging -Resource feeds -Version $([VSTeamVersions]::Packaging) | Out-Null
            Write-Output "Deleted Feed $item"
         }
      }
   }
}
function Remove-VSTeamGitRepository {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [guid[]] $Id,
      [switch] $Force
   )
   Process {
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Repository")) {
            try {
               _callAPI -Method Delete -Id $item -Area git -Resource repositories -Version $([VSTeamVersions]::Git) | Out-Null
               Write-Output "Deleted repository $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Remove-VSTeamMembership {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true)]
      [string] $MemberDescriptor,
      [Parameter(Mandatory = $true)]
      [string] $ContainerDescriptor,
      [switch] $Force
   )
   process {
      if ($Force -or $PSCmdlet.ShouldProcess("$MemberDescriptor/$ContainerDescriptor", "Delete Membership")) {
         return _callMembershipAPI -Id "$MemberDescriptor/$ContainerDescriptor" -Method Delete
      }
   }
}
function Remove-VSTeamPolicy {
   [CmdletBinding(SupportsShouldProcess = $true)]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [int[]] $Id,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $true
   }
   Process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Policy")) {
            try {
               _callAPI -ProjectName $ProjectName -Method Delete -Id $item -Area policy -Resource configurations -Version $([VSTeamVersions]::Git) | Out-Null
               Write-Output "Deleted policy $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Remove-VSTeamProfile {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
   param(
      # Name is an array so I can pass an array after -Name
      # I can also use pipe
      [parameter(Mandatory = $true, Position = 1, ValueFromPipelineByPropertyName = $true)]
      [string[]] $Name,
      [switch] $Force
   )
   begin {
      $profiles = Get-VSTeamProfile
   }
   process {
      foreach ($item in $Name) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Remove-VSTeamProfile")) {
            # See if this item is already in there
            $profiles = $profiles | Where-Object Name -ne $item
         }
      }
   }
   end {
      $contents = ConvertTo-Json $profiles
      if ([string]::isnullorempty($contents)) {
         $contents = ''
      }
      Set-Content -Path $profilesPath -Value $contents
   }
}
function Remove-VSTeamProject {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam -ParameterName 'Name' -AliasName 'ProjectName'
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["Name"]
      if ($Force -or $pscmdlet.ShouldProcess($ProjectName, "Delete Project")) {
         # Call the REST API
         $resp = _callAPI -Area 'projects' -Id (Get-VSTeamProject $ProjectName).id `
            -Method Delete -Version $([VSTeamVersions]::Core)
         _trackProjectProgress -resp $resp -title 'Deleting team project' -msg "Deleting $ProjectName"
         # Invalidate any cache of projects.
         [VSTeamProjectCache]::timestamp = -1
         Write-Output "Deleted $ProjectName"
      }
   }
}
function Remove-VSTeamRelease {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int[]] $Id,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      Write-Debug 'Remove-VSTeamRelease Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($force -or $pscmdlet.ShouldProcess($item, "Delete Release")) {
            Write-Debug 'Remove-VSTeamRelease Call the REST API'
            try {
               # Call the REST API
               _callAPI -Method Delete -SubDomain vsrm -Area release -Resource releases -ProjectName $ProjectName -id $item -Version $([VSTeamVersions]::Release) | Out-Null
               Write-Output "Deleted release $item"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Remove-VSTeamReleaseDefinition {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int[]] $Id,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      Write-Debug 'Remove-VSTeamReleaseDefinition Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($force -or $pscmdlet.ShouldProcess($item, "Delete Release Definition")) {
            _callAPI -Method Delete -subDomain vsrm -Area release -Resource definitions -Version $([VSTeamVersions]::Release) -projectName $ProjectName -id $item  | Out-Null
            Write-Output "Deleted release definition $item"
         }
      }
   }
}
function Remove-VSTeamServiceEndpoint {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string[]] $id,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Service Endpoint")) {
            # Call the REST API
            _callAPI -projectName $projectName -Area 'distributedtask' -Resource 'serviceendpoints' -Id $item  `
               -Method Delete -Version $([VSTeamVersions]::DistributedTask) | Out-Null
            Write-Output "Deleted service endpoint $item"
         }
      }
   }
}
function Remove-VSTeamUserEntitlement {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High", DefaultParameterSetName = 'ById')]
   param(
       [Parameter(ParameterSetName = 'ById', Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
       [Alias('UserId')]
       [string]$Id,
       [Parameter(ParameterSetName = 'ByEmail', Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
       [Alias('UserEmail')]
       [string]$Email,
       [switch]$Force
   )
   process {
       # Thi swill throw if this account does not support MemberEntitlementManagement
       _supportsMemberEntitlementManagement
       if ($email) {
           # We have to go find the id
           $user = Get-VSTeamUserEntitlement | Where-Object email -eq $email
           if (-not $user) {
               throw "Could not find user with an email equal to $email"
           }
           $id = $user.id
       } else {
           $user = Get-VSTeamUserEntitlement -Id $id
       }
       if ($Force -or $PSCmdlet.ShouldProcess("$($user.userName) ($($user.email))", "Delete user")) {
           # Call the REST API
           _callAPI -Method Delete -SubDomain 'vsaex' -Resource 'userentitlements' -Id $Id -Version $([VSTeamVersions]::MemberEntitlementManagement) | Out-Null
           Write-Output "Deleted user $($user.userName) ($($user.email))"
       }
   }
}
function Remove-VSTeamVariableGroup {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string[]] $id,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      foreach ($item in $id) {
         if ($Force -or $pscmdlet.ShouldProcess($item, "Delete Variable Group")) {
            # Call the REST API
            _callAPI -projectName $projectName -Area 'distributedtask' -Resource 'variablegroups' -Id $item  `
               -Method Delete -Version $([VSTeamVersions]::VariableGroups) | Out-Null
            Write-Output "Deleted variable group $item"
         }
      }
   }
}
function Set-VSTeamAccount {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low", DefaultParameterSetName = 'Secure')]
   param(
      [parameter(ParameterSetName = 'Windows', Mandatory = $true, Position = 1)]
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, Position = 1)]
      [Parameter(ParameterSetName = 'Plain', Mandatory = $true, Position = 1)]
      [string] $Account,
      [parameter(ParameterSetName = 'Plain', Mandatory = $true, Position = 2, HelpMessage = 'Personal Access or Bearer Token')]
      [Alias('Token')]
      [string] $PersonalAccessToken,
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, HelpMessage = 'Personal Access or Bearer Token')]
      [Alias('PAT')]
      [securestring] $SecurePersonalAccessToken,
      [parameter(ParameterSetName = 'Windows')]
      [parameter(ParameterSetName = 'Secure')]
      [Parameter(ParameterSetName = 'Plain')]
      [ValidateSet('TFS2017', 'TFS2018', 'VSTS', 'AzD')]
      [string] $Version,
      [string] $Drive,
      [parameter(ParameterSetName = 'Secure')]
      [Parameter(ParameterSetName = 'Plain')]
      [switch] $UseBearerToken,
      [switch] $Force
   )
   DynamicParam {
      # Create the dictionary
      $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
      $profileArrSet = Get-VSTeamProfile | Select-Object -ExpandProperty Name
      if ($profileArrSet) {
         $profileParam = _buildDynamicParam -ParameterName 'Profile' -ParameterSetName 'Profile' -arrSet $profileArrSet
      }
      else {
         $profileParam = _buildDynamicParam -ParameterName 'Profile' -ParameterSetName 'Profile'
      }
      $RuntimeParameterDictionary.Add('Profile', $profileParam)
      # Only add these options on Windows Machines
      if (_isOnWindows) {
         # Generate and set the ValidateSet
         $arrSet = "Process", "User"
         if (_testAdministrator) {
            $arrSet += "Machine"
         }
         $levelParam = _buildDynamicParam -ParameterName 'Level' -arrSet $arrSet
         $RuntimeParameterDictionary.Add('Level', $levelParam)
         $winAuthParam = _buildDynamicParam -ParameterName 'UseWindowsAuthentication' -Mandatory $true -ParameterSetName 'Windows' -ParameterType ([switch])
         $RuntimeParameterDictionary.Add('UseWindowsAuthentication', $winAuthParam)
      }
      return $RuntimeParameterDictionary
   }
   process {
      # invalidate cache when changing account/collection
      # otherwise dynamic parameters being picked for a wrong collection
      [VSTeamProjectCache]::timestamp = -1
      # Bind the parameter to a friendly variable
      $Profile = $PSBoundParameters['Profile']
      if (_isOnWindows) {
         # Bind the parameter to a friendly variable
         $Level = $PSBoundParameters['Level']
         if (-not $Level) {
            $Level = "Process"
         }
         $UsingWindowsAuth = $PSBoundParameters['UseWindowsAuthentication']
      }
      else {
         $Level = "Process"
      }
      if ($Profile) {
         $info = Get-VSTeamProfile | Where-Object Name -eq $Profile
         if ($info) {
            $encodedPat = $info.Pat
            $account = $info.URL
            $version = $info.Version
            $token = $info.Token
         }
         else {
            Write-Error "The profile provided was not found."
            return
         }
      }
      else {
         if ($SecurePersonalAccessToken) {
            # Convert the securestring to a normal string
            # this was the one technique that worked on Mac, Linux and Windows
            $credential = New-Object System.Management.Automation.PSCredential $account, $SecurePersonalAccessToken
            $_pat = $credential.GetNetworkCredential().Password
         }
         else {
            $_pat = $PersonalAccessToken
         }
         # If they only gave an account name add https://dev.azure.com
         if ($Account -notlike "*/*") {
            $Account = "https://dev.azure.com/$($Account)"
         }
         # If they gave https://xxx.visualstudio.com convert to new URL
         if ($Account -match "(?<protocol>https?\://)?(?<account>[A-Z0-9][-A-Z0-9]*[A-Z0-9])(?<domain>\.visualstudio\.com)") {
            $Account = "https://dev.azure.com/$($matches.account)"
         }
         if ($UseBearerToken.IsPresent) {
            $token = $_pat
            $encodedPat = ''
         }
         else {
            $token = ''
            $encodedPat = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$_pat"))
         }
         # If no SecurePersonalAccessToken is entered, and on windows, are we using default credentials for REST calls
         if ((!$_pat) -and (_isOnWindows) -and ($UsingWindowsAuth)) {
            Write-Verbose "Using Default Windows Credentials for authentication; no Personal Access Token required"
            $encodedPat = ''
            $token = ''
         }
      }
      if((_isOnWindows) -and ($UsingWindowsAuth) -and $(_isVSTS $Account)) {
         Write-Error "Windows Auth can only be used with Team Fondation Server or Azure DevOps Server.$([Environment]::NewLine)Provide a Personal Access Token or Bearer Token to connect to Azure DevOps Services."
         return
      }
      if ($Force -or $pscmdlet.ShouldProcess($Account, "Set Account")) {
         # Piped to null so callers can pipe to Invoke-Expression to mount the drive on one line.
         Clear-VSTeamDefaultProject *> $null
         _setEnvironmentVariables -Level $Level -Pat $encodedPat -Acct $account -BearerToken $token -Version $Version
         Set-VSTeamAPIVersion -Target (_getVSTeamAPIVersion -Instance $account -Version $Version)
         if ($Drive) {
            # Assign to null so nothing is writen to output.
            Write-Output "# To map a drive run the following command or pipe to iex:`nNew-PSDrive -Name $Drive -PSProvider SHiPS -Root 'VSTeam#VSTeamAccount'"
         }
      }
   }
}
function Set-VSTeamAlias {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
   param(
      [switch] $Force
   )
   if ($Force -or $pscmdlet.ShouldProcess("Set Alias")) {
      New-Alias ata Set-VSTeamAccount -Scope Global
      New-Alias sta Set-VSTeamAccount -Scope Global
      New-Alias gti Get-VSTeamInfo -Scope Global
      New-Alias ivr Invoke-VSTeamRequest -Scope Global
      New-Alias Get-ServiceEndpoint Get-VSTeamServiceEndpoint -Scope Global
      New-Alias Add-AzureRMServiceEndpoint Add-VSTeamAzureRMServiceEndpoint -Scope Global
      New-Alias Remove-ServiceEndpoint Remove-VSTeamServiceEndpoint -Scope Global
      New-Alias Add-SonarQubeEndpoint Add-VSTeamSonarQubeEndpoint -Scope Global
      New-Alias Add-KubernetesEndpoint Add-VSTeamKubernetesEndpoint -Scope Global
      New-Alias Add-ServiceEndpoint Add-VSTeamServiceEndpoint -Scope Global
      New-Alias Update-ServiceEndpoint Update-VSTeamServiceEndpoint -Scope Global
      New-Alias Add-ServiceFabricEndpoint Add-VSTeamServiceFabricEndpoint -Scope Global
      New-Alias Remove-ServiceFabricEndpoint Remove-VSTeamServiceFabricEndpoint -Scope Global
      New-Alias Remove-AzureRMServiceEndpoint Remove-VSTeamAzureRMServiceEndpoint -Scope Global
      New-Alias Remove-SonarQubeEndpoint Remove-VSTeamSonarQubeEndpoint -Scope Global
      New-Alias Get-Build Get-VSTeamBuild -Scope Global
      New-Alias Show-Build Show-VSTeamBuild -Scope Global
      New-Alias Get-BuildLog Get-VSTeamBuildLog -Scope Global
      New-Alias Get-BuildTag Get-VSTeamBuildTag -Scope Global
      New-Alias Get-BuildArtifact Get-VSTeamBuildArtifact -Scope Global
      New-Alias Add-Build Add-VSTeamBuild -Scope Global
      New-Alias Add-BuildTag Add-VSTeamBuildTag -Scope Global
      New-Alias Remove-Build Remove-VSTeamBuild -Scope Global
      New-Alias Remove-BuildTag Remove-VSTeamBuildTag -Scope Global
      New-Alias Update-Build Update-VSTeamBuild -Scope Global
      New-Alias Get-BuildDefinition Get-VSTeamBuildDefinition -Scope Global
      New-Alias Add-BuildDefinition Add-VSTeamBuildDefinition -Scope Global
      New-Alias Show-BuildDefinition Show-VSTeamBuildDefinition -Scope Global
      New-Alias Remove-BuildDefinition Remove-VSTeamBuildDefinition -Scope Global
      New-Alias Show-Approval Show-VSTeamApproval -Scope Global
      New-Alias Get-Approval Get-VSTeamApproval -Scope Global
      New-Alias Set-Approval Set-VSTeamApproval -Scope Global
      New-Alias Get-CloudSubscription Get-VSTeamCloudSubscription -Scope Global
      New-Alias Get-GitRepository Get-VSTeamGitRepository -Scope Global
      New-Alias Show-GitRepository Show-VSTeamGitRepository -Scope Global
      New-Alias Add-GitRepository Add-VSTeamGitRepository -Scope Global
      New-Alias Remove-GitRepository Remove-VSTeamGitRepository -Scope Global
      New-Alias Get-Pool Get-VSTeamPool -Scope Global
      New-Alias Get-Project Get-VSTeamProject -Scope Global
      New-Alias Show-Project Show-VSTeamProject -Scope Global
      New-Alias Update-Project Update-VSTeamProject -Scope Global
      New-Alias Add-Project Add-VSTeamProject -Scope Global
      New-Alias Remove-Project Remove-VSTeamProject -Scope Global
      New-Alias Get-Queue Get-VSTeamQueue -Scope Global
      New-Alias Get-ReleaseDefinition Get-VSTeamReleaseDefinition -Scope Global
      New-Alias Show-ReleaseDefinition Show-VSTeamReleaseDefinition -Scope Global
      New-Alias Add-ReleaseDefinition Add-VSTeamReleaseDefinition -Scope Global
      New-Alias Remove-ReleaseDefinition Remove-VSTeamReleaseDefinition -Scope Global
      New-Alias Get-Release Get-VSTeamRelease -Scope Global
      New-Alias Show-Release Show-VSTeamRelease -Scope Global
      New-Alias Add-Release Add-VSTeamRelease -Scope Global
      New-Alias Remove-Release Remove-VSTeamRelease -Scope Global
      New-Alias Set-ReleaseStatus Set-VSTeamReleaseStatus -Scope Global
      New-Alias Add-ReleaseEnvironment Add-VSTeamReleaseEnvironment -Scope Global
      New-Alias Get-TeamInfo Get-VSTeamInfo -Scope Global
      New-Alias Add-TeamAccount Set-VSTeamAccount -Scope Global
      New-Alias Remove-TeamAccount Remove-VSTeamAccount -Scope Global
      New-Alias Get-TeamOption Get-VSTeamOption -Scope Global
      New-Alias Get-TeamResourceArea Get-VSTeamResourceArea -Scope Global
      New-Alias Clear-DefaultProject Clear-VSTeamDefaultProject -Scope Global
      New-Alias Set-DefaultProject Set-VSTeamDefaultProject -Scope Global
      New-Alias Get-TeamMember Get-VSTeamMember -Scope Global
      New-Alias Get-Team Get-VSTeam -Scope Global
      New-Alias Add-Team Add-VSTeam -Scope Global
      New-Alias Update-Team Update-VSTeam -Scope Global
      New-Alias Remove-Team Remove-VSTeam -Scope Global
      New-Alias Add-Profile Add-VSTeamProfile -Scope Global
      New-Alias Remove-Profile Remove-VSTeamProfile -Scope Global
      New-Alias Get-Profile Get-VSTeamProfile -Scope Global
      New-Alias Set-APIVersion Set-VSTeamAPIVersion -Scope Global
      New-Alias Add-UserEntitlement Add-VSTeamUserEntitlement -Scope Global
      New-Alias Remove-UserEntitlement Remove-VSTeamUserEntitlement -Scope Global
      New-Alias Get-UserEntitlement Get-VSTeamUserEntitlement -Scope Global
      New-Alias Update-UserEntitlement Update-VSTeamUserEntitlement -Scope Global
      New-Alias Set-EnvironmentStatus Set-VSTeamEnvironmentStatus -Scope Global
      New-Alias Get-ServiceEndpointType Get-VSTeamServiceEndpointType -Scope Global
      New-Alias Update-BuildDefinition Update-VSTeamBuildDefinition -Scope Global
      New-Alias Get-TfvcRootBranch Get-VSTeamTfvcRootBranch -Scope Global
      New-Alias Get-TfvcBranch Get-VSTeamTfvcBranch -Scope Global
      New-Alias Get-WorkItemType Get-VSTeamWorkItemType -Scope Global
      New-Alias Add-WorkItem Add-VSTeamWorkItem -Scope Global
      New-Alias Get-WorkItem Get-VSTeamWorkItem -Scope Global
      New-Alias Show-WorkItem Show-VSTeamWorkItem -Scope Global
      New-Alias Get-Policy Get-VSTeamPolicy -Scope Global
      New-Alias Get-PolicyType Get-VSTeamPolicyType -Scope Global
      New-Alias Add-Policy Add-VSTeamPolicy -Scope Global
      New-Alias Update-Policy Update-VSTeamPolicy -Scope Global
      New-Alias Remove-Policy Remove-VSTeamPolicy -Scope Global
      New-Alias Get-GitRef Get-VSTeamGitRef -Scope Global
      New-Alias Get-Agent Get-VSTeamAgent -Scope Global
      New-Alias Remove-Agent Remove-VSTeamAgent -Scope Global
      New-Alias Enable-Agent Enable-VSTeamAgent -Scope Global
      New-Alias Disable-Agent Disable-VSTeamAgent -Scope Global
      New-Alias Update-Profile Update-VSTeamProfile -Scope Global
      New-Alias Get-APIVersion Get-VSTeamAPIVersion -Scope Global
      New-Alias Add-NuGetEndpoint Add-VSTeamNuGetEndpoint -Scope Global
      New-Alias Get-Feed Get-VSTeamFeed -Scope Global
      New-Alias Add-Feed Add-VSTeamFeed -Scope Global
      New-Alias Show-Feed Show-VSTeamFeed -Scope Global
      New-Alias Remove-Feed Remove-VSTeamFeed -Scope Global
      New-Alias Get-PullRequest Get-VSTeamPullRequest -Scope Global
      New-Alias Show-PullRequest Show-VSTeamPullRequest -Scope Global
      New-Alias Add-Extension Add-VSTeamExtension -Scope Global
      New-Alias Get-Extension Get-VSTeamExtension -Scope Global
      New-Alias Update-Extension Update-VSTeamExtension -Scope Global
      New-Alias Remove-Extension Remove-VSTeamExtension -Scope Global
      New-Alias Update-WorkItem Update-VSTeamWorkItem -Scope Global
      New-Alias Get-JobRequest Get-VSTeamJobRequest -Scope Global
      New-Alias Update-ReleaseDefinition Update-VSTeamReleaseDefinition -Scope Global
   }
}
function Set-VSTeamAPIVersion {
   [CmdletBinding(DefaultParameterSetName = 'Target', SupportsShouldProcess = $true, ConfirmImpact = "Low")]
   param(
      [parameter(ParameterSetName = 'Target', Mandatory = $false, Position = 0)]
      [ValidateSet('TFS2017', 'TFS2018', 'VSTS', 'AzD')]
      [string] $Target = 'TFS2017',
      [parameter(ParameterSetName = 'Service', Mandatory = $true, Position = 0)]
      [ValidateSet('Build', 'Release', 'Core', 'Git', 'DistributedTask', 'VariableGroups', 'Tfvc', 'Packaging', 'MemberEntitlementManagement', 'ExtensionsManagement', 'ServiceFabricEndpoint', 'Graph')]
      [string] $Service,
      [parameter(ParameterSetName = 'Service', Mandatory = $true, Position = 1)]
      [string] $Version,
      [switch] $Force
   )
   if ($Force -or $pscmdlet.ShouldProcess($Target, "Set-VSTeamAPIVersion")) {
      if ($PSCmdlet.ParameterSetName -eq 'Service') {
         switch ($Service) {
            'Build' {
               [VSTeamVersions]::Build = $Version
            }
            'Release' {
               [VSTeamVersions]::Release = $Version
            }
            'Core' {
               [VSTeamVersions]::Core = $Version
            }
            'Git' {
               [VSTeamVersions]::Git = $Version
            }
            'DistributedTask' {
               [VSTeamVersions]::DistributedTask = $Version
            }
            'VariableGroups' {
               [VSTeamVersions]::VariableGroups = $Version
            }
            'Tfvc' {
               [VSTeamVersions]::Tfvc = $Version
            }
            'Packaging' {
               [VSTeamVersions]::Packaging = $Version
            }
            'MemberEntitlementManagement' {
               [VSTeamVersions]::MemberEntitlementManagement = $Version
            }
            'ExtensionsManagement' {
               [VSTeamVersions]::ExtensionsManagement = $Version
            }
            'ServiceFabricEndpoint' {
               [VSTeamVersions]::ServiceFabricEndpoint = $Version
            }
            'Graph' {
               [VSTeamVersions]::Graph = $Version
            }
         }
      }
      else {
         switch ($Target) {
            'TFS2018' {
               [VSTeamVersions]::Version = 'TFS2018'
               [VSTeamVersions]::Git = '3.2'
               [VSTeamVersions]::Core = '3.2'
               [VSTeamVersions]::Build = '3.2'
               [VSTeamVersions]::Release = '4.0-preview'
               [VSTeamVersions]::DistributedTask = '4.0-preview'
               [VSTeamVersions]::VariableGroups = '4.0-preview'
               [VSTeamVersions]::Tfvc = '3.2'
               [VSTeamVersions]::Packaging = ''
               [VSTeamVersions]::MemberEntitlementManagement = ''
               [VSTeamVersions]::ServiceFabricEndpoint = '3.2'
               [VSTeamVersions]::ExtensionsManagement = '3.2-preview'
               [VSTeamVersions]::Graph = ''
            }
            'TFS2017' {
               [VSTeamVersions]::Version = 'TFS2017'
               [VSTeamVersions]::Git = '3.0'
               [VSTeamVersions]::Core = '3.0'
               [VSTeamVersions]::Build = '3.0'
               [VSTeamVersions]::Release = '3.0-preview'
               [VSTeamVersions]::DistributedTask = '3.0-preview'
               [VSTeamVersions]::VariableGroups = '3.2-preview.1'
               [VSTeamVersions]::Tfvc = '3.0'
               [VSTeamVersions]::Packaging = ''
               [VSTeamVersions]::MemberEntitlementManagement = ''
               [VSTeamVersions]::ServiceFabricEndpoint = ''
               [VSTeamVersions]::ExtensionsManagement = '3.0-preview'
               [VSTeamVersions]::Graph = ''
            }
            Default {
               [VSTeamVersions]::Version = $Target
               [VSTeamVersions]::Git = '5.1-preview'
               [VSTeamVersions]::Core = '5.0'
               [VSTeamVersions]::Build = '5.0'
               [VSTeamVersions]::Release = '5.1-preview'
               [VSTeamVersions]::DistributedTask = '5.0-preview'
               [VSTeamVersions]::VariableGroups = '5.0-preview.1'
               [VSTeamVersions]::Tfvc = '5.0'
               [VSTeamVersions]::Packaging = '5.1-preview'
               [VSTeamVersions]::MemberEntitlementManagement = '5.1-preview'
               # This version is never passed to the API but is used to evaluate
               # if Service Fabric is enabled for the account. Just set it to
               # match Distributed Task for AzD
               [VSTeamVersions]::ServiceFabricEndpoint = '5.0-preview'
               [VSTeamVersions]::ExtensionsManagement = '5.1-preview'
               [VSTeamVersions]::Graph = '5.1-preview'
            }
         }
      }
   }
   Write-Verbose [VSTeamVersions]::Version
   Write-Verbose "Git: $([VSTeamVersions]::Git)"
   Write-Verbose "Core: $([VSTeamVersions]::Core)"
   Write-Verbose "Build: $([VSTeamVersions]::Build)"
   Write-Verbose "Release: $([VSTeamVersions]::Release)"
   Write-Verbose "DistributedTask: $([VSTeamVersions]::DistributedTask)"
   Write-Verbose "VariableGroups: $([VSTeamVersions]::VariableGroups)"
   Write-Verbose "Tfvc: $([VSTeamVersions]::Tfvc)"
   Write-Verbose "Packaging: $([VSTeamVersions]::Packaging)"
   Write-Verbose "MemberEntitlementManagement: $([VSTeamVersions]::MemberEntitlementManagement)"
   Write-Verbose "ServiceFabricEndpoint: $([VSTeamVersions]::ServiceFabricEndpoint)"
   Write-Verbose "ExtensionsManagement: $([VSTeamVersions]::ExtensionsManagement)"
   Write-Verbose "Graph: $([VSTeamVersions]::Graph)"
}
function Set-VSTeamApproval {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int[]] $Id,
      [Parameter(Mandatory = $true)]
      [ValidateSet('Approved', 'Rejected', 'Pending', 'ReAssigned')]
      [string] $Status,
      [string] $Approver,
      [string] $Comment,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      Write-Debug 'Set-VSTeamApproval Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = '{ "status": "' + $status + '", "approver": "' + $approver + '", "comments": "' + $comment + '" }'
      Write-Verbose $body
      foreach ($item in $id) {
         if ($force -or $pscmdlet.ShouldProcess($item, "Set Approval Status")) {
            Write-Debug 'Set-VSTeamApproval Call the REST API'
            try {
               # Call the REST API
               _callAPI -Method Patch -SubDomain vsrm -ProjectName $ProjectName -Area release -Resource approvals `
                  -Id $item -Version $([VSTeamVersions]::Release) -body $body -ContentType 'application/json' | Out-Null
               Write-Output "Approval $item status changed to $status"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Set-VSTeamDefaultProject {
   [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Low")]
   param([switch] $Force)
   DynamicParam {
      $dp = _buildProjectNameDynamicParam -ParameterName "Project"
      # Only add these options on Windows Machines
      if (_isOnWindows) {
         $ParameterName = 'Level'
         # Create the collection of attributes
         $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
         # Create and set the parameters' attributes
         $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
         $ParameterAttribute.Mandatory = $false
         $ParameterAttribute.HelpMessage = "On Windows machines allows you to store the default project at the process, user or machine level. Not available on other platforms."
         # Add the attributes to the attributes collection
         $AttributeCollection.Add($ParameterAttribute)
         # Generate and set the ValidateSet
         if (_testAdministrator) {
            $arrSet = "Process", "User", "Machine"
         }
         else {
            $arrSet = "Process", "User"
         }
         $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
         # Add the ValidateSet to the attributes collection
         $AttributeCollection.Add($ValidateSetAttribute)
         # Create and return the dynamic parameter
         $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
         $dp.Add($ParameterName, $RuntimeParameter)
      }
      return $dp
   }
   begin {
      # Bind the parameter to a friendly variable
      $Project = $PSBoundParameters["Project"]
      if (_isOnWindows) {
         $Level = $PSBoundParameters[$ParameterName]
      }
   }
   process {
      if ($Force -or $pscmdlet.ShouldProcess($Project, "Set-VSTeamDefaultProject")) {
         if (_isOnWindows) {
            if (-not $Level) {
               $Level = "Process"
            }
            # You always have to set at the process level or they will Not
            # be seen in your current session.
            $env:TEAM_PROJECT = $Project
            [VSTeamVersions]::DefaultProject = $Project
            [System.Environment]::SetEnvironmentVariable("TEAM_PROJECT", $Project, $Level)
         }
         $Global:PSDefaultParameterValues["*:projectName"] = $Project
      }
   }
}
function Set-VSTeamEnvironmentStatus {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('Id')]
      [int[]] $EnvironmentId,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int] $ReleaseId,
      [Parameter(Mandatory = $true, Position = 0)]
      [ValidateSet('canceled', 'inProgress', 'notStarted', 'partiallySucceeded', 'queued', 'rejected', 'scheduled', 'succeeded', 'undefined')]
      [Alias('EnvironmentStatus')]
      [string] $Status,
      [string] $Comment,
      [datetime] $ScheduledDeploymentTime,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam -Position 1
   }
   Process {
      Write-Debug 'Set-VSTeamEnvironmentStatus Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = ConvertTo-Json ([PSCustomObject]@{status = $Status; comment = $Comment; scheduledDeploymentTime = $ScheduledDeploymentTime})
      foreach ($item in $EnvironmentId) {
         if ($force -or $pscmdlet.ShouldProcess($item, "Set Status on Environment")) {
            Write-Debug 'Set-VSTeamEnvironmentStatus Call the REST API'
            try {
               # Call the REST API
               _callAPI -Method Patch -SubDomain vsrm -Area release -Resource "releases/$ReleaseId/environments" -projectName $ProjectName -id $item `
                  -body $body -ContentType 'application/json' -Version $([VSTeamVersions]::Release) | Out-Null
               Write-Output "Environment $item status changed to $status"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Set-VSTeamReleaseStatus {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int[]] $Id,
      [ValidateSet('Active', 'Abandoned')]
      [string] $Status,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      Write-Debug 'Set-VSTeamReleaseStatus Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = '{ "id": ' + $id + ', "status": "' + $status + '" }'
      foreach ($item in $id) {
         if ($force -or $pscmdlet.ShouldProcess($item, "Set status on Release")) {
            Write-Debug 'Set-VSTeamReleaseStatus Call the REST API'
            try {
               # Call the REST API
               _callAPI -Method Patch -SubDomain vsrm -Area release -Resource releases -projectName $ProjectName -id $item `
                  -body $body -ContentType 'application/json' -Version $([VSTeamVersions]::Release) | Out-Null
               Write-Output "Release $item status changed to $status"
            }
            catch {
               _handleException $_
            }
         }
      }
   }
}
function Show-VSTeam {
   [CmdletBinding()]
   param ()
   process {
      _hasAccount
      Show-Browser "$([VSTeamVersions]::Account)"
   }
}
function Show-VSTeamApproval {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('Id')]
      [int] $ReleaseDefinitionId
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      Write-Debug 'Show-VSTeamApproval Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      Show-Browser "$([VSTeamVersions]::Account)/$ProjectName/_release?releaseId=$ReleaseDefinitionId"
   }
}
function Show-VSTeamBuild {
   [CmdletBinding(DefaultParameterSetName = 'ByID')]
   param (
      [Parameter(ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [int[]] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      Show-Browser "$([VSTeamVersions]::Account)/$ProjectName/_build/index?buildId=$Id"
   }
}
function Show-VSTeamBuildDefinition {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [string] $Filter,
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('Mine', 'All', 'Queued', 'XAML')]
      [string] $Type = 'All',
      [Parameter(ParameterSetName = 'ByID', Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildDefinitionID')]
      [int[]] $Id,
      [Parameter(ParameterSetName = 'List')]
      [string] $Path = '\'
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      # Build the url
      $url = "$([VSTeamVersions]::Account)/$ProjectName/_build"
      if ($id) {
         $url += "/index?definitionId=$id"
      }
      else {
         switch ($type) {
            'Mine' {
               $url += '/index?_a=mine&path='
            }
            'XAML' {
               $url += '/xaml&path='
            }
            'Queued' {
               $url += '/index?_a=queued&path='
            }
            Default {
               # All
               $url += '/index?_a=allDefinitions&path='
            }
         }
         # Make sure path starts with \
         if ($Path[0] -ne '\') {
            $Path = '\' + $Path
         }
         $url += [System.Web.HttpUtility]::UrlEncode($Path)
      }
      Show-Browser $url
   }
}
function Show-VSTeamFeed {
   [CmdletBinding()]
   param(
      [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
      [Alias('ID')]
      [string] $Name
   )
   process {
      _hasAccount
      Show-Browser "$([VSTeamVersions]::Account)/_packaging?feed=$Name&_a=feed"
   }
}
function Show-VSTeamGitRepository {
   [CmdletBinding()]
   param (
      [Parameter(ValueFromPipelineByPropertyName = $true)]
      [string] $RemoteUrl
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $false
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($RemoteUrl) {
         Show-Browser $RemoteUrl
      }
      else {
         Show-Browser "$([VSTeamVersions]::Account)/_git/$ProjectName"
      }
   }
}
function Show-VSTeamProject {
   [CmdletBinding(DefaultParameterSetName = 'ByName')]
   param(
      [Parameter(ParameterSetName = 'ByID')]
      [Alias('ProjectID')]
      [string] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam -ParameterSetName 'ByName' -ParameterName 'Name' -AliasName 'ProjectName'
   }
   process {
      _hasAccount
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["Name"]
      if ($id) {
         $ProjectName = $id
      }
      Show-Browser "$([VSTeamVersions]::Account)/$ProjectName"
   }
}
function Show-VSTeamPullRequest {
   [CmdletBinding()]
   param(
       [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
       [Alias('PullRequestId')]
       [int] $Id
   )
   process {
       try {
           $pullRequest = Get-VSTeamPullRequest -PullRequestId $Id
           $projectName = [uri]::EscapeDataString($pullRequest.repository.project.name)
           $repositoryId = $pullRequest.repositoryName
           Show-Browser "$([VSTeamVersions]::Account)/$projectName/_git/$repositoryId/pullrequest/$Id"
       }
       catch {
           _handleException $_
       }
   }
}
function Show-VSTeamRelease {
   [CmdletBinding(DefaultParameterSetName = 'ById')]
   param(
      [Parameter(ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true, Mandatory = $true, Position = 1)]
      [Alias('ReleaseID')]
      [int] $id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      Write-Debug 'Show-VSTeamRelease Process'
      if ($id -lt 1) {
         Throw "$id is not a valid id. Value must be greater than 0."
      }
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      # Build the url
      Show-Browser "$([VSTeamVersions]::Account)/$ProjectName/_release?releaseId=$id"
   }
}
function Show-VSTeamReleaseDefinition {
   [CmdletBinding()]
   param(
      [Parameter(ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [Alias('ReleaseDefinitionID')]
      [int] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      Write-Debug 'Show-VSTeamReleaseDefinition Process'
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      # Build the url
      $url = "$([VSTeamVersions]::Account)/$ProjectName/_release"
      if ($id) {
         $url += "?definitionId=$id"
      }
      Show-Browser $url
   }
}
function Show-VSTeamWorkItem {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
      [Alias('WorkItemID')]
      [int] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      Show-Browser "$([VSTeamVersions]::Account)/$ProjectName/_workitems/edit/$Id"
   }
}
function Test-VSTeamMembership {
   [CmdletBinding()]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = "MemberDescriptor")]
      [string] $MemberDescriptor,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = "ContainerDescriptor")]
      [string] $ContainerDescriptor
   )
   process {
      Set-StrictMode -Version Latest
      $PrevWarningPreference = $WarningPreference
      try {
         $WarningPreference = "SilentlyContinue" # avoid 404 warning, since that indicates it doesn't exist
         $null = _callMembershipAPI -Id "$MemberDescriptor/$ContainerDescriptor" -Method Head
         return $true
      } catch {
         $WarningPreference = $PrevWarningPreference
         $e = $_
         try {
            if ($e.Exception -and $e.Exception.Response -and $e.Exception.Response.StatusCode -eq [System.Net.HttpStatusCode]::NotFound)
            {
               return $false
            }
         } catch {
            Write-Warning "Nested exception $_"
         }
         throw $e
      } finally {
         $WarningPreference = $PrevWarningPreference
      }
   }
}
function Update-VSTeam {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
      [Alias('TeamName', 'TeamId', 'TeamToUpdate', 'Id')]
      [string]$Name,
      [string]$NewTeamName,
      [string]$Description,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if (-not $NewTeamName -and -not $Description) {
         throw 'You must provide a new team name or description, or both.'
      }
      if ($Force -or $pscmdlet.ShouldProcess($Name, "Update-VSTeam")) {
         if (-not $NewTeamName) {
            $body = '{"description": "' + $Description + '" }'
         }
         if (-not $Description) {
            $body = '{ "name": "' + $NewTeamName + '" }'
         }
         if ($NewTeamName -and $Description) {
            $body = '{ "name": "' + $NewTeamName + '", "description": "' + $Description + '" }'
         }
         # Call the REST API
         $resp = _callAPI -Area 'projects' -Resource "$ProjectName/teams" -Id $Name `
            -Method Patch -ContentType 'application/json' -Body $body -Version $([VSTeamVersions]::Core)
         # Storing the object before you return it cleaned up the pipeline.
         # When I just write the object from the constructor each property
         # seemed to be written
         $team = [VSTeamTeam]::new($resp, $ProjectName)
         Write-Output $team
      }
   }
}
function Update-VSTeamBuild {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias('BuildID')]
      [Int] $Id,
      [parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [bool] $KeepForever,
      [parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $BuildNumber,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Force -or $pscmdlet.ShouldProcess($Id, "Update-VSTeamBuild")) {
         $body = '{'
         $items = New-Object System.Collections.ArrayList
         if ($null -ne $KeepForever) {
            $items.Add("`"keepForever`": $($KeepForever.ToString().ToLower())") > $null
         }
         if ($null -ne $buildNumber -and $buildNumber.Length -gt 0) {
            $items.Add("`"buildNumber`": `"$BuildNumber`"") > $null
         }
         if ($null -ne $items -and $items.count -gt 0) {
            $body += ($items -join ", ")
         }
         $body += '}'
         # Call the REST API
         _callAPI -ProjectName $ProjectName -Area 'build' -Resource 'builds' -Id $Id `
            -Method Patch -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::Build) | Out-Null
      }
   }
}
function Update-VSTeamBuildDefinition {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium", DefaultParameterSetName = 'JSON')]
   Param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int] $Id,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'File')]
      [string] $InFile,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'JSON')]
      [string] $BuildDefinition,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Force -or $pscmdlet.ShouldProcess($Id, "Update Build Definition")) {
         # Call the REST API
         if ($InFile) {
            _callAPI -Method Put -ProjectName $ProjectName -Area build -Resource definitions -Id $Id -Version $([VSTeamVersions]::Build) -InFile $InFile -ContentType 'application/json' | Out-Null
         }
         else {
            _callAPI -Method Put -ProjectName $ProjectName -Area build -Resource definitions -Id $Id -Version $([VSTeamVersions]::Build) -Body $BuildDefinition -ContentType 'application/json' | Out-Null
         }
      }
   }
}
function Update-VSTeamExtension {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param (
      [parameter(Mandatory = $true)]
      [string] $PublisherId,
      [parameter(Mandatory = $true)]
      [string] $ExtensionId,
      [parameter(Mandatory = $true)]
      [ValidateSet('none', 'disabled')]
      [string] $ExtensionState,
      [switch] $Force
   )
   if ($Force -or $pscmdlet.ShouldProcess($ExtensionId, "Update extension")) {
      $obj = @{
         extensionId  = $ExtensionId
         publisherId  = $PublisherId
         installState = @{
            flags = $ExtensionState
         }
      }
      $body = $obj | ConvertTo-Json
      $resp = _callAPI -Method Patch -body $body -SubDomain 'extmgmt' -Resource 'extensionmanagement/installedextensions' -Version $([VSTeamVersions]::ExtensionsManagement) -ContentType "application/json"
      $item = [VSTeamExtension]::new($resp)
      Write-Output $item
   }
}
function Update-VSTeamPolicy {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true)]
      [int] $id,
      [Parameter(Mandatory = $false)]
      [guid] $type,
      [switch] $enabled,
      [switch] $blocking,
      [Parameter(Mandatory = $true)]
      [hashtable] $settings,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam -mandatory $true
   }
   process {
      $ProjectName = $PSBoundParameters["ProjectName"]
      if (-not $type) {
         $policy = Get-VSTeamPolicy -ProjectName $ProjectName -Id $id | Select-Object -First 1
         $type = $policy.type.id
      }
      $body = @{
         isEnabled  = $enabled.IsPresent;
         isBlocking = $blocking.IsPresent;
         type       = @{
            id = $type
         }
         settings   = $settings
      } | ConvertTo-Json -Depth 10 -Compress
      try {
         if ($Force -or $pscmdlet.ShouldProcess($id, "Update Policy")) {
            # Call the REST API
            $resp = _callAPI -ProjectName $ProjectName -Area 'policy' -id $id -Resource 'configurations' `
               -Method Put -ContentType 'application/json' -Body $body -Version $([VSTeamVersions]::Git)
            Write-Output $resp
         }
      }
      catch {
         _handleException $_
      }
   }
}
function Update-VSTeamProfile {
   [CmdletBinding(DefaultParameterSetName = 'Secure', SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [parameter(ParameterSetName = 'Plain', Mandatory = $true, HelpMessage = 'Personal Access Token')]
      [string] $PersonalAccessToken,
      [parameter(ParameterSetName = 'Secure', Mandatory = $true, HelpMessage = 'Personal Access Token')]
      [securestring] $SecurePersonalAccessToken,
      [switch] $Force
   )
   DynamicParam {
      # Create the dictionary
      $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
      $profileArrSet = Get-VSTeamProfile | Select-Object -ExpandProperty Name
      if ($profileArrSet) {
         $profileParam = _buildDynamicParam -ParameterName 'Name' -Mandatory $true -Position 0 -arrSet $profileArrSet
      }
      else {
         $profileParam = _buildDynamicParam -ParameterName 'Name' -Mandatory $true -Position 0
      }
      $RuntimeParameterDictionary.Add('Name', $profileParam)
      return $RuntimeParameterDictionary
   }
   process {
      $Name = $PSBoundParameters['Name']
      if ($Force -or $pscmdlet.ShouldProcess($Name, "Update-VSTeamProfile")) {
         if ($SecurePersonalAccessToken) {
            # Even when promoted for a Secure Personal Access Token you can just
            # press enter. This leads to an empty PAT so error below.
            # Convert the securestring to a normal string
            # this was the one technique that worked on Mac, Linux and Windows
            $_pat = _convertSecureStringTo_PlainText -SecureString $SecurePersonalAccessToken
         }
         else {
            $_pat = $PersonalAccessToken
         }
         $token = ''
         $authType = 'Pat'
         $encodedPat = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$_pat"))
         $profile = Get-VSTeamProfile | Where-Object Name -eq $Name
         if ($profile) {
            # See if this item is already in there
            # I am testing URL because the user may provide a different
            # name and I don't want two with the same URL.
            # The @() forces even 1 item to an array
            # Now get an array of all profiles but this one and update this one.
            $profiles = @(Get-VSTeamProfile | Where-Object Name -ne $Name)
            $newProfile = [PSCustomObject]@{
               Name    = $Name
               URL     = $profile.URL
               Type    = $authType
               Pat     = $encodedPat
               Token   = $token
               Version = $profile.Version
            }
            $profiles += $newProfile
            $contents = ConvertTo-Json $profiles
            Set-Content -Path $profilesPath -Value $contents
         }
         else {
            # This will happen when they don't have any profiles.
            Write-Warning 'Profile not found'
         }
      }
   }
}
function Update-VSTeamProject {
   [CmdletBinding(DefaultParameterSetName = 'ByName', SupportsShouldProcess = $true, ConfirmImpact = "High")]
   param(
      [string] $NewName = '',
      [string] $NewDescription = '',
      [switch] $Force,
      [Parameter(ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [string] $Id
   )
   DynamicParam {
      _buildProjectNameDynamicParam -ParameterName 'Name' -AliasName 'ProjectName' -ParameterSetName 'ByName' -Mandatory $false
   }
   process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["Name"]
      if ($id) {
         $ProjectName = $id
      }
      else {
         $id = (Get-VSTeamProject $ProjectName).id
      }
      if ($newName -eq '' -and $newDescription -eq '') {
         # There is nothing to do
         Write-Verbose 'Nothing to update'
         return
      }
      if ($Force -or $pscmdlet.ShouldProcess($ProjectName, "Update Project")) {
         # At the end we return the project and need it's name
         # this is used to track the final name.
         $finalName = $ProjectName
         if ($newName -ne '' -and $newDescription -ne '') {
            $finalName = $newName
            $msg = "Changing name and description"
            $body = '{"name": "' + $newName + '", "description": "' + $newDescription + '"}'
         }
         elseif ($newName -ne '') {
            $finalName = $newName
            $msg = "Changing name"
            $body = '{"name": "' + $newName + '"}'
         }
         else {
            $msg = "Changing description"
            $body = '{"description": "' + $newDescription + '"}'
         }
         # Call the REST API
         $resp = _callAPI -Area 'projects' -id $id `
            -Method Patch -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::Core)
         _trackProjectProgress -resp $resp -title 'Updating team project' -msg $msg
         # Invalidate any cache of projects.
         [VSTeamProjectCache]::timestamp = -1
         # Return the project now that it has been updated
         return Get-VSTeamProject -Id $finalName
      }
   }
}
function Update-VSTeamRelease {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [int] $Id,
      [Parameter(Mandatory = $true)]
      [PSCustomObject] $Release,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = $Release | ConvertTo-Json -Depth 99
      if ($Force -or $pscmdlet.ShouldProcess($Id, "Update Release")) {
         # Call the REST API
         $resp = _callAPI -ProjectName $projectName -SubDomain vsrm -Area release -Resource releases -Id $id  `
            -Method Put -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::Release)
         Write-Output $resp
      }
   }
}
function Update-VSTeamReleaseDefinition {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium", DefaultParameterSetName = 'JSON')]
   Param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'File')]
      [string] $InFile,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'JSON')]
      [string] $ReleaseDefinition,
      # Forces the command without confirmation
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      if ($Force -or $pscmdlet.ShouldProcess('', "Update Release Definition")) {
         # Call the REST API
         if ($InFile) {
            _callAPI -Method Put -ProjectName $ProjectName -SubDomain vsrm -Area Release -Resource definitions -Version $([VSTeamVersions]::Release) -InFile $InFile -ContentType 'application/json' | Out-Null
         }
         else {
            _callAPI -Method Put -ProjectName $ProjectName -SubDomain vsrm -Area Release -Resource definitions -Version $([VSTeamVersions]::Release) -Body $ReleaseDefinition -ContentType 'application/json' | Out-Null
         }
      }
   }
}
function Update-VSTeamServiceEndpoint {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $id,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [hashtable] $object,
      [switch] $Force
   )
   DynamicParam {
      _buildProjectNameDynamicParam
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = $object | ConvertTo-Json
      if ($Force -or $pscmdlet.ShouldProcess($id, "Update Service Endpoint")) {
         # Call the REST API
         $resp = _callAPI -ProjectName $projectName -Area 'distributedtask' -Resource 'serviceendpoints' -Id $id  `
            -Method Put -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::DistributedTask)
         _trackServiceEndpointProgress -projectName $projectName -resp $resp -title 'Updating Service Endpoint' -msg "Updating $id"
         return Get-VSTeamServiceEndpoint -ProjectName $ProjectName -id $id
      }
   }
}
function Update-VSTeamUserEntitlement
{
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High", DefaultParameterSetName = 'ByEmail')]
   param (
      [Parameter(ParameterSetName = 'ById', Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
      [Alias('UserId')]
      [string]$Id,
      [Parameter(ParameterSetName = 'ByEmail', Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
      [Alias('UserEmail')]
      [string]$Email,
      [Parameter(Mandatory = $true)]
      [ValidateSet('Advanced', 'EarlyAdopter', 'Express', 'None', 'Professional', 'StakeHolder')]
      [string]$License,
      [switch]$Force
   )
   process {
      # This will throw if this account does not support MemberEntitlementManagement
      _supportsMemberEntitlementManagement
      if ($email)
      {
         # We have to go find the id
         $user = Get-VSTeamUserEntitlement -Top 10000 | Where-Object email -eq $email
         if (-not$user)
         {
            throw "Could not find user with an email equal to $email"
         }
         $id = $user.id
      }
      else
      {
         $user = Get-VSTeamUserEntitlement -Id $id
      }
      $licenseOld = $user.accessLevel.accountLicenseType
      $obj = @{
         from = ""
         op = "replace"
         path = "/accessLevel"
         value = @{
            accountLicenseType = $License
            licensingSource = "account"
         }
      }
      $body = ConvertTo-Json -InputObject @($obj)
      if ($Force -or $PSCmdlet.ShouldProcess("$( $user.userName ) ($( $user.email ))", "Update user"))
      {
         # Call the REST API
         _callAPI -Method Patch -Body $body -SubDomain 'vsaex' -Resource 'userentitlements' -Id $id -Version $([VSTeamVersions]::MemberEntitlementManagement) -ContentType 'application/json-patch+json' | Out-Null
         Write-Output "Updated user license for $( $user.userName ) ($( $user.email )) from ($licenseOld) to ($License)"
      }
   }
}
function Update-VSTeamVariableGroup {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Id,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Name,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [string] $Description,
      [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
      [hashtable] $Variables,
      [switch] $Force
   )
   DynamicParam {
      $dp = _buildProjectNameDynamicParam
      if ([VSTeamVersions]::Version -ne "TFS2017") {
         $ParameterName = 'Type'
         $rp = _buildDynamicParam -ParameterName $ParameterName -arrSet ('Vsts', 'AzureKeyVault') -Mandatory $true
         $dp.Add($ParameterName, $rp)
         $ParameterName = 'ProviderData'
         $rp = _buildDynamicParam -ParameterName $ParameterName -Mandatory $false -ParameterType ([hashtable])
         $dp.Add($ParameterName, $rp)
      }
      return $dp
   }
   Process {
      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]
      $body = @{
         name        = $Name
         description = $Description
         variables   = $Variables
      }
      if ([VSTeamVersions]::Version -ne "TFS2017") {
         $Type = $PSBoundParameters['Type']
         $body.Add("type", $Type)
         $ProviderData = $PSBoundParameters['ProviderData']
         if ($null -ne $ProviderData) {
            $body.Add("providerData", $ProviderData)
         }
      }
      $body = $body | ConvertTo-Json
      if ($Force -or $pscmdlet.ShouldProcess($Id, "Update Variable Group")) {
         # Call the REST API
         $resp = _callAPI -ProjectName $projectName -Area 'distributedtask' -Resource 'variablegroups' -Id $Id  `
            -Method Put -ContentType 'application/json' -body $body -Version $([VSTeamVersions]::VariableGroups)
         Write-Verbose $resp
         return Get-VSTeamVariableGroup -ProjectName $ProjectName -Id $Id
      }
   }
}
function Update-VSTeamWorkItem {
   [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
   param(
      [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
      [int] $Id,
      [Parameter(Mandatory = $false)]
      [string]$Title,
      [Parameter(Mandatory = $false)]
      [string]$Description,
      [Parameter(Mandatory = $false)]
      [string]$IterationPath,
      [Parameter(Mandatory = $false)]
      [string]$AssignedTo,
      [Parameter(Mandatory = $false)]
      [hashtable]$AdditionalFields,
      [switch] $Force
   )
   Process {
      # Constructing the contents to be send.
      # Empty parameters will be skipped when converting to json.
      [Array]$body = @(
         @{
            op    = "add"
            path  = "/fields/System.Title"
            value = $Title
         }
         @{
            op    = "add"
            path  = "/fields/System.Description"
            value = $Description
         }
         @{
            op    = "add"
            path  = "/fields/System.IterationPath"
            value = $IterationPath
         }
         @{
            op    = "add"
            path  = "/fields/System.AssignedTo"
            value = $AssignedTo
         }) | Where-Object { $_.value }
      #this loop must always come after the main work item fields defined in the function parameters
      if ($AdditionalFields) {
         foreach ($fieldName in $AdditionalFields.Keys) {
            #check that main properties are not added into the additional fields hashtable
            $foundFields = $body | Where-Object { $null -ne $_ -and $_.path -like "*$fieldName" }
            if ($null -ne $foundFields) {
               throw "Found duplicate field '$fieldName' in parameter AdditionalFields, which is already a parameter. Please remove it."
            }
            else {
               $body += @{
                  op    = "add"
                  path  = "/fields/$fieldName"
                  value = $AdditionalFields[$fieldName]
               }
            }
         }
      }
      # It is very important that even if the user only provides
      # a single value above that the item is an array and not
      # a single object or the call will fail.
      # You must call ConvertTo-Json passing in the value and not
      # not using pipeline.
      # https://stackoverflow.com/questions/18662967/convertto-json-an-array-with-a-single-item
      $json = ConvertTo-Json @($body) -Compress
      # Call the REST API
      if ($Force -or $pscmdlet.ShouldProcess($Id, "Update-WorkItem")) {
         $resp = _callAPI -Area 'wit' -Resource 'workitems' `
            -Version $([VSTeamVersions]::Core) -id $Id -Method Patch `
            -ContentType 'application/json-patch+json' -Body $json
         _applyTypesToWorkItem -item $resp
         return $resp
      }
   }
}

