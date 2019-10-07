# Demo Guide
Make sure you have completed the [demo setup steps here](demosetup.md)

# Demo 1: Data Prep Demo with App
In the first demo highlight the data preparation that was discussed in the slides for Time Series models. Walk through step by step how to do this in the C# demo app. Make sure to highlight that this can be done in any language.

To navigate through code with `F12` and `CTRL-` shortcuts download the Visual Studio Shortcut Extension for VS Code [here]("https://marketplace.visualstudio.com/items?itemName=ms-vscode.vs-keybindings"). This is super useful and keeps from having to scroll around trying to find things.

### Data Prep Demo Video [here](https://youtu.be/u1ppYaZuNmo?t=751)

1. Open the `IgniteAimlDataApp` App. I personally like to have this open before I start the talk so I can just flip to it.
2. Open the `Program.cs` file
3. Go to `GetProcessedDataForScore` method by right clicking and select `Go To Definition` or hitting `F12`
    * Load data from data source. In this example we are loading for a local excel file in the solution.
4. `F12` to `AddWeeksToPredict` method and discuss logic.
    * Get latest date and add 4 future weeks from that date
    * Since the data is weekly and we want to know if a holiday occured during the week we calculate all dates that occured in the week and populate a collection called `DatesInWeek`
    * Next create time futures for the 4 future weeks added to the collection.
5. `F12` to `CreateTimeFeatures` method from within `AddWeeksToPredict` logic and discuss logic.
    * Use the current time property to calculate the time and holiday features needed.
6. `CTRL-` to navigate back to `AddWeeksToPredict`
7. `F12` to `CreateFourierFeatures`
    * Calcuate Fourier Term features from the seasonality of 52 for our weekly data features. 
8. `CTRL-` to navigate back to `GetProcessedDataForScore`
9. `F12` to `CreateLagFeatures` method and discuss logic.
    * Add the 26 prior week sales values to the current row.
10. `CTRL-` to navigate back to `GetProcessedDataForScore`

* Data Demo Backup Options
    * Use the embedded mp4 video in the hidden slide. Talk along side this video without sound.
    * Start at slide 21 and show the data prep code in static slide steps.

# Demo 2: Build Model with Azure Machine Learning Visual Designer

### Full Model Building Live Demo Video [here](https://youtu.be/u1ppYaZuNmo?t=1278)

### 1. Create Resource and Upload Dataset
* Create Azure Machine Learning Workspace Resource and Navigate to the new Workspace.
    * Review high level where the different tools are that was discussed in the slides.
    * Video Resources for this step:
        * [Here](assets/CreateAMLNavToWorkspace.mp4) is video of this step without sound.
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
### 4. Discuss Compute Target Creation


# Demo 3: Testing API with C# console app (dotnet core)