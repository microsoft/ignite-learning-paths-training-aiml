# Bootstrap Container

This container image helps fill gaps in the provisioning process.

## Contents

Based on the PowerShell Core container

Software:

* Curl
* Wget
* Azure CLI
* Azure DevOps extension to the Az CLI
* AzCopy
* VSTeam PowerShell module (and supporting modules)

Content files:

* ReleaseSeer.json - Azure DevOps Release template
* Images - training images and product images for the website (pulled from the event CDN at container build time)

## Bootstrap process

The container starts a PowerShell script that (in this order):

* Verifies or creates a project named `AIML50` in the targeted Azure DevOps organization.
* Verifies or adds the `ms-air-aiagility/vss-services-azureml` extension to the organization
* Verifies or creates an artifact feed called `SeerPackages`
* Verifies or creates a variable group called `aiml50-demo`
* Verifies or imports the ReleaseSeer release definition
* Copies the image files out to the Azure storage created by the deployment template
* Begins to poll for the Tailwind Traders site to be up and running. (Polls every 10 seconds.)
  * This polling will, once the site is running, trigger the scaffolding of the database project, allowing the next step to proceed.
* Connect to the Azure SQL Database to insert a record for a wrench (Attempts up to 5 times with 120 sleep in between attempts)
  * Checks for an existing ID number and inserts if missing.

If the bootstrap container fails to run, it should be able to re-run without affecting already configured parts.
