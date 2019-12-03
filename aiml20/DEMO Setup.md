# Setup for AIML20 demos

These tasks were performed ahead of time for the AIML20 presentation. Follow
these same steps to prepare for the remaining demo scripts.

## Clone the repository to your local machine

You will need the contents of https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml20 on your local machine. The easiest way to do this is to visit the [Developer's Guide to AI Learning Paths repository](https://github.com/microsoft/ignite-learning-paths-training-aiml) and click the "Clone or download" button. We will refer to files relative to the `aiml20` folder.

## Sign up for an Azure Subscription

If you don't already have an Azure subscription, you can [sign up
here](https://azure.microsoft.com/free/?WT.mc_id=msignitethetour2019-github-aiml20)
and also get $200 in free Azure credits to use. 

## Find your Azure Subcription ID

In the [Azure Portal](https://portal.azure.com), sign in and click on
"Subscriptions" in the left menu bar. Click on the Subscription Name you will be
using, and copy the "Subscription ID" shown there. You'll need it later when you
create resources.

Alternatively, run `az account show` in the Azure CLI and copy the "id" value
shown.

## Start fresh.

 If you've run the demos before, delete these resource groups if they exist:
 
 - `aiml20-demo`

 You can use the Azure Portal, or run this command in the Azure CLI:

 ```sh
 az group delete --name aiml20-demo
 ```

## Deploy the Tailwind Traders website.

Click the button below. This will deploy
[TailwindTraders-Website](https://github.com/Microsoft/TailwindTraders-Website)
from Github, using an ARM
template
to enable the Personalizer integration and ONNX-based Shop by Photo feature. ([More details about this deployment](https://github.com/microsoft/TailwindTraders-Website/blob/master/Source/Tailwind.Traders.Web/Standalone/README.md).)

[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/?feature.customportal=false#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMicrosoft%2FTailwindTraders-Website%2Fmaster%2Fazuredeploy.json)

In the form that appears, select the following options:

* Subscription: Select the subscription in which to deploy the resources

* Resource Group: resources will be created in the resource group you specify.
  We recommend choosing "New" and entering the name `aiml20-demo`. When
  you're done, you can delete this resource group to shut down the site and
  delete all associated resources.

* Location: The Azure region where the resources will be deployed. You must
  be able to deploy SQL Database and App Services in that region. 

  Note: Since Personalizer is currently only available in WestUS2 and WestEurope, it will be deployed there regardless of what you choose.

* Site Name: This will be used in the site's URL and visible publicly, and must
  be globally unique. To avoid clashes, choose `aiml20-xy` replacing `xy` with your initials, but we will refer to this name as just `aiml20` in these scripts. (If you
  choose a name that is in use, you will get "Conflict" errors during the
  deployment.)

* Site Location: Enter the short version of "Location" above, e.g. `westus2`.
  (You can get a list of short names in the Azure CLI with: `az account
  list-locations -o table`).

* Deployment mode: Choose `standalone`

* SQL Login: Enter `twt`

* SQL Password: generate and use a secure password (it must include punctuation
  and mixed case, but do not use `;`). You won't need it for our demos, so no
  need to write it down.

* Enable Personalizer: choose `true`

* Repo URL: accept the default, `https://github.com/microsoft/TailwindTraders-Website`

* Branch: accept the default, `master`

(As a backup, you can also use the Repo URL
`https://github.com/revodavid/TailwindTraders-Website` with the branch `aiml20`.
This was forked on 2019-10-25 and is known to work.)

Check "I agree to the terms and condtions" and click "Purchase".

Allow at least 15 minutes for the site to deploy. 

The deployed website URL will be of the form SITENAME.azurewebsites.net (using the Site Name you provided above), or you can find it as follows:

* click "Go To Resource" under "Next Steps"

* Click the "App Service" resource

* Look at the "URL" value displayed in the right pane

The website URL will be displayed after the "Setting up Source Control" step, or you can inspect the "App Service" resource.

### Install the "Simple" ONNX model

Follow the instructions in [DEMO ONNX deployment.md](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model) under the heading "Load the Simple ONNX model". This will degrade the "Shop by Photo" tool in the app to only recognize hammers and drills.

## Configure Visual Studio Code

Install the extension [Azure
Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account).
(On Windows, you will also need to [install node.js](https://nodejs.org/).) In VS Code, log
into Azure with the "Azure: Sign In" command (use Control-Shift-P to open the
Command Palette). To run Azure CLI commands from a script in VS Code, use
"Terminal: Run Selected Text in Azure Terminal" to copy commands.)

Alternatively you can [install the Azure
CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest&WT.mc_id=msignitethetour2019-github-aiml20)
on your local Windows, MacOS or Linux machine. If you don't have it installed,
you can also launch the [Azure Cloud
Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview?WT.mc_id=msignitethetour2019-github-aiml20)
and run these commands from a browser window. 

## Prepare Visual Studio for demo

- Open `vision_demo.sh`
- launch a Cloud Shell with "Azure: Open Bash In Cloud Shell". (If you prefer, you can use the Azure CLI locally.)   

## Open browser pages ready to demo.

* The deployed Tailwind Trader app 
* https://portal.azure.com (browse to resources)  
* https://azure.microsoft.com/en-us/services/cognitive-services/computer-vision/
* https://customvision.ai
* https://lutzroeder.github.io/netron/

## Download image files to local machine

Download "CV Training Images.zip" to your local machine, and expand the zip
file. This will create a folder "CV Training Images" with the following
subfolders:

* drills
* hammers
* hard hats
* pliers
* screwdrivers

These images will be used to test the Computer Vision service and create a model
with the Custom Vision service.

These images were sourced from Wikimedia Commons and used under their respective
Creative Commons licenses. See the file [ATTRIBUTIONS.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/CV%20training%20images/ATTRIBUTIONS.md) for
details.

Also download the folder "test images". These images will not be used in
training, but will be used to test that our models are working.

## Next Step

[Computer Vision](DEMO%20Computer%20Vision.md)
