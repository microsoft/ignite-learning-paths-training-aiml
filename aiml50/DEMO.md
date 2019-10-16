# AIML50 - Demonstration Setup Instructions

## Setup Overview

1. Create Demonstration Environment
    1. Application environment in Azure App Service
    1. Azure Machine Learning Workspace
    1. Azure DevOps Project
1. Something next

## Create Demonstration Environment

### Prerequisites

An Azure DevOps organization that you have rights to add extensions to.

A Personal Access Token(PAT) for that organization.

### Deploy the Template

This environment can be deployed via the "Deploy to Azure" link below (or you can use Azure PowerShell or Azure CLI).  You will need an Azure subscription and the available quotas in a region to deploy:

* Azure SQL Databases
* Cosmos DB Databases
* Azure App Services
* Azure Machine Learning Services

You will be prompted to select an Azure subscription and resource group (you can create a resource group at that time).

You will also be asked for an event identifier (or reason for spinning up the environment) which will be used to help name the resources.  Shorter is better.

You will need to provide a database username and password for the Azure SQL instance.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fmicrosoft%2fignite-learning-paths-training-aiml%2fmaster%2faiml50%2ftemplate%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

The deployment takes roughly 30 to 40 minutes.

Once the deployment is underway (at least with the Azure Machine Learning service created and the bootstrap-container Azure Container instance has run to completion), you can finish setting up the Azure DevOps environment.  Most of the environment will be configured, but there are a few manual steps.

To start, navigate to the AIML50 project that was created in the Azure DevOps Organization you specified to to the deployment template.

#### Create the Service Connections

From the project page, navigate to the project settings.

Select `Service Connections` under `Pipelines`.

Add two service connections:

* First connection `aiml50`
    * Type: Azure Resource Manager
    * Connection name: `aiml50`
        * Name of the service connection. This needs to match, as it is already set in the build.
    * Scope level: `Subscription`
        * Scope of authorization for the service principal. For this one, set it to `subscription`.
    * Subscription: `Ignite The Tour`
        * The subscription you deployed the demo environment to. This may be different than the example above. You can pick subscriptions from the dropdown based on the user with which you logged in to Azure DevOps.
    * Resource Group: `aiml50` or blank
        * You can constrain the credentials to the resource group that you have deployed into or allow it rights across the subscription.
* Second connection: `aiml50-workspace`
    * Type: Azure Resource Manager
    * Connection name: `aiml50`
        * Name of the service connection. This needs to match, as it is already set in the build.
    * Scope level: `AzureMLWorkspace`
        * Scope of authorization for the service principal. This will be required for the release.
    * Subscription: `Ignite The Tour`
        * The subscription you deployed the demo environment to. This may be different than the example above. You can pick subscriptions from the dropdown based on the user with which you logged in to Azure DevOps.
    * Resource Group: `aiml50`
        * This should be the resource group with your Azure Machine Learning Workspace.
    * Machine Learning Workspace: `aiml50demo`
        * Your name will vary based on which event or qualifier you use to provision the environment.

![0-azure_devops_org](./images/0-azure_devops_org.png)
![1-azure_devops_project](./images/1-azure_devops_project.png)
![2-azure_devops_project_settings](./images/2-azure_devops_project_settings.png)
![3-azure_devops_service_connection](./images/3-azure_devops_service_connection.png)
![4-azure_devops_service_connection](./images/4-azure_devops_service_connection.png)
![5-azure_devops_service_connection_add](./images/5-azure_devops_service_connection_add.png)
![6-azure_devops_service_connection_detail](./images/6-azure_devops_service_connection_detail.png)


#### Enable the Variable Group

There is a variable group that was provisioned that has some shared values to be used by the build and release.  Pipeline access needs to be granted for the variable group.

* Navigate to Library (under Pipelines).
* Select the `aiml50-demo` variable group.
* Toggle `Allow access to all pipelines`
* Save the variable group.

![7-azure_devops_library](./images/7-azure_devops_library.png)
![8-azure_devops_library_detail](./images/8-azure_devops_library_detail.png)

