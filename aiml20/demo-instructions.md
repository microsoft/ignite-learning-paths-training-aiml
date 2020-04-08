# Demo Instructions for Presenters

Demo scripts are made available to everyone in this repo.

You should follow the same scripts for the presentations, but with the additional
notes given below.

Recordings of demos are also available as videos in the [PPT
Slides](presentations.md) (and also some additional videos linked below). You
can use the embedded videos instead of a live demo in the case of lack of
internet or other technical issues. (In this case, we recommend muting the audio
and speaking to the video yourself.) [Speaker notes](speaker-notes.md) are timed
to the events in the embedded videos.

## DEMO Setup

Before your presentation, run all of the instructions in the script below.

[Demo script](DEMO%20Setup.md)

## DEMO Computer Vision

[Demo script](DEMO%20Computer%20Vision.md)

### SLIDE: DEMO / shop by photo

Note the actual instructions for this demo are [here](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right).

### SLIDE: DEMO / cognitive services computer vision

[Demo script](DEMO%20Computer%20Vision.md#using-computer-vision-via-the-web-interface)

## DEMO Custom Vision

[Demo script](DEMO%20Custom%20Vision.md)

Do the first part of the demo ahead of time.

### SLIDE: DEMO / Customized object recognition

Start the live demo at "[Add images and train a model](DEMO%20Custom%20Vision.md#add-images-and-train-a-model)".

## DEMO ONNX Deployment

[Demo Script](DEMO%20ONNX%20deployment.md)

Run the section "[Load the simple ONNX model](DEMO%20ONNX%20deployment.md#load-the-simple-onnx-model)" ahead of time.

You did the section "[Defining the problem](DEMO%20ONNX%20deployment.md#defining-the-problem-shop-by-photo-doesnt-work-right)" at the beginning of the presentation, so skip that.

### SLIDE: DEMO / ONNX

Start the live demo at "Update the ONNX model in the Tailwind Traders website".

For viewing in Netron, you can view the file you exported from Custom Vision
directly, or you can use the pre-prepared one from the repo at `ONNX/custom model/products.onnx`

Note that when you deploy the file it **must** be called `products.onnx`, so
it's easiest to take the pre-prepared file by that name from your desktop,
rather than re-naming the exported file.

### SLIDE: DEMO / Personalizer

[Demo script](DEMO%20Personalizer.md)
