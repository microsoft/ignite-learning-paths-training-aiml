# Demo Guide
Make sure you have completed the [demo setup steps here](demosetup.md)

# Demo 1: Data Prep Demo with App
In the first demo highlight the data preparation that was discussed in the slides for Time Series models. Walk through step by step how to do this in the C# demo app. Make sure to highlight that this can be done in any language.

To navigate through code with `F12` and `CTRL-` shortcuts download the Visual Studio Shortcut Extension for VS Code [here](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings). This is super useful and keeps from having to scroll around trying to find things.

### Data Prep Demo Video [here](https://youtu.be/u1ppYaZuNmo?t=751)

### 1. Open the `IgniteAimlDataApp` App. I personally like to have this open before I start the talk so I can just flip to it.
* Open the `Program.cs` file
* Go to `GetProcessedDataForScore` method by right clicking and select `Go To Definition` or hitting `F12`
    * Load data from data source. In this example we are loading for a local excel file in the solution.
* `F12` to `AddWeeksToPredict` method and discuss logic.
    * Get latest date and add 4 future weeks from that date
    * Since the data is weekly and we want to know if a holiday occured during the week we calculate all dates that occured in the week and populate a collection called `DatesInWeek`
    * Next create time futures for the 4 future weeks added to the collection.
* `F12` to `CreateTimeFeatures` method from within `AddWeeksToPredict` logic and discuss logic.
    * Use the current time property to calculate the time and holiday features needed.
* `CTRL-` to navigate back to `AddWeeksToPredict`
* `F12` to `CreateFourierFeatures`
    * Calcuate Fourier Term features from the seasonality of 52 for our weekly data features. 
* `CTRL-` to navigate back to `GetProcessedDataForScore`
* `F12` to `CreateLagFeatures` method and discuss logic.
    * Add the 26 prior week sales values to the current row.
* `CTRL-` to navigate back to `GetProcessedDataForScore`

* Data Demo Backup Options
    * Use the embedded mp4 video in the hidden slide. Talk along side this video without sound.
    * Start at slide 21 and show the data prep code in static slide steps.

# Demo 2: Build Model with Azure Machine Learning Visual Designer

### Full Model Building Live Demo Video [here](https://youtu.be/u1ppYaZuNmo?t=1278)

### 1. Create Resource and Upload Dataset

