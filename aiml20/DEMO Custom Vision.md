# DEMO: Custom Vision

> 💡 You must have completed the [setup](https://github.com/microsoft/ignite-learning-paths-training-aiml/blob/master/aiml20/DEMO%20Setup.md) before attempting to do the demo.

In this demo, we create a custom vision model using the service at
customvision.ai.

## Create a custom model project with Custom Vision

TIP: You can do this section ahead of time, to save time in a live demo.

1. Sign into [Custom Vision](https://customvision.ai) and create a new project.
   [Follow the instructions
   here](https://docs.microsoft.com/azure/cognitive-services/custom-vision-service/getting-started-build-a-classifier?WT.mc_id=msignitethetour2019-github-aiml20).

1. Your new project should have the following settings:

    - Name: Tools
    - Description: Products sold by Tailwind   Traders
    - Resource: aiml20-cs-resource
    - Project Type: classification
    - Classification Types: Multiclass
    - Domains: Retail (compact)
    - Export capabilities: Basic Platforms

1. In the "Tags" tool in the left side, use the "+" button to add the following tags:

    - drill
    - hammer
    - pliers
    - screwdriver

1. We will now add images for each tag from the corresponding folder in "CV Training Images". Here's how to do it for "drill"

    - Click "Add Images" in the top row
    - Browse to CV Training Images / drills
    - Select all files: click one file, then press Control-A
    - Click Open
    - In the "Image Upload" dialog that appears next, select "drill" in "My Tags" and then click "Upload 16 Files"
    - repeat this process for the tags: hammer, pliers, screwdriver (we will do "hard hat" later)

## Add images and train a model

At Ignite Tour, the prior steps were all done ahead of time in preparation. Only
the remaining steps were done live, to save time.

1. If you haven't already, sign into customvision.ai and open your "tools" project.

1. This project has already been provided with images of drills, hammers, pliers, and screwdrivers. Let's add some images of hard hats as well.

- Click "Add Images" in the top row
- Browse to CV Training Images / hardhats
- Select all files: click one file, then press Control-A
- Click Open
- In the "Image Upload" dialog that appears next, select "hard hat" in "My Tags" and then click "Upload 16 Files"

1. Click "Performance" in the top menu bar, and then click the green "Train" button. Choose "Quick Training" and then click "Train"

1. Click on the most recent iteration in the left pane to see the results. You
   should have 90.9% Precision (how many of our training images does the model
   predict correctly?), 88.2% Recall (when we generate a prediction, is it
   correct?), and 98.7% AP (overall measure). Note that these depend on the
   probability threshold -- make this low if you want to avoid false positives.
   For our retail app, it's safe to make it high.

1. Test out the model with a new picture. Click "Quick Test" and "Browse Local
   Files", and then choose "test images / man in hardhat.jpg". See that it
   identifies as a hard hat with 99.9% probability. Try the same with "test images / drill.jpg", which is also identified correctly.

Now we will save the model in the ONNX format for integration into the Tailwind
Traders app.

1. Click Export, and choose "ONNX". Note the other platform-specific formats
   available as well.

1. Select the version ONNX 1.2, and then click Export. The TWT app expects a
   file called products.onnx, so we'll use the one that's already saved in the
   repo.

## Next Step

[ONNX Deployment](DEMO%20ONNX%20deployment.md)
