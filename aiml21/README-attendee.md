# Developers Guide to AI: A Data Story

In this theatre session we will show the data science process and how to apply it. From exploration of datasets to deployment of services - all applied to an interesting data story. This will also take you on a very brief tour of the Azure AI Platform.

# Demo Environment Deployment

Please download all the code and data files in this repository to get started. There is a code and data folder which will contain all information you need to run all demos

**You will need:**
* Azure Subscription - get a [free trial here](https://azure.microsoft.com/en-gb/free/?WT.mc_id=msignitethetour2019-github-aiml21) if you need it
* [Power BI Desktop (Windows Only)](https://powerbi.microsoft.com/en-us/desktop/?WT.mc_id=msignitethetour2019-github-aiml21) - if you are running on MacOS/Linux you can still demo the functionality from any modern web browser

**Setup Instructions:**
* Use the **Deploy to Azure button** below to create your Azure Machine Learning workspace

[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

* Log into the Azure Portal and your Azure Machine Learning Service
* Choose to Upgrade the workspace to the **Enterprise edition (Preview)** [see more information on current pricing here](https://azure.microsoft.com/en-us/pricing/details/machine-learning/) - you will need enterprise edition to complete the experiment demo (demo 2)
* Launch the **Preview UI**
* Create a **Notebook VM**
    * Select 'Compute' from left pane
    * Select 'New' under 'Notebook VMs'
    * Provide a 'Notebook VM Name' (all lowercase)
    * Keep the default size VM provided
    * Once created select 'Jupyter Link'
    * Enter the user folder by double clicking
    * Select the upload button and upload the files listed below:
        * [data/data_train.csv](data/data_train.csv)
        * [code/explore.ipynb](code/explore.ipynb)
        * [code/deploy.ipynb](code/deploy.ipynb)
        * [code/config.json](code/config.json)
    * Open [config.json](code/config.json) and enter your subscription key, resource group and Azure ML Workspace name and save the file

>Learn more about [Notebook VMs here](https://azure.microsoft.com/en-us/blog/three-things-to-know-about-azure-machine-learning-notebook-vm/?WT.mc_id=msignitethetour2019-github-aiml21)

* Create a **Compute Instance**
    * Select 'Compute' from left pane
    * Select 'New' under the 'Training Clusters' tab
    * Provide a 'Compute Name' (all lowercase)
    * Choose a VM size
        * For standard compute select something like 'Standard_DS2_v2'
        * For GPU compute select 'Standard_NC6'
    * Select 'Low Priority' for Virtual machine priority
    * Minimum number of nodes set to 0 (then it will scale down completely and reduce costs)
    * Set maximum nodes from 3-6
    * Click 'Create'

>Learn more about [Azure Machine Learning Compute here](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-set-up-training-targets#amlcompute/?WT.mc_id=msignitethetour2019-github-aiml21)

* Upload the **Dataset**
    * Select 'Datasets' from left pane
    * Select 'Create dataset' and then 'from local files'
    * Select the 'Browse' button and find the data_train_experiment.csv file
    * Select 'Next'
    * Review the data and select 'Next' and 'Next' again
    * Finally review the dataset settings and select 'Create'

>Learn more about [creating datasets here](https://docs.microsoft.com/en-us/azure/machine-learning/service/how-to-create-register-datasets/?WT.mc_id=msignitethetour2019-github-aiml21)

# Delivery of Assets

* [PowerPoint presentation](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml21/aiml21.pptx) or go to [presentations.md](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml21/presentations.md)
* [Datasets used](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/data)
* [Code files to run](https://github.com/microsoft/ignite-learning-paths-training-aiml/tree/master/aiml21/code)
* Separate Demo Videos: 
    * Demo 1 - [Explore](https://youtu.be/1Xtmrsfkzfs)
    * Demo 2 - [Experiment](https://youtu.be/sUKuRBRvo7U)
    * Demo 3 - [Deploy](https://youtu.be/IgSaMKsyexg)
    * Demo 4 - [Present](https://youtu.be/g7aBaC9s9qQ)

# Demo 1 - Explore

### Video Demo with Voice Over: [AIML21 - Demo 1 - Explore](https://youtu.be/1Xtmrsfkzfs)

* Sign into your [Azure Portal](https://azure.microsoft.com/en-gb/?WT.mc_id=msignitethetour2019-github-aiml21) and open **Azure Machine Learning** you created with the template above
* Launch the Preview experience by clicking **'Launch Preview Now'**
* Open **'Compute'** from the left pane
* Select the **'Jupyter'** Link on your Notebook VM
* *Log in if needed with your Azure Credentials*
* Open [**Explore.ipynb**](code/explore.ipynb)
* Run through all code cells using SHIFT + ENTER

# Demo 2 - Experiment

### Video Demo with Voice Over: [AIML21 - Demo 2 - Experiment](https://youtu.be/sUKuRBRvo7U)

* Go to [ml.azure.com](https://ml.azure.com/?WT.mc_id=msignitethetour2019-github-aiml21) Azure Machine Learning studio. You can access this via the URL directly and then sign in and select the correct workspace you created for this talk. Or from the Azure Machine Learning Service in the Azure portal selecting the **'Launch Preview now'** button
* Select **Automated ML** on the left pane
* **Review the video for all talking points for each demo**
* Click **'New automated ML run'**
* Select the training data dataset (data_train_experiment-XXXXXX)
* Provide an experiment name, example/ aiml21-regression-duration
* Select **Duration** for Target column
* Select the 'Training Cluster' of compute you setup above
* Select **Next**
* Select **Regression** for Prediction Task
* Select **'View additional configuration settings'** and set Primary metric to **'normalized_root_mean_squared_error'**
* Set Concurrency, Max concurrent iterations to 3
* Set Exit criterion, Training job time (hours) to 1
* Select **'Save'**
* Select **Finish**

> This will take a while to run - ~15 - 20 mins 

* Once completed review the output of the models run and find the best model

# Demo 3 - Deploy

### Video Demo with Voice Over: [AIML21 - Demo 3 - Deploy](https://youtu.be/IgSaMKsyexg)

* From the end of demo 2
* Start on the screen with the run **Automated ML experiment**
* Select the **'Deploy Best Model'** button
* Create a deployment name, example/ aiml21-v1
* Add a deployment description if you wish
* Compute Type set to ACI (Azure Container Instance)
* Keep Authentication Enabled
* Choose **Deploy** button

>This will take a while to run - ~20-30 mins

* Once complete select **Endpoints** on the left pane
* Select your Azure Container Instance model and review the details
* Select the browser tab with Jupyter open
* Open [**Deploy.ipynb**](code/deploy.ipynb)
* Confirm the [config.json](code/config.json) file is completed with the correct information from the setup stages
* Edit the 2nd cell to include the name of your deployed web service
* Run all cells in notebook and review output

# Demo 4 - Present

### Video Demo with Voice Over: [AIML21 - Demo 4 - Present](https://youtu.be/g7aBaC9s9qQ)

* Open [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21)
* Log in with your workplace credentials
* Click on Workspaces on the left pane
* Click Create a workspace
* Enter a workspace name
* Enter a description for the workspace
* Click Save
* Open Power BI Desktop with Present.pbix
* Interact with the data and visuals
* Click the Publish button
* Select the workspace name you just created
* Wait for the report to publish
* Go back to [powerbi.microsoft.com](http://powerbi.microsoft.com/?WT.mc_id=msignitethetour2019-github-aiml21) 
* Refresh the browser if needed
* See the report on the left pane in the web browser
* Click on the report and it will load

# Teardown Instructions

### Full Teardown

* Enter the Azure Portal and delete the Azure resource group to remove all resources for this project

### To Save Costs

* Make sure you select **shutdown** on your Notebook VM whenever not in use
* When not in use **delete** the Azure Container Instance in endpoints

# Resources and Continued Learning

**Microsoft Learn:**
* [Explore Data Science Tools in Azure](https://docs.microsoft.com/en-us/learn/paths/explore-data-science-tools-in-azure/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Introduction to Python](https://docs.microsoft.com/en-us/learn/modules/intro-to-python/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Automate the ML model selection with Azure Machine Learning service](https://docs.microsoft.com/en-us/learn/modules/automate-model-selection-with-azure-automl/?WT.mc_id=msignitethetour2019-github-aiml21)
* [Create and use analytics reports with Power BI](https://docs.microsoft.com/en-us/learn/paths/create-use-analytics-reports-power-bi/?WT.mc_id=msignitethetour2019-github-aiml21)

# Feedback Loop

Do you have a comment, feedback, suggestion? Currently, the best feedback loop for content changes/suggestions/feedback is to create a new issue on this GitHub repository. To get all the details about how to create an issue please refer to the [Contributing docs](https://github.com/microsoft/ignite-learning-paths/blob/master/contributing.md)
