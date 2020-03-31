#!/usr/bin/env pwsh

'AZURE_DEVOPS_ORG_NAME', 'AZURE_DEVOPS_EXT_PAT', 'RESOURCE_GROUP' | foreach-object {
    if (-not (test-path "env:$_")) {
        throw "Missing required variable $_"
    }
}
if (-not (test-path env:SESSION_CODE)) {
    $env:SESSION_CODE = 'aiml50'
}
if (-not (test-path env:EVENT)) {
    $env:EVENT = 'demo'
}

$env:PSModulePath = "/modules:$env:PSModulePath"
import-module VSTeam

$ExtensionPublisher = 'ms-air-aiagility'
$ExtensionId = 'vss-services-azureml'
$RecreateRelease = $false

Write-Host "Connecting to $env:AZURE_DEVOPS_ORG_NAME"
Set-VSTeamAccount -account $env:AZURE_DEVOPS_ORG_NAME -PersonalAccessToken $env:AZURE_DEVOPS_EXT_PAT

Write-Host "Checking for an existing project."
$Project = Get-VSTeamProject | Where-Object { $_.Name -like $env:SESSION_CODE }
if (-not $Project) {
    Write-Host "Creating project $env:SESSION_CODE."
    $Project = Add-VSTeamProject -Name $env:SESSION_CODE
}
else {
    Write-Host "Found existing project $env:SESSION_CODE."
}

Set-VSTeamDefaultProject -Project $env:SESSION_CODE

if (-not (Get-VSTeamExtension | where-object { ($_.PublisherId -eq $ExtensionPublisher) -and ($_.ExtensionId -eq $ExtensionId) })) {
    Write-Host "Installing the Azure Machine Learning Extension to $env:AZURE_DEVOPS_ORG_NAME"
    Add-VSTeamExtension -PublisherId $ExtensionPublisher -ExtensionId $ExtensionId
}

Write-Host "Checking for existing Artifacts feed."
$PackageFeed = Get-VSTeamFeed | where-object { $_.name -like 'SeerPackages' }
if (-not $PackageFeed) {
    Write-Host "Creating new artifacts feed for Seer Packages"
    $PackageFeed = Add-VSTeamFeed -Name 'SeerPackages' -EnableUpstreamSources
}
else {
    Write-Host "Found existing artifacts feed."
}

Write-Host "Checking for existing variable group."
$VariableGroup = Get-VSTeamVariableGroup -Name aiml50-demo | Where-Object { $_.count -gt 0 } | Select-Object -first 1 -expand value
if (-not $VariableGroup) {
    Write-Host "Creating new variable group."
    $VariableGroup = Add-VSTeamVariableGroup -Name aiml50-demo -Description 'Shared Variables' -Type Vsts -Variables @{
        subscription           = @{
            value = "aiml50"
        }
        subscription_workspace = @{
            value = "aiml50-workspace"
        }
        resource_group         = @{
            value = $env:RESOURCE_GROUP
        }
        org_name               = @{
            value = $env:AZURE_DEVOPS_ORG_NAME
        }
        session                = @{
            value = $env:SESSION_CODE
        }
        event                  = @{
            value = $env:EVENT
        }
        computetarget          = @{
            value = "twtcluster"
        }
        datastorename          = @{
            value = "seerdata"
        }
        datastorepath          = @{
            value = "hardware"
        }
        package_feed           = @{
            value = $PackageFeed.Id
        }
        access_token           = @{
            value    = $env:AZURE_DEVOPS_EXT_PAT
            isSecret = $true
        }
    }

    $PatchBody = @(
            [pscustomobject]@{
                authorized = $true
                id = $VariableGroup.Id
                name = $VariableGroup.Name
                type = 'variablegroup'
            }
        )

    Write-Host "Enabling the variable group for all pipelines"
    Invoke-VSTeamRequest -method PATCH -Url "https://dev.azure.com/$env:AZURE_DEVOPS_ORG_NAME/$($Project.Id)/_apis/build/authorizedresources?api-version=5.1-preview.1" -body "[$($PatchBody | ConvertTo-Json)]" -ContentType 'application/json'
}
else {
    Write-Host "Found existing variable group."
}

az login --identity
$Subscription = az account show | convertfrom-json

Write-Host "Checking for existing service endpoint aiml50."
$SubscriptionEndpoint = Get-VSTeamServiceEndpoint | Where-Object { $_.name -like 'aiml50' }
if (-not $SubscriptionEndpoint) {
    Write-Host "Creating service endpoint aiml50."
    $SubscriptionEndpoint = Add-VSTeamAzureRMServiceEndpoint -subscriptionName $Subscription.name -subscriptionId $Subscription.id -subscriptionTenantId $Subscription.tenantId -endpointName aiml50
    $PatchBody = [pscustomobject]@{
        allPipelines = [pscustomobject]@{
            authorized   = $true
            authorizedBy = $null
            authorizedOn = $null
        }
        pipelines    = $()
        resource     = [pscustomobject]@{
            id   = $SubscriptionEndpoint.id
            type = 'endpoint'
            name = ''
        }
    }
    Write-Host "Enabling aiml50 for all pipelines."
    Invoke-VSTeamRequest -method PATCH -Url "https://dev.azure.com/$env:AZURE_DEVOPS_ORG_NAME/$($Project.Id)/_apis/pipelines/pipelinePermissions/endpoint/$($SubscriptionEndpoint.id)?api-version=5.1-preview.1 " -body ($PatchBody | convertto-json) -ContentType 'application/json' -verbose
}

