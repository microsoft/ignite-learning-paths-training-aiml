# Show Faulty Prediction and Make a Change

## Show the Faulty Prediction

* Navigate to the Tailwind Traders website
    * https://aiml50{eventname}.azurewebsites.net (replace {eventname} with the event name parameter you used to create the demo environment)

* Click on `start smart shopping by uploading a photo`
* Upload an image from the [test images folder](../source/test-images)
* The model provides an incorrect prediction.

## Start the Change

* Adjust the model by changing `setup_pipeline.py`
  * Lines 162 - Change `epochs` to 20
  * Lines 163 - Change `batch` to 10
* Commit the change and push to master.  This will trigger a build and deployment of the model.  This process will take about 25 or 30 minutes, which should finish up towards the end of the talk.
* We'll come back and check the results of this towards the end of talk