#### Create the Build

Now, we need to create a build definition by pointing Azure DevOps to our build definition on GitHub.

* Navigate to `Pipelines` (under Pipelines).
* Select `New Pipeline`
* Connect to your fork of the GitHub project [Ignite Learning Paths Training AI/ML](https://github.com/microsoft/ignite-learning-paths-training-aiml)
* Choose to use the build definition from the repository (`aiml50/azure-pipelines.yml`)

![9-azure_devops_pipeline_new](./images/9-azure_devops_pipeline_new.png)
![10-azure_devops_pipeline_new_source](./images/10-azure_devops_pipeline_new_source.png)
![11-azure_devops_pipeline_select_repo](./images/11-azure_devops_pipeline_select_repo.png)
![12-azure_devops_pipeline_select_build_definition](./images/12-azure_devops_pipeline_select_build_definition.png)
![13-azure_devops_pipeline_select_build_definition_location](./images/13-azure_devops_pipeline_select_build_definition_location.png)

#### Run the Build

After the build is connected to the source repository, we need to run a build to create the Machine Learning pipeline and create a build artifact so we can finish setting up the release pipeline.

* Review the build definition and run the build. The build will complete in a few minutes, but it triggers a Machine Learning pipeline which can take about 20-40 minutes.

![14-azure_devops_pipeline_review_build_definition](./images/14-azure_devops_pipeline_review_build_definition.png)
![15-azure_devops_pipeline_build_result](./images/15-azure_devops_pipeline_build_result.png)

#### Update the Release

After the Machine Learning pipeline finishes, we can update the release pipeline.

*  Navigate to `Releases` (under Pipelines).
* Select `Release Seer` and choose `Edit`
    * Select `Add an artifact`
    * Set a `Source type` of `AzureML`
    * Set the service endpoint to `aiml50-workspace`
    * Set the Model Names to `seer`.  You will not be able to do this until the first ML Pipeline finishes.
    * Click `Add`
    * Click the lightning icon on the new artifact and enable the `Continuous deployment trigger`
* Next, open the `Deploy to ACI` environment.
* Click on `Agent Job`
    * Set `Agent Pool` to `Azure Pipelines`
    * Set `Agent Specification` to `ubuntu-18.04`
* Click on `Download deployment and inferencing code`
    * Set `Package name` to `seer_deployment`
* Click on `Azure ML Model Deploy`
    * Verify that Azure ML Workspace is set to either `$(subscription_workspace)` or `aiml-workspace`.
* Save the pipeline and create a new release.

![16-azure_devops_release_new](./images/16-azure_devops_release_new.png)
![17-azure_devops_release_edit](./images/17-azure_devops_release_edit.png)
![18-azure_devops_release_artifact](./images/18-azure_devops_release_artifact.png)
![19-azure_devops_release_artifact_set](./images/19-azure_devops_release_artifact_set.png)
![20-azure_devops_release_edit_2](./images/20-azure_devops_release_edit_2.png)
![21-azure_devops_release_task_agent](./images/21-azure_devops_release_task_agent.png)
![22-azure_devops_release_task_edit](./images/22-azure_devops_release_task_edit.png)
![23-azure_devops_release_task_verify](./images/23-azure_devops_release_task_verify.png)

## Troubleshooting and Reference

### Provider registration

The Tailwind Traders application uses many Azure services. In some cases, if a service has not yet been used in your subscription, a provider registration may be needed. The following commands will ensure your subscription is capable of running the Tailwind Traders application.

```
az provider register --namespace Microsoft.OperationalInsights
az provider register --namespace Microsoft.DocumentDB
az provider register --namespace Microsoft.DBforPostgreSQL
az provider register --namespace Microsoft.OperationsManagement
az provider register --namespace Microsoft.ContainerService
az provider register --namespace Microsoft.Sql
az provider register --namespace Microsoft.ContainerRegistry
```

### Source Repositories

https://github.com/microsoft/TailwindTraders

https://github.com/microsoft/TailwindTraders-Backend

https://github.com/microsoft/TailwindTraders-Website
