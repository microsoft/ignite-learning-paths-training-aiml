# AIML30 -Start Building Machine Learning Models Faster than You Think -Train the trainer

Tailwind Traders uses custom machine learning models to fix their inventory issues – without changing their Software Development Life Cycle! How? Azure Machine Learning Designer.
 
In this session, you’ll learn the data science process that Tailwind Traders’ uses and get an introduction to Azure Machine Learning Designer. You’ll see how to find, import, and prepare data, select a machine learning algorithm, train and test the model, and deploy a complete model to an API. Get the tips, best practices, and resources you and your development team need to continue your machine learning journey, build your first model, and more.


## Demo Environment Deployment
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcassieview%2Fignite-learning-paths-training-aiml%2Fmaster%2Faiml30%2Fdeploy.json" rel="nofollow">
 <img src="https://camo.githubusercontent.com/9285dd3998997a0835869065bb15e5d500475034/687474703a2f2f617a7572656465706c6f792e6e65742f6465706c6f79627574746f6e2e706e67" data-canonical-src="http://azuredeploy.net/deploybutton.png" style="max-width:100%;">
</a>


## Create Additional Resources Needed
Once you have created the base Azure Machine Learning Service Workspace we need to add additional compute resources.
### Create Compute Targets
1. Create Machine Learning Compute
    * Click on the nav "Compute"
    * Click "New"
    * Enter a name for the resource
    * Select "Machine Learning Compute" from the dropdown
    * Select the machine size
    * Enter the min and max nodes (recommend min of 0 and max of 5)
    * Click "Create"
    ![Create Compute](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateMlCompute.gif)
2. Create Kubernetes Compute
    * Click on the nav "Compute"
    * Click "New"
    * Enter a name for the resource
    * Select "Kubernetes Service" from the dropdown
    * Click "Create"
    ![Create Kubernetes](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateKubService.gif)


## Build Model with Azure Machine Learning Visual Designer

### 1. Upload the dataset to the Datasets in AML
* Download dataset to local from [here](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/datasets/ForecastingData.csv)
* Click `Datasets`
* Click `Create from local`
* Fill out the form and upload the dataset

### 2. Start Building the  Model

* Click `Designer` from the left nav
* Click plus sign to create a new Pipeline
* Expand `Datasets` and `My Datasets`
* Drag and drop the uploaded dataset onto the experiment workspace
* Drag the `Select Columns in Dataset` onto the workspace
    * Click `Edit columns` from the parameters menu on the right side.
    * Click `By Name`
    * Click `Add All`
    * Click `Minus` icon on the `Time` column to exclude it
* Drag the `Split Data` onto the workspace
    * Edit the parameters to split the data 70/30. 
    * This is not a rule and can change base on different model needs.
* Drag the `Train Model` onto the workspace
    * Select the label column name `Values` from the parameters on the right
* Drag the `Boosted Decision Tree Regression` onto the workspace
* Drag the `Score Model` onto the workspace
* Drag the `Evaluate` onto the workspace
* Connect the `Split Data` module to `Train Model` for the training data and `Score Model` for scoring the predicted results with unseen data.
* Connect `Train Model` to the training algorithm `Boosted Decision Tree Regression` module.
* Connect `Score Model` with the `Evaluate` module.
* Click the `Run` button in the bottom nav and select compute. 

* Rename the created column `Scored Labels` to `Forecast`
    * Drag the `Edit Metadata` onto the workspace
    * Connect `Score Model` with the `Edit Metadata` module
    * In the `Parameters` of the `Edit Metadata` module. Click `Edit Columns`
    * Type `Score Labels` into the text box (no need to change any of the defaults)
    * Click `Save`
    * Next update the `New Column Name` field on the `Parameters` to `Forecast`
