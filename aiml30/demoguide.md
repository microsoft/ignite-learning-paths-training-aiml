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
    * Start at slide 21 and show the data prep in static slide steps.

# Demo 2: Build Model with Azure Machine Learning Visual Designer

### Full Model Building Live Demo Video [here](https://youtu.be/u1ppYaZuNmo?t=1278)

### Demo Broken Down into Steps

1. Create Azure Machine Learning Workspace Resource and Navigate to the new Workspace

Video Resources for this step:

* [Here](assets/CreateAMLNavToWorkspace.mp4) is video of this step without sound.
* [Here](https://youtu.be/u1ppYaZuNmo?t=1278) is video of how to create the resource with audio.

# Demo 3: Testing API with C# console app (dotnet core)