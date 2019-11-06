# Demo Instructions

Demo scripts are made available to the public at https://github.com/microsoft/ignite-learning-paths/tree/master/aiml/aiml20. 

You should follow the same scripts for the presentations, but with the additonal notes given below.

Recordings of demos are also available as MP4 files and linked below. You can
use these instead of a live demo in the case of lack of internet or other
technical issues. (In this case, we recommend muting the audio and speaking to
the video yourself.)

## DEMO Setup

Before your presentation, run all of the instructions in the script below.

Demo script: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Setup.md

## DEMO Computer Vision

Demo script: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Computer%20Vision.md

### SLIDE: DEMO / shop by photo

Note the actual instructions for this demo are [here](https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right).

Demo video: https://www.dropbox.com/s/ylxjuifg9x0h4n3/ITT-aiml20-demo1.mp4?dl=0 

### SLIDE: DEMO / cognitive services computer vision

Demo script: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface

## DEMO Custom Vision

Demo script: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Custom%20Vision.md

Do the first part of the demo ahead of time.

### SLIDE: DEMO / Customized object recognition

Start the live demo at "[Add images and train a model](https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Custom%20Vision.md#add-images-and-train-a-model)".

## DEMO ONNX Deployment

Demo Script: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20ONNX%20deployment.md

NOTE: The ONNX demo does not currently work in the standard Tailwind Traders
deployment. Instead, use this separate deployment for the ONNX part of the demo:

https://tailwind-traders-standalone-onnx.azurewebsites.net/

Run the section "[Load the simple ONNX model](https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)" ahead of time.

You did the section "[Defining the problem](https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)" at the beginning of the presentation, so skip that.

### SLIDE: DEMO / ONNX

Start the live demo at "Update the ONNX model in the Tailwind Traders website".

For viewing in Netron, you can view the file you exported from Custom Vision
directly, or you can use the pre-prepared one from the repo at
https://github.com/microsoft/ignite-learning-paths/raw/master/aiml/aiml20/ONNX/custom%20model/products.onnx

Note that when you deploy the file it **must** be called `products.onnx`, so
it's easiest to take the pre-prepared file by that name from your desktop,
rather than re-naming the exported file.

## DEMO Personalizer

Note: if you used the temporary deployment for the ONNX demo above, be sure to
use the standard deployment from the Deploy to Azure button (described in DEMO
Setup) here.

### SLIDE: DEMO / Personalizer

Demo script: https://github.com/microsoft/ignite-learning-paths/blob/master/aiml/aiml20/DEMO%20Personalizer.md