* Transform the normalized value back to full item counts
    * Drag the `Apply Math Operation` onto the workspace
    * Connect `Edit Metadata` to `Apply Math Operation`
    * Set the `Basic math function` to `Exp`
    * Click `Edit Columns` and type `Value` and `Forecast`
    * Click `Save`
    * Set the `Output mode` to `Inplace`
* Drag the `Select Columns in Dataset` module onto the workspace
* Connect the `Apply Math Operation` to `Select Columns in Dataset`
* Click `Edit Columns` and type the following column names `ID1,ID2,Value,Forecast`
* These are the columns the data demo app will be expecting when we post to get a result from the completed and deployed model.
* Run the training

### 4. Create Inference Pipeline and Deploy the Model
* Click `Create inference pipeline` then select `Real-time inference pipeline`
* Ensure the `Web Service Output` is connected to the last data processing step module `Select Columns in Dataset`
* Click `Run`
* Click `Deploy`
* Navigate to the deployed web service from the left nav.
* Click on the name of the web service created in advance.
* Click `Test` and to see how it performs on a scored data item.
* Click `Consume` and to see the sample code provided for integrating the web service.

### 5. Test API with C# console app (dotnet core)

1. [Download VS Code here](https://code.visualstudio.com/download)
2. Clone the app with the following command
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
3. Navigate to project path
    * `cd ignite-learning-paths\aiml\aiml30\C#\IgniteAimlDataApp`
4. Open the project in VS Code
    * `code .`
5. Replace the local dataset with the downloaded dataset from the step above in the `IgniteAimlDataApp/Datasets` Folder.
6. To run the test
    * Copy the API key from the `Consume` tab
    * Open the `App.config` and paste it in the value attribute
    * Copy the `Request-Response Url` from the `Consume` tab
    * Open the `Program.cs` and paste the value in  `client.BaseAddress = new Uri("");`
    * Right click `Program.cs` and select `Open in Terminal`
    * Type the command `dotnet run` to run the console app
    * To use the default values of StoreID (ID1) of 2 and ItemID    (ID2) of 1 and the number of weeks to predict. Just type `y`
    * This will run and should return the predicted values for the  next 4 weeks.


### 6. Optional: Additionally Test API with Python in Notebook VMs using Jupyter Notebooks
1. Navigate to `Compute` and create a new Notebook VM
![Create Compute](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateNotebookVM.gif)
2. Once created under column `Application URI`click the `Jupyter Lab` option. (This will not display until the VM is in a `running` state.)
3. Click the terminal from the home page of Jupyter lab
4. Clone the repo from the terminal in Jupyter lab
    * `git clone https://github.com/microsoft/ignite-learning-paths-training-aiml.git`
5. Also in the terminal `pip install holidays`
6. Open the `ignite-learning-paths-training-aiml` cloned folder and navigate to the `ignite-ailml30-get-prediction.ipynb` file and click to open it.
    * The full path should be something like this: `ignite-learning-paths-training-aiml\aiml30\Python\ignite-ailml30-get-prediction.ipynb`
7. Update the path to the csv file, the endpoint and the key.
8. `SHIFT + Enter` or click play on each cell from the top menu to run each cell

## PowerPoint Deck and Video Demo

- [PowerPoint deck](presentations.md)

- [Demonstration videos](https://www.youtube.com/watch?v=u1ppYaZuNmo&feature=youtu.be)

## Resources and Continue Learning

Here is a list of related training and documentation.

- [What is the Designer for Azure Machine Learning?](https://docs.microsoft.com/en-us/azure/machine-learning/service/ui-concept-visual-interface?WT.mc_id=msignitethetour-slides-cxa)
- [Publish a Machine Learning Experiment with Microsoft Azure Machine Learning](https://docs.microsoft.com/en-us/learn/paths/publish-experiment-with-ml-studio/)


## Feedback loop

Do you have a comment, feedback, suggestion? Currently, the best feedback loop for content changes/suggestions/feedback is to create a new issue on this GitHub repository. To get all the details about how to create an issue please refer to the [Contributing](../../contributing.md) docs