Write-Host "Checking for existing service endpoint aiml50-workspace."
$WorkspaceEndpoint = Get-VSTeamServiceEndpoint | Where-Object { $_.name -like 'aiml50-workspace' }
if (-not $WorkspaceEndpoint) {
    Write-Host "Creating service endpoint aiml50-workspace."
    $obj = @{
        authorization = @{
            parameters = @{
                serviceprincipalid  = $null
                serviceprincipalkey = $null
                tenantid            = $Subscription.tenantId
            }
            scheme     = 'ServicePrincipal'
        }
        data          = @{
            scopeLevel          = 'AzureMLWorkspace'
            subscriptionId      = $Subscription.Id
            subscriptionName    = $Subscription.Name
            resourceGroupName   = $env:RESOURCE_GROUP
            mlWorkspaceName     = $env:SESSION_CODE + $env:EVENT
            mlWorkspaceLocation = (az group show --name $env:RESOURCE_GROUP --query location -o tsv)
            creationMode        = 'Automatic'
        }
        url           = 'https://management.azure.com/'
    }

    $WorkspaceEndpoint = Add-VSTeamServiceEndpoint -endpointType 'azurerm' -endpointName 'aiml50-workspace' -object $obj
    $PatchBody = [pscustomobject]@{
        allPipelines = [pscustomobject]@{
            authorized   = $true
            authorizedBy = $null
            authorizedOn = $null
        }
        pipelines    = $()
        resource     = [pscustomobject]@{
            id   = $WorkspaceEndpoint.id
            type = 'endpoint'
            name = ''
        }
    }
    Write-Host "Enabling aiml50-workspace for all pipelines."
    Invoke-VSTeamRequest -method PATCH -Url "https://dev.azure.com/$env:AZURE_DEVOPS_ORG_NAME/$($Project.Id)/_apis/pipelines/pipelinePermissions/endpoint/$($WorkspaceEndpoint.id)?api-version=5.1-preview.1 " -body ($PatchBody | ConvertTo-Json) -ContentType 'application/json' -verbose
}

Write-Host "Checking for existing release."
$Release = Get-VSTeamReleaseDefinition | Where-Object { $_.name -like 'Release Seer' }
if ((-not $Release) -or $RecreateRelease) {
    if ($RecreateRelease -and $Release) {
        Remove-VSTeamReleaseDefinition -Id $Release.Id
    }
    start-sleep -seconds 60
    Write-Host "Creating new release."
    $json = get-content ./ReleaseSeer.json -Raw
    $ExecutionContext.InvokeCommand.ExpandString($json) | out-file ./ReleaseSeer-evaluated.json
    $Release = Add-VSTeamReleaseDefinition -InFile ./ReleaseSeer-evaluated.json
}

$SessionAndEvent = $env:SESSION_CODE + $env:EVENT
$SQLConnectionString = "Server=tcp:$($SessionAndEvent)-sqlsvr.database.windows.net,1433;Initial Catalog=$($SessionAndEvent)-sqldb;Persist Security Info=False;User ID=$env:SQL_LOGIN;Password=$env:SQL_PASSWORD;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"


if (test-path env:MANAGED_IDENTITY) {
    /azcopy_linux_amd64*/azcopy login --identity --identity-resource-id $env:MANAGED_IDENTITY
    /azcopy_linux_amd64*/azcopy sync "/images/hardware" "https://$($SessionAndEvent)storage.blob.core.windows.net/seer-container/hardware" --recursive=true
    /azcopy_linux_amd64*/azcopy sync "/images/product-detail" "https://$($SessionAndEvent)storage.blob.core.windows.net/product-images" --recursive=true

}

do {
    Start-Sleep -Seconds 10
    Write-Host "Checking for the website to be up."
    $response = invoke-webrequest -UseBasicParsing -Uri "$SessionAndEvent.azurewebsites.net"
} while ($response.StatusCode -ne 200)
Write-Host "Website is up."

$Success = $false
$Count = 0
do {
    if ($Count -gt 0) {
        Start-Sleep -Seconds 120
        Write-Host "Retrying.."
    }

    Write-Host "Connecting to the SQL Database to add a wrench."
    $conn = New-Object System.Data.SqlClient.SqlConnection($SQLConnectionString)
    try {
        #Open the Connection
        $conn.Open()
        # Prepare the SQL
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = @'
IF NOT EXISTS
(
    SELECT 1
    FROM Products
    WHERE Id = 71 AND Name = 'Basic Wrench' and ImageName = 'wrench.jpg'
)
BEGIN
    INSERT INTO [dbo].[Products]
    (Id, Name, Price, ImageName, BrandId, TypeId, TagId)
    VALUES
    (71, 'Basic Wrench', 100, 'wrench.jpg', 2, 7, 0)
END
'@
        $cmd.ExecuteNonQuery()
        $Success = $true
        Write-Host "Created wrench record."
    }
    catch {
        Write-Host "Unable to connect or there was an error writing the record."
        Write-Host "Failed connection string: "
        Write-Host "$SqlConnectionString"
        Write-Error $_
    }
    finally {
        $conn.Close()
    }

    $Count++
} while ((-not $Success) -and ($Count -le 10))

if (-not $Success) {
    throw "You may need to manually add a wrench record.  This script could not connect to the target database."
}
else {
    Write-Host "You are ready to go"
}

