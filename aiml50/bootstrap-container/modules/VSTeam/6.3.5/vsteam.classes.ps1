using namespace Microsoft.PowerShell.SHiPS
  class VSTeamVersions {
   static [string] $Account = $env:TEAM_ACCT
   static [string] $DefaultProject = $env:TEAM_PROJECT
   static [string] $Version = $(If ($env:TEAM_VERSION) {$env:TEAM_VERSION} Else {"TFS2017"})
   static [string] $Build = '3.0'
   static [string] $Release = '3.0-preview'
   static [string] $Core = '3.0'
   static [string] $Git = '3.0'
   static [string] $DistributedTask = '3.0-preview'
   static [string] $VariableGroups = '3.2-preview.1'
   static [string] $Tfvc = '3.0'
   static [string] $Packaging = ''
   static [string] $MemberEntitlementManagement = ''
   static [string] $ExtensionsManagement = ''
   static [string] $ServiceFabricEndpoint = ''
   static [string] $ModuleVersion = $null
   static [string] $Graph = ''
}
# Dynamic parameters get called alot. This can cause
# multiple calls to TFS/VSTS for a single function call
# so I am going to try and cache the values.
class VSTeamProjectCache {
   static [int] $timestamp = -1
   static [object] $projects = $null
}
# Dynamic parameters get called alot. This can cause
# multiple calls to TFS/VSTS for a single function call
# so I am going to try and cache the values.
class VSTeamProcessCache {
   static [int] $timestamp = -1
   static [object] $processes = $null
}
class VSTeamDirectory : SHiPSDirectory {
   [object] hidden $_internalObj = $null
   [string] hidden $DisplayMode = 'd-----'
   [string]$ProjectName = $null
   VSTeamDirectory(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name) {
      $this.ProjectName = $ProjectName
   }
   [void] hidden AddTypeName(
      [string] $name
   ) {
      $this.PSObject.TypeNames.Insert(0, $name)
   }
   [void] hidden SetProp(
      [object]$other,
      [string]$prop
   ) {
      if ( $other.PSObject.Properties.name -match $prop ) {
         $this.PSObject.Properties[$prop].value = $other.PSObject.Properties[$prop].value
      }
   }
}
class VSTeamLeaf : SHiPSLeaf {
   [object] hidden $_internalObj = $null
   [string]$ID = $null
   [string]$ProjectName = $null
   [string] hidden $DisplayMode = '------'
   VSTeamLeaf(
      [string]$Name,
      [string]$ID,
      [string]$ProjectName
   ) : base($Name) {
      $this.ID = $ID
      $this.ProjectName = $ProjectName
   }
   [void] hidden AddTypeName(
      [string] $name
   ) {
      $this.PSObject.TypeNames.Insert(0, $name)
   }
   [void] hidden SetProp(
      [object]$other,
      [string]$prop
   ) {
      if ( $other.PSObject.Properties.name -match $prop ) {
         $this.PSObject.Properties[$prop].value = $other.PSObject.Properties[$prop].value
      }
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamPools : VSTeamDirectory {
   VSTeamPools(
      [string]$Name
   ) : base($Name, $null) {
      $this.AddTypeName('Team.Pools')
      $this.DisplayMode = 'd-r-s-'
   }
   [object[]] GetChildItem() {
      $pools = Get-VSTeamPool -ErrorAction SilentlyContinue | Sort-Object name
      $objs = @()
      foreach ($pool in $pools) {
         $pool.AddTypeName('Team.Provider.Pool')
         $objs += $pool
      }
      return $objs
   }
}
class VSTeamInstallState {
   [string]$flags
   [string]$lastUpdated
   [object] hidden $_internalObj = $null
   VSTeamInstallState(
      [object]$obj
   ) {
      $this.flags = $obj.flags
      $this.lastUpdated = $obj.lastUpdated
      $this._internalObj = $obj
      $this.PSObject.TypeNames.Insert(0, 'Team.InstallState')
   }
   [string]ToString() {
         return "Flags: $($this.flags), Last Updated: $($this.lastUpdated)"
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamExtensions : VSTeamDirectory {
   VSTeamExtensions(
      [string]$Name
   ) : base($Name, $null) {
      $this.AddTypeName('Team.Extensions')
      $this.DisplayMode = 'd-r-s-'
   }
   [object[]] GetChildItem() {
      $extensions = Get-VSTeamExtension -ErrorAction SilentlyContinue | Sort-Object name
      $objs = @()
      foreach ($extension in $extensions) {
         $extension.AddTypeName('Team.Provider.Extension')
         $objs += $extension
      }
      return $objs
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamFeeds : VSTeamDirectory {
   VSTeamFeeds(
      [string]$Name
   ) : base($Name, $null) {
      $this.AddTypeName('Team.Feeds')
      $this.DisplayMode = 'd-r-s-'
   }
   [object[]] GetChildItem() {
      $feeds = Get-VSTeamFeed -ErrorAction SilentlyContinue | Sort-Object name
      $objs = @()
      foreach ($feed in $feeds) {
         $feed.AddTypeName('Team.Provider.Feed')
         $objs += $feed
      }
      return $objs
   }
}
class VSTeamAgent : VSTeamDirectory {
   [string]$version
   [string]$status
   [string]$os
   [bool]$enabled
   [int]$poolId
   [int]$agentId
   [PSCustomObject]$systemCapabilities
   VSTeamAgent (
      [object]$obj,
      [int]$poolId
   ) : base($obj.name, $null) {
      $this.poolId = $poolId
      $this.agentId = $obj.Id
      $this.status = $obj.status
      $this.enabled = $obj.enabled
      $this.version = $obj.version
      $this.systemCapabilities = $obj.systemCapabilities
      if ($obj.PSObject.Properties.Match('osDescription').count -gt 0) {
         $this.os = $obj.osDescription
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.Agent')
   }
   [object[]] GetChildItem() {
      $jobRequests = Get-VSTeamJobRequest -PoolId $this.poolId -AgentId $this.agentId -ErrorAction SilentlyContinue
      $objs = @()
      foreach ($item in $jobRequests) {
         $item.AddTypeName('Team.Provider.JobRequest')
         $objs += $item
      }
      return $objs
   }
}
class VSTeamTask : VSTeamLeaf {
   [string]$LogURL = $null
   [string]$Status = $null
   VSTeamTask (
      [object]$obj,
      [string]$ProjectName
   ) : base($obj.Name, $obj.id, $ProjectName) {
      $this.LogURL = $obj.logUrl
      $this.Status = $obj.status
      $this._internalObj = $obj
      $this.AddTypeName('Team.Task')
   }
}
[SHiPSProvider(UseCache = $false)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamAttempt: VSTeamDirectory {
   [string]$Status = $null
   [int]$ReleaseId = $null
   [int]$Attemptid = $null
   [int]$Environmentid = $null
   VSTeamAttempt (
      [string]$Name,
      [string]$Status,
      [string]$Projectname,
      [int]$ReleaseId,
      [int]$Environmentid,
      [int]$Attemptid
   ) : base($Name, $Projectname) {
      $this.Status = $Status
      $this.Attemptid = $Attemptid
      $this.ReleaseId = $ReleaseId
      $this.Environmentid = $Environmentid
      $this.AddTypeName('Team.Attempt')
   }
   [object[]] GetChildItem() {
      $Tasks = Get-VSTeamRelease -ProjectName $this.projectName -Id $this.releaseId -Expand Environments `
         | Select-Object -ExpandProperty environments `
         | Where-Object id -eq $this.environmentid `
         | Select-Object -ExpandProperty deploysteps `
         | Where-Object id -eq $this.attemptid `
         | Select-Object @{Name = "Tasks"; Expression = { $_.releaseDeployPhases.deploymentJobs.tasks}} `
         | Select-Object -ExpandProperty tasks
      $obj = @()
      foreach ($Task in $Tasks) {
         $item = [VSTeamTask]::new($Task, $this.projectName)
         $item.AddTypeName('Team.Provider.Task')
         $obj += $item
      }
      return $obj
   }
}
class VSTeamUserEntitlement : VSTeamLeaf {
   [string]$DisplayName
   [string]$UniqueName
   VSTeamUserEntitlement(
      [object]$obj,
      [string]$ProjectName
   ) : base($obj.displayName, $obj.id, $ProjectName) {
      $this.UniqueName = $obj.uniqueName
      $this.DisplayName = $obj.displayName
      $this._internalObj = $obj
      $this.AddTypeName('Team.UserEntitlement')
   }
   [string]ToString() {
      return $this.DisplayName
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamPool : VSTeamDirectory {
   [int]$id
   [bool]$isHosted = $false
   [VSTeamUserEntitlement]$owner = $null
   [VSTeamUserEntitlement]$CreatedBy = $null
   [int]$count
   VSTeamPool(
      [object]$obj
   ) : base($obj.Name, $null) {
      $this.id = $obj.id
      if ($obj.PSObject.Properties.Match('isHosted').count -gt 0) {
         $this.isHosted = $obj.isHosted
      }
      if ($obj.PSObject.Properties.Match('size').count -gt 0) {
         $this.count = $obj.size
      }
      if ($obj.PSObject.Properties.Match('createdBy').count -gt 0 -and
         $null -ne $obj.createdBy) {
         $this.CreatedBy = [VSTeamUserEntitlement]::new($obj.createdBy, $null)
      }
      if ($obj.PSObject.Properties.Match('owner').count -gt 0 -and
          $null -ne $obj.owner) {
         $this.owner = [VSTeamUserEntitlement]::new($obj.owner, $null)
      }
      $this.AddTypeName('Team.Pool')
      if ($this.isHosted) {
         $this.DisplayMode = 'd-r-s-'
      }
      else {
         $this.DisplayMode = 'd-----'
      }
      $this._internalObj = $obj
   }
   [object[]] GetChildItem() {
      $agents = Get-VSTeamAgent -PoolId $this.id -ErrorAction SilentlyContinue
      $objs = @()
      foreach ($agent in $agents) {
         $agent.AddTypeName('Team.Provider.Agent')
         $objs += $agent
      }
      return $objs
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamQueue : VSTeamLeaf {
   [string]$poolName
   [VSTeamPool]$pool
   VSTeamQueue(
      [object]$obj,
      [string]$Projectname
   ) : base($obj.name, $obj.id, $Projectname) {
      if ($obj.PSObject.Properties.Match('poolName').count -gt 0) {
         $this.poolName = $obj.poolName
      }
      if ($obj.PSObject.Properties.Match('pool').count -gt 0) {
         $this.pool = [VSTeamPool]::new($obj.pool)
         $this.poolName = $obj.pool.name
      }
      $this.AddTypeName('Team.Queue')
      $this._internalObj = $obj
   }
}
[SHiPSProvider(UseCache = $false)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamEnvironment : VSTeamDirectory {
   [string]$Status = $null
   [int]$ReleaseId = $null
   [int]$Environmentid = $null
   VSTeamEnvironment (
      [string]$Name,
      [string]$Status,
      [string]$ProjectName,
      [int]$ReleaseId,
      [int]$Environmentid
   ) : base($Name, $ProjectName) {
      $this.Status = $Status
      $this.ReleaseId = $ReleaseId
      $this.Environmentid = $Environmentid
      $this.AddTypeName('Team.Environment')
   }
   [object[]] GetChildItem() {
      $attempts = Get-VSTeamRelease -ProjectName $this.ProjectName -Id $this.releaseId -Expand Environments `
         | Select-Object -ExpandProperty environments `
         | Where-Object id -eq $this.environmentid `
         | Select-Object -ExpandProperty deploysteps
      $objs = @()
      foreach ($attempt in $attempts) {
         $item = [VSTeamAttempt]::new(
            'Attempt ' + $attempt.Attempt,
            $attempt.status,
            $this.projectname,
            $this.releaseId,
            $this.environmentid,
            $attempt.id)
         $item.AddTypeName('Team.Provider.Attempt')
         $objs += $item
      }
      return $objs
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamRelease : VSTeamDirectory {
   [string]$ID = $null
   [string]$Status = $null
   [object]$Environments = $null
   [VSTeamUserEntitlement]$CreatedBy = $null
   [VSTeamUserEntitlement]$RequestedFor = $null
   [VSTeamUserEntitlement]$ModifiedBy = $null
   [string]$DefinitionName = $null
   [object]$releaseDefinition = $null
   [datetime]$CreatedOn
   VSTeamRelease (
      [object]$obj,
      [string]$ProjectName
   ) : base($obj.name, $ProjectName) {
      $this.ID = $obj.id
      $this.Status = $obj.status
      $this.CreatedOn = $obj.createdOn
      $this.Environments = $obj.environments
      $this.releaseDefinition = $obj.releaseDefinition
      $this.DefinitionName = $obj.releaseDefinition.name
      $this.CreatedBy = [VSTeamUserEntitlement]::new($obj.createdBy, $ProjectName)
      $this.ModifiedBy = [VSTeamUserEntitlement]::new($obj.modifiedBy, $ProjectName)
      if ($obj.PSObject.Properties.Match('RequestedFor').count -gt 0) {
         $this.RequestedFor = [VSTeamUserEntitlement]::new($obj.requestedFor, $ProjectName)
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.Release')
   }
   [object[]] GetChildItem() {
      $envs = Get-VSTeamRelease -ProjectName $this.projectName -Id $this.id -Expand Environments | Select-Object -ExpandProperty Environments
      $obj = @()
      foreach ($env in $envs) {
         $obj += [VSTeamEnvironment]::new(
            $env.name,
            $env.status,
            $this.projectname,
            $this.id,
            $env.Id)
      }
      return $obj
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamReleases : VSTeamDirectory {
   VSTeamReleases(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.Releases')
   }
   [object[]] GetChildItem() {
      $releases = Get-VSTeamRelease -ProjectName $this.ProjectName -Expand Environments -ErrorAction SilentlyContinue
      $objs = @()
      foreach ($release in $releases) {
         $item = [VSTeamRelease]::new(
            $release,
            $this.ProjectName)
         $item.AddTypeName('Team.Provider.Release')
         $objs += $item
      }
      return $objs
   }
}
class VSTeamBuild : VSTeamLeaf {
   [datetime]$StartTime
   [string]$Status = $null
   [string]$Result = $null
   [string]$BuildNumber = $null
   [string]$BuildDefinition = $null
   [VSTeamUserEntitlement]$RequestedBy = $null
   [VSTeamUserEntitlement]$RequestedFor = $null
   [VSTeamUserEntitlement]$LastChangedBy = $null
   VSTeamBuild (
      [object]$obj,
      [string]$Projectname
   ) : base($obj.buildNumber, $obj.id.ToString(), $Projectname) {
      $this.Status = $obj.status
      $this.Result = $obj.result
      $this.StartTime = $obj.startTime
      $this.BuildNumber = $obj.buildNumber
      $this.BuildDefinition = $obj.definition.name
      $this.RequestedBy = [VSTeamUserEntitlement]::new($obj.requestedBy, $Projectname)
      $this.RequestedFor = [VSTeamUserEntitlement]::new($obj.requestedFor, $Projectname)
      $this.LastChangedBy = [VSTeamUserEntitlement]::new($obj.lastChangedBy, $Projectname)
      $this._internalObj = $obj
      $this.AddTypeName('Team.Build')
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamBuildDefinitions : VSTeamDirectory {
   VSTeamBuildDefinitions(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.BuildDefinitions')
   }
   [object[]] GetChildItem() {
      $items = Get-VSTeamBuildDefinition -ProjectName $this.ProjectName -ErrorAction SilentlyContinue
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.BuildDefinition')
         if ($item._internalObj.PSObject.Properties.Match('process').count -gt 0) {
            if ($item.Process.type -eq 1) {
               $item.Process.AddTypeName('Team.Provider.BuildDefinitionPhasedProcess')
               foreach ($phase in $item.Process.phases) {
                  $phase.AddTypeName('Team.Provider.BuildDefinitionProcessPhase')
                  foreach ($step in $phase.steps) {
                     $step.AddTypeName('Team.Provider.BuildDefinitionProcessPhaseStep')
                  }
               }
            }
            else {
               $item.Process.AddTypeName('Team.Provider.BuildDefinitionProcess')
            }
         }
         if ($item._internalObj.PSObject.Properties.Match('build').count -gt 0) {
            foreach ($step in $item.Steps) {
               $step.AddTypeName('Team.Provider.BuildDefinitionProcessPhaseStep')
            }
         }
      }
      return $items
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamBuilds : VSTeamDirectory {
   VSTeamBuilds(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.Builds')
   }
   [object[]] GetChildItem() {
      $builds = Get-VSTeamBuild -ProjectName $this.ProjectName -ErrorAction SilentlyContinue
      $objs = @()
      foreach ($build in $builds) {
         $item = [VSTeamBuild]::new(
            $build,
            $build.project.name)
         $item.AddTypeName('Team.Provider.Build')
         $objs += $item
      }
      return $objs
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamQueues : VSTeamDirectory {
   VSTeamQueues(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.Queues')
   }
   [object[]] GetChildItem() {
      $items = Get-VSTeamQueue -ProjectName $this.ProjectName -ErrorAction SilentlyContinue
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.Queue')
      }
      return $items
   }
}
[SHiPSProvider(UseCache = $true)]
class VSTeamRepositories : VSTeamDirectory {
   VSTeamRepositories(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.Repositories')
   }
   [object[]] GetChildItem() {
      $items = Get-VSTeamGitRepository -ProjectName $this.ProjectName -ErrorAction SilentlyContinue
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.Repository')
      }
      return $items
   }
}
[SHiPSProvider(UseCache = $true)]
class VSTeamTeams : VSTeamDirectory {
   VSTeamTeams(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.Teams')
   }
   [object[]] GetChildItem() {
      $items = Get-VSTeam -ProjectName $this.ProjectName -ErrorAction SilentlyContinue
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.Team')
      }
      return $items
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamProject : VSTeamDirectory {
   [int]$Revision = 0
   [string]$ID = $null
   [string]$URL = $null
   [string]$State = $null
   [string]$Visibility = $null
   [string]$Description = $null
   VSTeamProject (
      [object]$obj
   ) : base($obj.name, $obj.name) {
      $this.ID = $obj.id
      $this.URL = $obj.url
      $this.State = $obj.state
      $this.Revision = $obj.revision
      $this.Visibility = $obj.visibility
      if ($obj.PSObject.Properties.Match('description').count -gt 0) {
         $this.Description = $obj.description
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.Project')
   }
   [string]ToString() {
      return $this.Name
   }
   [object[]] GetChildItem() {
      return @(
         [VSTeamBuildDefinitions]::new('Build Definitions', $this.Name),
         [VSTeamBuilds]::new('Builds', $this.Name),
         [VSTeamQueues]::new('Queues', $this.Name),
         [VSTeamReleaseDefinitions]::new('Release Definitions', $this.Name),
         [VSTeamReleases]::new('Releases', $this.Name),
         [VSTeamRepositories]::new('Repositories', $this.Name),
         [VSTeamTeams]::new('Teams', $this.Name)
      )
   }
}
[SHiPSProvider(UseCache = $true)]
class VSTeamGitRepository : VSTeamDirectory {
   [long]$Size = 0
   [string]$ID = $null
   [string]$URL = $null
   [string]$sshURL = $null
   [string]$RemoteURL = $null
   [string]$DefaultBranch = $null
   [VSTeamProject]$Project = $null
   VSTeamGitRepository(
      [object]$obj,
      [string]$ProjectName
   ) : base($obj.name, $ProjectName) {
      $this.ID = $obj.id
      $this.URL = $obj.Url
      if ($obj.PSObject.Properties.Match('size').count -gt 0) {
         $this.Size = $obj.size
      }
      if ($obj.PSObject.Properties.Match('sshUrl').count -gt 0) {
         $this.sshURL = $obj.sshUrl
      }
      if ($obj.PSObject.Properties.Match('defaultBranch').count -gt 0) {
         $this.DefaultBranch = $obj.defaultBranch
      }
      if ($obj.PSObject.Properties.Match('remoteURL').count -gt 0) {
         $this.RemoteURL = $obj.remoteURL
      }
      if ($obj.PSObject.Properties.Match('project').count -gt 0) {
         $this.Project = [VSTeamProject]::new($obj.project)
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.Repository')
   }
   [object[]] GetChildItem() {
      $items = Get-VSTeamGitRef -ProjectName $this.ProjectName -RepositoryID $this.id -ErrorAction SilentlyContinue
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.GitRef')
      }
      return $items
   }
}
class VSTeamBuildDefinitionProcessPhaseStep : VSTeamLeaf {
   [bool]$Enabled = $true
   [bool]$ContinueOnError = $false
   [bool]$AlwaysRun = $true
   [int]$TimeoutInMinutes = 0
   [string]$Condition = $null
   [object]$Inputs = $null
   [object]$Task = $null
   VSTeamBuildDefinitionProcessPhaseStep(
      [object]$obj,
      [int]$stepNo,
      [string]$Projectname
   ) : base($obj.displayName, $stepNo.ToString(), $Projectname) {
      $this.Enabled = $obj.enabled
      $this.ContinueOnError = $obj.continueOnError
      $this.AlwaysRun = $obj.alwaysRun
      $this.TimeoutInMinutes = $obj.timeoutInMinutes
      $this.Inputs = $obj.inputs
      $this.Task = $obj.task
      if ($obj.PSObject.Properties.Match('condition').count -gt 0) {
         $this.Condition = $obj.condition
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.BuildDefinitionProcessPhaseStep')
   }
}
class VSTeamBuildDefinitionProcessPhase : VSTeamDirectory {
   [string]$Condition = $null
   [object]$Target = $null
   [string]$JobAuthorizationScope = $null
   [int]$JobCancelTimeoutInMinutes = -1
   [VSTeamBuildDefinitionProcessPhaseStep[]] $Steps
   [int]$StepCount = 0
   VSTeamBuildDefinitionProcessPhase(
      [object]$obj,
      [string]$Projectname
   ) : base($obj.name, $Projectname) {
      $this.Target = $obj.target
      $this.JobAuthorizationScope = $obj.jobAuthorizationScope
      if ($obj.PSObject.Properties.Match('condition').count -gt 0) {
         $this.Condition = $obj.condition
      }
      if ($obj.PSObject.Properties.Match('jobCancelTimeoutInMinutes').count -gt 0) {
         $this.JobCancelTimeoutInMinutes = $obj.jobCancelTimeoutInMinutes
      }
      $this.StepCount = 0
      if ( $obj.PSObject.Properties.name -match 'steps' ) {
         foreach ($step in $obj.steps) {
            $this.StepCount++
            $this.Steps += [VSTeamBuildDefinitionProcessPhaseStep]::new($step, $this.StepCount, $Projectname)
         }
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.BuildDefinitionProcessPhase')
   }
   [object[]] GetChildItem() {
      return $this.Steps
   }
}
[SHiPSProvider(UseCache = $true)]
class VSTeamBuildDefinitionProcess : VSTeamDirectory {
   [int]$type
   [string]$yamlFilename
   [VSTeamBuildDefinitionProcessPhase[]]$Phases
   VSTeamBuildDefinitionProcess (
      [object]$obj,
      [string]$Projectname
   ) : base("Process", $Projectname) {
      $this.type = $obj.type
      if ($this.type -eq 1) {
         foreach ($phase in $obj.phases) {
            $this.Phases += [VSTeamBuildDefinitionProcessPhase]::new($phase, $Projectname)
         }
         $this.AddTypeName('Team.BuildDefinitionPhasedProcess')
      }
      else {
         $this.yamlFilename = $obj.yamlFilename
         $this.DisplayMode = '------'
         $this.AddTypeName('Team.BuildDefinitionYamlProcess')
      }
      $this._internalObj = $obj
   }
   [string]ToString() {
      if ($this.type -eq 1) {
         return "Number of phases: $($this.Phases.Length)"
      }
      else {
         return $this.yamlFilename
      }
   }
}
[SHiPSProvider(UseCache = $false)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamBuildDefinition : VSTeamDirectory {
   [int]$id = -1
   [int]$Revision = -1
   [string]$Path = $null
   [object]$Tags = $null
   [object]$Options = $null
   [object]$Triggers = $null
   [object]$Variables = $null
   [object]$Repository = $null
   [VSTeamQueue]$Queue = $null
   [object]$RetentionRules = $null
   [VSTeamUserEntitlement]$AuthoredBy = $null
   [string]$BuildNumberFormat = $null
   [int]$JobCancelTimeoutInMinutes = -1
   [string]$JobAuthorizationScope = $null
   [VSTeamGitRepository]$GitRepository = $null
   [datetime]$CreatedOn = [datetime]::MinValue
   [VSTeamBuildDefinitionProcess]$Process = $null
   [VSTeamBuildDefinitionProcessPhaseStep[]]$Steps = $null
   [string[]]$Demands = $null
   VSTeamBuildDefinition (
      [object]$obj,
      [string]$Projectname
   ) : base($obj.name, $Projectname) {
      $this.id = $obj.id
      $this.Path = $obj.path
      $this.Revision = $obj.revision
      if ( $obj.PSObject.Properties.name -match 'Variables' ) {
         $this.Variables = $obj.variables
      }
      $this.CreatedOn = $obj.createdDate
      $this.JobAuthorizationScope = $obj.jobAuthorizationScope
      $this.AuthoredBy = [VSTeamUserEntitlement]::new($obj.authoredBy, $Projectname)
      if ($obj.PSObject.Properties.Match('queue').count -gt 0) {
         $this.Queue = [VSTeamQueue]::new($obj.queue, $Projectname)
      }
      if ($obj.PSObject.Properties.Match('jobCancelTimeoutInMinutes').count -gt 0) {
         $this.JobCancelTimeoutInMinutes = $obj.jobCancelTimeoutInMinutes
      }
      if ($obj.PSObject.Properties.Match('triggers').count -gt 0) {
         $this.Triggers = $obj.triggers
      }
      if ($obj.PSObject.Properties.Match('retentionRules').count -gt 0) {
         $this.RetentionRules = $obj.retentionRules
      }
      if ($obj.PSObject.Properties.Match('demands').count -gt 0) {
         $this.Demands = $obj.demands
      }
      if ($obj.PSObject.Properties.Match('options').count -gt 0) {
         $this.Options = $obj.options
      }
      if ($obj.PSObject.Properties.Match('tags').count -gt 0) {
         $this.Tags = $obj.tags
      }
      if ($obj.PSObject.Properties.Match('repository').count -gt 0) {
         if($obj.repository.type -eq "TfsGit") {
            $this.GitRepository = [VSTeamGitRepository]::new($obj.repository, $Projectname)
         } else {
            $this.Repository = $obj.repository
         }
      }
      if ($obj.PSObject.Properties.Match('process').count -gt 0) {
         $this.Process = [VSTeamBuildDefinitionProcess]::new($obj.process, $Projectname)
      }
      if ($obj.PSObject.Properties.Match('build').count -gt 0) {
         $stepNo = 0
         foreach ($step in $obj.build) {
            $stepNo++
            $this.Steps += [VSTeamBuildDefinitionProcessPhaseStep]::new($step, $stepNo, $Projectname)
         }
      }
      if ($obj.PSObject.Properties.Match('BuildNumberFormat').count -gt 0) {
         $this.BuildNumberFormat = $obj.buildNumberFormat
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.BuildDefinition')
   }
   [object[]] GetChildItem() {
      if ($null -ne $this.Steps) {
         return $this.Steps
      }
      if ($this.Process.Type -eq 1) {
         return $this.Process.Phases
      }
      else {
         return $this.Process
      }
   }
}
class VSTeamExtension : VSTeamLeaf {
   [string]$publisherId
   [string]$extensionId
   [string]$publisherName
   [string]$version
   [VSTeamInstallState]$installState
   VSTeamExtension (
      [object]$obj
   ) : base($obj.extensionName, $obj.extensionId, $null) {
      $this.extensionId = $obj.extensionId
      $this.publisherId = $obj.publisherId
      $this.publisherName = $obj.publisherName
      $this.version = $obj.version
      $this.installState = [VSTeamInstallState]::new($obj.installState)
      $this._internalObj = $obj
      $this.AddTypeName('Team.Extension')
   }
}
class VSTeamFeed : VSTeamLeaf {
   [string]$description
   [string]$url
   [bool]$upstreamEnabled = $false
   [PSCustomObject]$upstreamSources
   VSTeamFeed (
      [object]$obj
   ) : base($obj.name, $obj.Id, $null) {
      $this.url = $obj.url
      $this.description = $obj.description
      $this.upstreamSources = $obj.upstreamSources
      if ($obj.PSObject.Properties.Match('upstreamEnabled').count -gt 0) {
         $this.upstreamEnabled = $obj.upstreamEnabled
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.Feed')
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamUsers : VSTeamDirectory {
   VSTeamUsers(
      [string]$Name
   ) : base($Name, $null) {
      $this.AddTypeName('Team.Users')
      $this.DisplayMode = 'd-r-s-'
   }
   [object[]] GetChildItem() {
      $Users = Get-VSTeamUser -ErrorAction SilentlyContinue | Sort-Object name
      $objs = @()
      foreach ($User in $Users) {
         $User.AddTypeName('Team.Provider.User')
         $objs += $User
      }
      return $objs
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamGroups : VSTeamDirectory {
   VSTeamGroups(
      [string]$Name
   ) : base($Name, $null) {
      $this.AddTypeName('Team.Groups')
      $this.DisplayMode = 'd-r-s-'
   }
   [object[]] GetChildItem() {
      $Groups = Get-VSTeamGroup -ErrorAction SilentlyContinue | Sort-Object name
      $objs = @()
      foreach ($Group in $Groups) {
         $Group.AddTypeName('Team.Provider.Group')
         $objs += $Group
      }
      return $objs
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamPermissions : VSTeamDirectory {
   VSTeamPermissions(
      [string]$Name
   ) : base($Name, $null) {
      $this.AddTypeName('Team.Permissions')
      $this.DisplayMode = 'd-r-s-'
   }
   [object[]] GetChildItem() {
      $groupsAndUsers = @(
         [VSTeamGroups]::new('Groups'),
         [VSTeamUsers]::new('Users')
      )
      return $groupsAndUsers
   }
}
class VSTeamProcess {
   [string]$ID = $null
   [string]$URL = $null
   [string]$Description = $null
   [string]$Name = $null
   [bool]$IsDefault = $false
   [string]$Type = $null
   VSTeamProcess (
      [object]$obj
   )  {
      $this.ID = $obj.id
      $this.URL = $obj.url
      $this.IsDefault = $obj.isDefault
      $this.Name = $obj.name
      $this.Type = $obj.type
      if ($obj.PSObject.Properties.Match('description').count -gt 0) {
         $this.Description = $obj.description
      }
      $this.AddTypeName('Team.Process')
   }
   [void] hidden AddTypeName(
      [string] $name
   ) {
      $this.PSObject.TypeNames.Insert(0, $name)
   }
   [string]ToString() {
      return $this.Name
   }
}
class VSTeamRef : VSTeamLeaf {
   [VSTeamUserEntitlement]$Creator = $null
   [string]$RefName = $null
   VSTeamRef (
      [object]$obj,
      [string]$ProjectName
   ) : base($obj.name, $obj.objectId, $ProjectName) {
      $this.RefName = $obj.name
      $this.Creator = [VSTeamUserEntitlement]::new($obj.creator, $ProjectName)
      $this._internalObj = $obj
      $this.AddTypeName('Team.GitRef')
   }
}
class VSTeamTeam : VSTeamLeaf {
   [string]$Description = $null
   VSTeamTeam (
      [object]$obj,
      [string]$ProjectName
   ) : base($obj.name, $obj.Id, $ProjectName) {
      $this.Description = $obj.Description
      $this._internalObj = $obj
      $this.AddTypeName('Team.Team')
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamAccount : SHiPSDirectory {
   VSTeamAccount(
      [string]$Name
   ) : base($Name) {
      $this.AddTypeName('Team.Account')
      [VSTeamProjectCache]::timestamp = -1
   }
   [object[]] GetChildItem() {
      $topLevelFolders = @(
         [VSTeamPools]::new('Agent Pools'),
         [VSTeamExtensions]::new('Extensions')
      )
      if (_testFeedSupport) {
         $topLevelFolders += [VSTeamFeeds]::new('Feeds')
      }
      if(_testGraphSupport) {
         $topLevelFolders += [VSTeamPermissions]::new('Permissions')
      }
      $items = Get-VSTeamProject | Sort-Object Name
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.Project')
         $topLevelFolders += $item
      }
      return $topLevelFolders
   }
   [void] hidden AddTypeName(
      [string] $name
   ) {
      $this.PSObject.TypeNames.Insert(0, $name)
   }
}
# https://dev.azure.com/<organization>/_apis/securitynamespaces?api-version=5.0
[flags()] Enum VSTeamGitRepositoryPermissions
{
    Administer = 1
    GenericRead = 2
    GenericContribute = 4
    ForcePush = 8
    CreateBranch = 16
    CreateTag = 32
    ManageNote = 64
    PolicyExempt = 128
    CreateRepository = 256
    DeleteRepository = 512
    RenameRepository = 1024
    EditPolicies = 2048
    RemoveOthersLocks = 4096
    ManagePermissions = 8192
    PullRequestContribute = 16384
    PullRequestBypassPolicy = 32768
}
# https://dev.azure.com/<organization>/_apis/securitynamespaces?api-version=5.0
[flags()] Enum VSTeamIdentityPermissions
{
    Read = 1
    Write = 2
    Delete = 4
    ManageMembership = 8
    CreateScope = 16
    RestoreScope = 32
}
# https://dev.azure.com/<organization>/_apis/securitynamespaces?api-version=5.0
[flags()] Enum VSTeamProjectPermissions
{
    GENERIC_READ = 1
    GENERIC_WRITE = 2
    DELETE = 4
    PUBLISH_TEST_RESULTS = 8
    ADMINISTER_BUILD = 16
    START_BUILD = 32
    EDIT_BUILD_STATUS = 64
    UPDATE_BUILD = 128
    DELETE_TEST_RESULTS = 256
    VIEW_TEST_RESULTS = 512
    MANAGE_TEST_ENVIRONMENTS = 2048
    MANAGE_TEST_CONFIGURATIONS = 4096
    WORK_ITEM_DELETE = 8192
    WORK_ITEM_MOVE = 16384
    WORK_ITEM_PERMANENTLY_DELETE = 32768
    RENAME = 65536
    MANAGE_PROPERTIES = 131072
    MANAGE_SYSTEM_PROPERTIES = 262144
    BYPASS_PROPERTY_CACHE = 524288
    BYPASS_RULES = 1048576
    SUPPRESS_NOTIFICATIONS = 2097152
    UPDATE_VISIBILITY = 4194304
    CHANGE_PROCESS = 8388608
    AGILETOOLS_BACKLOG = 16777216
}
# https://dev.azure.com/<organization>/_apis/securitynamespaces?api-version=5.0
[flags()] Enum VSTeamWorkItemAreaPermissions
{
    GENERIC_READ = 1
    GENERIC_WRITE = 2
    CREATE_CHILDREN = 4
    DELETE = 8
    WORK_ITEM_READ = 16
    WORK_ITEM_WRITE = 32
    MANAGE_TEST_PLANS = 64
    MANAGE_TEST_SUITES = 128
}
# https://dev.azure.com/<organization>/_apis/securitynamespaces?api-version=5.0
[flags()] Enum VSTeamWorkItemIterationPermissions
{
    GENERIC_READ = 1
    GENERIC_WRITE = 2
    CREATE_CHILDREN = 4
    DELETE = 8
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamGroup : VSTeamLeaf {
   [string]$SubjectKind = $null
   [string]$Description = $null
   [string]$Domain = $null
   [string]$PrincipalName = $null
   [string]$MailAddress = $null
   [string]$Origin = $null
   [string]$OriginID = $null
   [string]$DisplayName = $null
   [string]$URL = $null
   [string]$Descriptor = $null
   [hashtable]$Links = $null
   VSTeamGroup (
      [object]$obj
   ) : base($obj.displayName, $obj.descriptor, $null) {
      $this.SubjectKind = $obj.subjectKind
      $this.Description = $obj.description
      $this.Domain = $obj.domain
      $this.PrincipalName = $obj.principalName
      $this.MailAddress = $obj.mailAddress
      $this.Origin = $obj.origin
      $this.OriginID = $obj.originId
      $this.DisplayName = $obj.displayName
      $this.ProjectName = $obj.principalName.Split('\')[0].Trim('[',']')
      $this.Links = @{
         'Self' = $obj._links.self.href;
         'Memberships' = $obj._links.memberships.href;
         'MembershipState'= $obj._links.membershipState.href;
         'StorageKey'= $obj._links.storageKey.href;
      }
      $this.URL = $obj.url
      $this.Descriptor = $obj.descriptor
      $this._internalObj = $obj
      $this.AddTypeName('Team.Group')
   }
   [string]ToString() {
      return $this.PrincipalName
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamDescriptor : VSTeamLeaf {
   [string]$Descriptor = $null
   [hashtable]$Links = $null
   VSTeamDescriptor (
      [object]$obj
   ) : base($obj.value, $obj.value, $null) {
      $this.Links = @{
         'Self' = $obj._links.self.href;
         'StorageKey' = $obj._links.storageKey.href;
         'Subject'= $obj._links.subject.href;
      }
      $this.Descriptor = $obj.value
      $this._internalObj = $obj
      $this.AddTypeName('Team.Descriptor')
   }
   [string]ToString() {
      return $this.Descriptor
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamSecurityNamespace : VSTeamLeaf {
   [string]$DisplayName = $null
   [string]$SeparatorValue = $null
   [int]$ElementLength = 0
   [int]$WritePermission = 0
   [int]$ReadPermission = 0
   [string]$DataspaceCategory = $null
   [string]$StructureValue = $null
   [string]$ExtensionType = $null
   [bool]$IsRemotable = $false
   [bool]$UseTokenTranslator = $false
   [int]$SystemBitMask = 0
   [hashtable[]]$Actions
   VSTeamSecurityNamespace (
      [object]$obj
   ) : base($obj.name, $obj.namespaceId, $null) {
      $this.Name = $obj.name
      $this.ID = $obj.namespaceId
      $this.DisplayName = $obj.displayName
      $this.SeparatorValue = $obj.separatorValue
      $this.ElementLength = $obj.elementLength
      $this.WritePermission = $obj.writePermission
      $this.ReadPermission = $obj.readPermission
      $this.DataspaceCategory = $obj.dataspaceCategory
      $this.StructureValue = $obj.structureValue
      $this.ExtensionType = $obj.extensionType
      $this.IsRemotable = $obj.isRemotable
      $this.UseTokenTranslator = $obj.useTokenTranslator
      $this.SystemBitMask = $obj.systemBitMask
      $this.Actions = @()
      foreach($action in $obj.actions)
      {
         $subAction = @{}
         $subAction.Bit = $action.bit
         $subAction.Name = $action.name
         $subAction.DisplayName = $action.displayName
         $this.Actions += $subAction
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.SecurityNamespace')
   }
   [string]ToString() {
      return $this.Name
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamAccessControlEntry : VSTeamLeaf {
   [string]$Descriptor = $null
   [int]$Allow = 0
   [int]$Deny = 0
   [PSCustomObject]$ExtendedInfo = @{}
   VSTeamAccessControlEntry (
      [object]$obj
   ) : base($obj.descriptor, $obj.descriptor, $null) {
      $this.Descriptor = $obj.descriptor
      $this.Allow = $obj.allow
      $this.Deny = $obj.deny
      if ([bool]($obj.PSobject.Properties.name -match "extendedInfo"))
      {
         $this.ExtendedInfo = $obj.extendedInfo
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.AccessControlEntry')
   }
   [string]ToString() {
      return "Descriptor=$($this.Descriptor); Allow=$($this.Allow); Deny=$($this.Deny); ExtendedInfo=$($this.ExtendedInfo)"
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamAccessControlList : VSTeamLeaf {
   [string]$Token = $null
   [bool]$InheritPermissions = $false
   [hashtable]$Aces = @{}
   VSTeamAccessControlList (
      [object]$obj
   ) : base($obj.token, $obj.token, $null) {
      $this.Token = $obj.token
      $this.InheritPermissions = $obj.inheritPermissions
      $props = Get-Member -InputObject $obj.acesDictionary -MemberType NoteProperty
      foreach($prop in $props) {
         $propValue = $obj.acesDictionary | Select-Object -ExpandProperty $prop.Name
         $aceObject = [VSTeamAccessControlEntry]::new($propValue)
         $this.Aces[$aceObject.Descriptor] = $aceObject
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.AccessControlList')
   }
   [string]ToString() {
      return $this.Descriptor
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamUser : VSTeamLeaf {
   [string]$SubjectKind = $null
   [string]$Domain = $null
   [string]$PrincipalName = $null
   [string]$MailAddress = $null
   [string]$Origin = $null
   [string]$OriginID = $null
   [string]$DisplayName = $null
   [string]$URL = $null
   [string]$Descriptor = $null
   [hashtable]$Links = $null
   [string]$MetaType = $null
   VSTeamUser (
      [object]$obj
   ) : base($obj.displayName, $obj.descriptor, $null) {
      $this.SubjectKind = $obj.subjectKind
      $this.Domain = $obj.domain
      $this.PrincipalName = $obj.principalName
      $this.MailAddress = $obj.mailAddress
      $this.Origin = $obj.origin
      $this.OriginID = $obj.originId
      $this.DisplayName = $obj.displayName
      if ($this.Origin -eq "aad" -and (Get-Member -inputobject $obj -name "metaType" -MemberType Properties))
      {
         $this.MetaType = $obj.metaType
      }
      $this.Links = @{
         'Self' = $obj._links.self.href;
         'Memberships' = $obj._links.memberships.href;
         'MembershipState' = $obj._links.membershipState.href;
         'StorageKey' = $obj._links.storageKey.href;
         'Avatar' = $obj._links.avatar.href;
      }
      $this.URL = $obj.url
      $this.Descriptor = $obj.descriptor
      $this._internalObj = $obj
      $this.AddTypeName('Team.User2')
   }
   [string]ToString() {
      return $this.PrincipalName
   }
}
class VSTeamClassificationNode : VSTeamLeaf {
    [guid]$Identifier
    [string]$StructureType = $null
    [bool]$HasChildren = $false
    [VSTeamClassificationNode[]]$Children = @()
    [string]$Path = $null
    [string]$Url = $null
    [string]$ParentUrl = $null
   VSTeamClassificationNode (
      [object]$obj,
      [string]$Projectname
   ) : base($obj.name, $obj.id, $Projectname) {
      Write-Verbose $obj
      $this.Identifier = $obj.identifier
      $this.Name = $obj.name
      $this.StructureType = $obj.structureType
      $this.HasChildren = $obj.hasChildren
      if (Get-Member -inputobject $obj -name "Path" -MemberType Properties)
      {
         $this.Path = $obj.Path
      }
      $this.Url = $obj.Url
      $this.Id = $obj.id
      if ($this.HasChildren -and (Get-Member -inputobject $obj -name "children" -MemberType Properties))
      {
         foreach ($child in $obj.children)
         {
            $childObject = [VSTeamClassificationNode]::new($child, $ProjectName)
            $this.Children += $childObject
         }
      }
      if ((Get-Member -inputobject $obj -name "_links" -MemberType Properties) -and (Get-Member -inputobject $obj._links -name "parent" -MemberType Properties))
      {
         $this.ParentUrl = $obj._links.parent.href
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.ClassificationNode')
   }
}
class VSTeamJobRequest : VSTeamLeaf {
   [datetime] $QueueTime
   [datetime] $AssignTime
   [datetime] $StartTime
   [datetime] $FinishTime
   [timespan] $Duration
   [string] $Type
   [string] $Result
   [string[]] $Demands
   [string] $Pipeline
   VSTeamJobRequest (
      [object]$obj
   ) : base($obj.owner.name, $obj.requestId, $null) {
      $this.Type = $obj.planType
      $this.Result = $obj.result
      $this.Demands = $obj.demands
      $this.QueueTime = $obj.queueTime
      $this.AssignTime = $obj.assignTime
      $this.StartTime = $obj.receiveTime
      $this.FinishTime = $obj.finishTime
      $this.Pipeline = $obj.definition.name
      if($null -ne $this.FinishTime) {
         $this.Duration = $this.FinishTime - $this.StartTime
      }
      $this._internalObj = $obj
      $this.AddTypeName('Team.JobRequest')
   }
}
class VSTeamReleaseDefinition : VSTeamLeaf {
   [string]$Url = ''
   [string]$Path = ''
   [int]$Revision = 0
   [object]$Tags = $null
   [string]$Description = ''
   [bool]$isDeleted = $false
   [object]$Triggers = $null
   [object]$Artifacts = $null
   [object]$Variables = $null
   [object]$Properties = $null
   [object]$Environments = $null
   [object]$VariableGroups = $null
   [string]$ReleaseNameFormat = ''
   [VSTeamUserEntitlement]$CreatedBy = $null
   [VSTeamUserEntitlement]$ModifiedBy = $null
   [datetime]$CreatedOn = [datetime]::MinValue
   [datetime]$ModifiedOn = [datetime]::MinValue
   [string]$createdByUser = ''
   VSTeamReleaseDefinition(
      [object]$obj,
      [string]$Projectname
   ) : base($obj.name, $obj.id.ToString(), $Projectname) {
      $this._internalObj = $obj
      $this.Url = $obj.url
      $this.Path = $obj.path
      $this.Revision = $obj.revision
      $this.CreatedOn = $obj.createdOn
      $this.isDeleted = $obj.isDeleted
      $this.ModifiedOn = $obj.modifiedOn
      $this.Properties = $obj.Properties
      $this.Description = $obj.Description
      $this.VariableGroups = $obj.VariableGroups
      $this.ReleaseNameFormat = $obj.releaseNameFormat
      $this.CreatedBy = [VSTeamUserEntitlement]::new($obj.createdBy, $null)
      $this.ModifiedBy = [VSTeamUserEntitlement]::new($obj.modifiedBy, $null)
      $this.createdByUser = $this.CreatedBy.DisplayName
      $this.SetProp($obj, 'tags')
      $this.SetProp($obj, 'variables')
      $this.SetProp($obj, 'triggers')
      $this.SetProp($obj, 'artifacts')
      $this.SetProp($obj, 'environments')
      $this.AddTypeName('Team.ReleaseDefinition')
      $this._internalObj._links.PSObject.TypeNames.Insert(0, 'Team.Links')
      $this._internalObj._links.self.PSObject.TypeNames.Insert(0, 'Team.Link')
      $this._internalObj._links.web.PSObject.TypeNames.Insert(0, 'Team.Link')
      $this._internalObj.createdBy.PSObject.TypeNames.Insert(0, 'Team.User')
      $this._internalObj.modifiedBy.PSObject.TypeNames.Insert(0, 'Team.User')
      if ($this._internalObj.PSObject.Properties.Match('artifacts').count -gt 0 -and $null -ne $this._internalObj.artifacts) {
         $this._internalObj.artifacts.PSObject.TypeNames.Insert(0, 'Team.Artifacts')
      }
      if ($this._internalObj.PSObject.Properties.Match('retentionPolicy').count -gt 0 -and $null -ne $this._internalObj.retentionPolicy) {
         $this._internalObj.retentionPolicy.PSObject.TypeNames.Insert(0, 'Team.RetentionPolicy')
      }
      if ($this._internalObj.PSObject.Properties.Match('lastRelease').count -gt 0 -and $null -ne $this._internalObj.lastRelease) {
         $this._internalObj.lastRelease.PSObject.TypeNames.Insert(0, 'Team.Release')
      }
   }
}
[SHiPSProvider(UseCache = $true)]
[SHiPSProvider(BuiltinProgress = $false)]
class VSTeamReleaseDefinitions : VSTeamDirectory {
   VSTeamReleaseDefinitions(
      [string]$Name,
      [string]$ProjectName
   ) : base($Name, $ProjectName) {
      $this.AddTypeName('Team.ReleaseDefinitions')
   }
   [object[]] GetChildItem() {
      $items = Get-VSTeamReleaseDefinition -ProjectName $this.ProjectName -ErrorAction SilentlyContinue | Sort-Object name
      $objs = @()
      foreach ($item in $items) {
         $item.AddTypeName('Team.Provider.ReleaseDefinition')
         $objs += $item;
      }
      return $objs
   }
}