* Create Azure Machine Learning Workspace Resource and Navigate to the new Workspace.
    * Review high level where the different tools are that was discussed in the slides.
    * Video Resources for this step:
        * [Here](https://globaleventcdn.blob.core.windows.net/assets/aiml/aiml30/CreateAMLNavToWorkspace.mp4) is video of this step without sound.
        * [Here](https://youtu.be/u1ppYaZuNmo?t=1278) is video of how to create the resource with audio.
* Upload the dataset to the Datasets in AML
    * Click `Datasets`
    * Click `Create from datastore`
        * NOTE: you should have already uploaded the dataset to the datastore in the demo setup steps.
    * Fill in required fields and select the `workspaceblobstorage` option
    * Click `Create`
    * Optional: Step through the data prep feature in the datasets upload for AML

### 2. Launch Visual Designer and Explain Tool Features

* Summarize the different modules in the left nav including the test datasets.

### 3. Start Building the  Model

* Drag and drop the dataset onto the experiment workspace
    * Note the file upload module as an option for getting data into workspace
* Drag the `Select Columns in Dataset` onto the workspace
    * Click `Edit columns` from the properties menu on the right side.
    * Click `All Columns`
    * Click `Exclude`
    * Click `column names`
    * Exclude the `Time` column
    * Exclude the `DatesInWeek`
    * NOTE: Optionally exclude these columns in the data edit feature when uploading the dataset to the workspace in the data prep steps during upload.
* Drag the `Split Data` onto the workspace
    * Edit the properties to split the data 70/30. 
    * Discuss that this is not a rule and can change base on different model needs.
* Drag the `Train Model` onto the workspace
    * Select the label column name `Values` from the properties on the right
* Drag the `Boosted Decision Tree Regression` onto the workspace
* Drag the `Score Model` onto the workspace
* Drag the `Evaluate` onto the workspace
* Connect the `Split Data` module to `Train Model` for the training data and `Score Model` for scoring the predicted results with unseen data.
* Connect `Train Model` to the training algorithm `Boosted Decision Tree Regression` module.
* Connect `Score Model` with the `Evaluate` module.
* This is normally where you would run the model _however_ it takes too long to run in the demo. Discuss how you would click the `Run` button in the bottom nav and select compute. This will segway nicely into talking about how to create compute resources in AML.

* These next steps will be part of the completed model but no need to actually create them in the live demo version that will not be trained.
    * Drag the `Execute Python Script` module onto the workspace and connect the `Score Model` module to it. 
    * Copy and paste this code in:
        * `import pandas as pd` </br>
           `import numpy as np` </br>

            `def azureml_main(dataframe1 = None, dataframe2 = None):` </br>
                `print(f'Input pandas.DataFrame #1: {dataframe1}')`</br>
                `df = dataframe1`</br>
                `df['Value'] = np.exp(df['Value'])`</br>
                `df['Forecast'] = np.exp(df['Scored Labels'])`</br>
                `return df`
    * Drag the `Select Columns in Dataset`
        * Select columns `ID1`, `ID2`, `Value` and `Forecast`
        * These are the columns the data demo app will be expecting when we post to get a result from the completed and deployed model.
### 4. Discuss Compute Target Creation
* Navigate back to AML
* Click the `Compute` navigation item
* Click `Add`
* Discuss the different compute types and what they are used for. The computes used for this demo are a `Machine Learning Compute` for training and the `Kubernetes Service` for deploying the API.

### 5. Explain Trained Model
* Navigate back to Visual Designer
* Right Click on the second module in the model to Visualize the data (most likely the `Select Columns in Dataset`)
* Quickly scroll through the data to show how the data looks.
* Click on a column and show how the the tool creates visualizations in the right panel.
* Visualize the `Score Model` module to show how the model predicted on the unseen data
* Visualize the `Evaluate Model` module and discuss the metrics used to score.
    * Click `More Help` in the right panel of the properties.
    * Highlight that every module has a link to the docs in the properties that will explain what the module is doing.
    * Scroll down and show the metrics explanations in the docs for the model.
### 6. Create Predictive Experiment and Deploy the Model
This is normally where you would create the `Predictive Experiment` to deploy it to a web service _however_ we have done these steps in advance. 
* Discuss these steps _do not do them live_:
    * Click `Create` predictive experiment. Think of the `Predictive Experiment` model as the production model that gets deployed to the web service. The     `Training Experiment` as the dev model.
    * Add the `Execute Python Script` and `Select Columns in Dataset` modules to    the created predictive experiment.
    * Run the experiment
    * Click `Deploy Web Service`
* After discussing the steps to create the `Predictive Experiment` navigate to the deployed web service from the left nav.
* Click on the name of the web service created in advance.
* Click `Test` and show how it performs on a scored data item.
* Click `Consume` and show the sample code provided for integrating the web service.


# Demo 3: Testing API with C# console app (dotnet core)
### API Demo Test Video [here](https://youtu.be/u1ppYaZuNmo?t=2136)

* Copy the API key from the `Consume` tab
* Open the `App.config` and paste it in the value attribute
* Copy the `Request-Response Url` from the `Consume` tab
* Open the `Program.cs` and paste the value in `client.BaseAddress = new Uri("");`
* Right click `Program.cs` and select `Open in Terminal`
* Type the command `dotnet run` to run the console app
* To use the default values of StoreID (ID1) of 2 and ItemID (ID2) of 1 and the number of weeks to predict. Just type `y`
* This will run and should return the predicted values for the next 4 weeks.